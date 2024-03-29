#!/usr/bin/python3

import pytest

from common import *

filename = os.path.basename(__file__)

@pytest.fixture
def tc_setup():
    '''Initializes log file in TWT log module'''
    TWT_set_log_filename(filename)

@pytest.mark.parametrize("app1, app2, app1_args, app2_args, app1_res, app2_res", [
    # Test with all ecdhe kexch alg
    ('test_openssl', 'test_openssl', ' -S -k 1 -m ', ' -k 1 -m ', 0, 0),

    # Test with kexchange set as string using SSL_set1_groups_list API on client
    ('test_openssl', 'test_openssl', ' -S -k 1 -m ', ' -k 3 -m ', 0, 0),

    #('test_openssl', 'test_openssl', ' -S -k 2 -m ', ' -k 2 m ', 0, 0), #Test with all FFDHE alg

    # Test with kexchange set as string using SSL_set1_groups_list API on both client and server
    ('test_openssl', 'test_openssl', ' -S -k 3 -m ', ' -k 3 m ', 0, 0), #ECDHE kexch
    #('test_openssl', 'test_openssl', ' -S -k 4 -m ', ' -k 4 m ', 0, 0), #FFDHE kexch

    # TODO Pass SSL error code to valide in testcode
    # Test with only FFDHE kexch alg on TLS1.2 server and client
    #('test_openssl', 'test_openssl', ' -S -k 2 -V 12 -m ', ' -k 2 -V 12 -m ', 255, 255),
    # Test with only FFDHE kexch alg on TLS1.2 client
    #('test_openssl', 'test_openssl', ' -S -k 2 -V 13 -m ', ' -k 2 -V 12 -m ', 255, 255),
])

def test_openssl_kexch(tc_setup, app1, app2, app1_args, app2_args, app1_res, app2_res):
    assert run_serv_clnt_app([app1, app2, app1_args, app2_args, app1_res, app2_res]) == 0
