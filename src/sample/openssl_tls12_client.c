#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <errno.h>

#include "openssl/crypto.h"
#include "openssl/ssl.h"

#include "test_common.h"

#define CAFILE1 EC256_CAFILE1

int load_ca_cert(SSL_CTX *ctx, const char *ca_file)
{
    if (SSL_CTX_load_verify_locations(ctx, ca_file, NULL) != 1) {
        printf("Load CA cert failed\n");
        return -1;
    }

    printf("Loaded cert %s on context\n", ca_file);
    return 0;
}

SSL_CTX *create_context()
{
    SSL_CTX *ctx;

    ctx = SSL_CTX_new(TLS_client_method());
    if (!ctx) {
        printf("SSL ctx new failed\n");
        return NULL;
    }

    printf("SSL context created\n");

    if (load_ca_cert(ctx, CAFILE1)) {
        goto err_handler;
    }

    SSL_CTX_set_verify(ctx, SSL_VERIFY_PEER, NULL);
    SSL_CTX_set_verify_depth(ctx, 5);
    SSL_CTX_set_options(ctx, SSL_OP_NO_TLSv1_3);

    printf("SSL context configurations completed\n");

    return ctx;
err_handler:
    SSL_CTX_free(ctx);
    return NULL;
}

SSL *create_ssl_object(SSL_CTX *ctx)
{
    SSL *ssl;
    int fd;

    fd = do_tcp_connection(SERVER_IP, SERVER_PORT);
    if (fd < 0) {
        printf("TCP connection establishment failed\n");
        return NULL;
    }

    ssl = SSL_new(ctx);
    if (!ssl) {
        printf("SSL object creation failed\n");
        return NULL; 
    }

    SSL_set_fd(ssl, fd);

    printf("SSL object creation finished\n");

    return ssl;
}

int do_data_transfer(SSL *ssl)
{
    const char *msg = MSG_FOR_OPENSSL_CLNT;
    char buf[MAX_BUF_SIZE] = {0};
    int ret;
    ret = SSL_write(ssl, msg, strlen(msg));
    if (ret <= 0) {
        printf("SSL_write failed ret=%d\n", ret);
        return -1;
    }
    printf("SSL_write[%d] sent %s\n", ret, msg);

    ret = SSL_read(ssl, buf, sizeof(buf) - 1);
    if (ret <= 0) {
        printf("SSL_read failed ret=%d\n", ret);
        return -1;
    }
    printf("SSL_read[%d] %s\n", ret, buf);
    return 0;
}

int tls12_client()
{
    SSL_CTX *ctx;
    SSL *ssl = NULL;
    int fd;
    int ret;

    ctx = create_context();
    if (!ctx) {
        return -1;
    }

    ssl = create_ssl_object(ctx);
    if (!ssl) {
        goto err_handler;
    }

    fd = SSL_get_fd(ssl);

    ret = SSL_connect(ssl); 
    if (ret != 1) {
        printf("SSL connect failed%d\n", ret);
        goto err_handler;
    }
    printf("SSL connect succeeded\n");

    if (do_data_transfer(ssl)) {
        printf("Data transfer over TLS failed\n");
        goto err_handler;
    }
    printf("Data transfer over TLS succeeded\n");
    SSL_shutdown(ssl);
    SSL_free(ssl);
    SSL_CTX_free(ctx);
    close(fd);

    return 0;
err_handler:
    if (ssl) {
        SSL_free(ssl);
    }
    SSL_CTX_free(ctx);
    close(fd);
    return -1;
}

int main()
{
    printf("OpenSSL version: %s, %s\n", OpenSSL_version(OPENSSL_VERSION), OpenSSL_version(OPENSSL_BUILT_ON));
    if (tls12_client()) {
        printf("TLS12 client connection failed\n");
        return -1;
    }
    return 0;
}
