#ifndef _TEST_OPENSSL_KEXCH_H_
#define _TEST_OPENSSL_KEXCH_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "test_openssl_common.h"

int ssl_kexch_config(TC_CONF *conf, SSL *ssl);

int do_negotiated_kexch_validation(TC_CONF *conf, SSL *ssl);

int tc_conf_kexch(TC_CONF *conf);

#ifdef __cplusplus
}
#endif

#endif
