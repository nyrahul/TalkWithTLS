#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <errno.h>

#include "wolfssl/options.h"
#include "wolfssl/wolfcrypt/settings.h"
#include "wolfssl/ssl.h"

#include "test_common.h"

#define CAFILE1 "./certs/ECC_Prime256_Certs/rootcert.pem"

int g_kexch_groups[] = {
    WOLFSSL_FFDHE_2048,
    WOLFSSL_ECC_SECP256R1
};

void ssl_init()
{
    printf("wolfSSL Version: %s\n", LIBWOLFSSL_VERSION_STRING);
    wolfSSL_Init();
}

void ssl_fini()
{
    wolfSSL_Cleanup();
}

void *create_ssl_context()
{
    WOLFSSL_CTX *ctx;

    ctx = wolfSSL_CTX_new(wolfTLSv1_3_client_method_ex(NULL));
    if (!ctx) {
        printf("SSL ctx new failed\n");
        return NULL;
    }

    printf("wolfSSL context created\n");

    if (wolfSSL_CTX_load_verify_locations(ctx, CAFILE1, NULL) != 1) {
        printf("Load CA cert failed\n");
        goto err_handler;
    }

    printf("Loaded cert %s on context\n", CAFILE1);

    wolfSSL_CTX_set_verify(ctx, SSL_VERIFY_PEER, NULL);
    wolfSSL_CTX_set_verify_depth(ctx, 5);

    printf("wolfSSL context configurations completed\n");

    return ctx;
err_handler:
    wolfSSL_CTX_free(ctx);
    return NULL;
}

void *create_ssl_object(void *ctx_in)
{
    WOLFSSL_CTX *ctx = (WOLFSSL_CTX *)ctx_in;
    WOLFSSL *ssl;
    int fd;
    int i;

    fd = do_tcp_connection(SERVER_IP, SERVER_PORT);
    if (fd < 0) {
        printf("TCP connection establishment failed\n");
        return NULL;
    }

    ssl = wolfSSL_new(ctx);
    if (!ssl) {
        printf("SSL object creation failed\n");
        return NULL; 
    }

    wolfSSL_set_fd(ssl, fd);

    for (i = 0; i < (int)(sizeof(g_kexch_groups)/sizeof(g_kexch_groups[0])); i++) {
        if (wolfSSL_UseSupportedCurve(ssl, g_kexch_groups[i]) != 1) {
            printf("Set supported group %d failed\n", g_kexch_groups[i]);
            goto err_handler;
        }
        if (wolfSSL_UseKeyShare(ssl, g_kexch_groups[i]) != 1) {
            printf("Use key share for group %d failed\n", g_kexch_groups[i]);
            goto err_handler;
        }
    }

    printf("SSL object creation finished\n");

    return ssl;
err_handler:
    wolfSSL_free(ssl);
    return NULL;
}

int do_data_transfer(void *ssl_in)
{
    const char *msg = MSG_FOR_WOLFSSL_CLNT;
    WOLFSSL *ssl = (WOLFSSL *)ssl_in;
    char buf[MAX_BUF_SIZE] = {0};
    int ret;
    ret = wolfSSL_write(ssl, msg, strlen(msg));
    if (ret <= 0) {
        printf("wolfSSL_write failed ret=%d\n", ret);
        return -1;
    }
    printf("wolfSSL_write[%d] sent %s\n", ret, msg);

    ret = wolfSSL_read(ssl, buf, sizeof(buf) - 1);
    if (ret <= 0) {
        printf("wolfSSL_read failed ret=%d\n", ret);
        return -1;
    }
    printf("wolfSSL_read[%d] %s\n", ret, buf);
    return 0;
}

void do_cleanup(void *ctx_in, void *ssl_in)
{
    WOLFSSL_CTX *ctx = (WOLFSSL_CTX *)ctx_in;
    WOLFSSL *ssl = (WOLFSSL *)ssl_in;
    int fd;
    if (ctx) {
        wolfSSL_CTX_free(ctx);
    }
    if (ssl) {
        fd = wolfSSL_get_fd(ssl);
        wolfSSL_free(ssl);
        close(fd);
    }
}

int tls13_client()
{
    void *ctx;
    void *ssl = NULL;
    int ret_val = -1;
    int ret;

    ssl_init();

    ctx = create_ssl_context();
    if (!ctx) {
        return -1;
    }

    ssl = create_ssl_object(ctx);
    if (!ssl) {
        goto err_handler;
    }

    ret = wolfSSL_connect(ssl);
    if (ret != 1) {
        printf("wolfSSL connect failed%d\n", ret);
        goto err_handler;
    }
    printf("wolfSSL connect succeeded\n");

    if (do_data_transfer(ssl)) {
        printf("Data transfer over TLS failed\n");
        goto err_handler;
    }
    printf("Data transfer over TLS succeeded\n");
    wolfSSL_shutdown(ssl);
    ret_val = 0;
err_handler:
    do_cleanup(ctx, ssl);
    ssl_fini();
    return ret_val;
}

int main()
{
    if (tls13_client()) {
        printf("TLS13 client connection failed\n");
        fflush(stdout);
        return -1;
    }
    return 0;
}
