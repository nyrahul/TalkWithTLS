SRC_DIR=src
BIN_DIR=bin
OBJ_DIR=obj

OPENSSL = openssl
WOLFSSL = wolfssl

# Sample binaries
OPENSSL_SAMPLE_NB_CLNT = openssl_nb_client
OPENSSL_SAMPLE_NB_SERV = openssl_nb_server
OPENSSL_D12_CLNT = openssl_dtls12_client
OPENSSL_D12_SERV = openssl_dtls12_server
OPENSSL_D12_CUSTOM_BIO_CLNT = openssl_dtls12_custom_bio_client
OPENSSL_D12_NB_CLNT = openssl_dtls12_nb_client
OPENSSL_D12_NB_SERV = openssl_dtls12_nb_server
TLS12_SERV = openssl_tls12_server
TLS12_CLNT = openssl_tls12_client
TLS12_SERV = openssl_tls12_server
TLS12_VERF_CB_CLNT = openssl_tls12_verify_cb_client
TLS12_VERF_CB_SERV = openssl_tls12_verify_cb_server
TLS13_CLNT = openssl_tls13_client
TLS13_SERV = openssl_tls13_server
TLS13_CLNT_DHE = openssl_tls13_dhe_client
TLS13_SERV_DHE = openssl_tls13_dhe_server
TLS13_RESUMPTION_CLNT = openssl_tls13_resumption_client
TLS13_RESUMPTION_SERV = openssl_tls13_resumption_server
WOLFSSL_TLS13_SERV_SAMPLE = wolfssl_tls13_server
WOLFSSL_TLS13_CLNT_SAMPLE = wolfssl_tls13_client

# Test binaries
OPENSSL_TLS13_SERV = openssl_t13_server
OPENSSL_TLS13_CLNT = openssl_t13_client
WOLFSSL_TLS13_SERV = wolfssl_t13_server
WOLFSSL_TLS13_CLNT = wolfssl_t13_client

TARGET=$(BIN_DIR)/$(OPENSSL_SAMPLE_NB_CLNT) \
	$(BIN_DIR)/$(OPENSSL_SAMPLE_NB_SERV) \
	$(BIN_DIR)/$(OPENSSL_D12_CLNT) \
	$(BIN_DIR)/$(OPENSSL_D12_SERV) \
	$(BIN_DIR)/$(OPENSSL_D12_CUSTOM_BIO_CLNT) \
	$(BIN_DIR)/$(OPENSSL_D12_NB_CLNT) \
	$(BIN_DIR)/$(OPENSSL_D12_NB_SERV) \
	$(BIN_DIR)/$(TLS12_CLNT) \
    $(BIN_DIR)/$(TLS12_SERV) \
    $(BIN_DIR)/$(TLS13_CLNT_DHE) \
    $(BIN_DIR)/$(TLS13_SERV_DHE) \
    $(BIN_DIR)/$(TLS12_VERF_CB_CLNT) \
    $(BIN_DIR)/$(TLS12_VERF_CB_SERV) \
    $(BIN_DIR)/$(TLS13_CLNT) \
    $(BIN_DIR)/$(TLS13_SERV) \
    $(BIN_DIR)/$(TLS13_RESUMPTION_CLNT) \
    $(BIN_DIR)/$(TLS13_RESUMPTION_SERV) \
	$(BIN_DIR)/$(OPENSSL_TLS13_SERV) \
	$(BIN_DIR)/$(OPENSSL_TLS13_CLNT) \
	$(BIN_DIR)/$(WOLFSSL_TLS13_SERV) \
	$(BIN_DIR)/$(WOLFSSL_TLS13_CLNT) \
	$(BIN_DIR)/$(WOLFSSL_TLS13_SERV_SAMPLE) \
	$(BIN_DIR)/$(WOLFSSL_TLS13_CLNT_SAMPLE)

COMMON_SRC=$(SRC_DIR)/common
TEST_TLS13_SRC=$(SRC_DIR)/tls1.3
SAMPLE_SRC=$(SRC_DIR)/sample

COMM_SRC_FILES=$(wildcard $(COMMON_SRC)/*.c)

# Sample Code Srcs
WOLFSSL_TLS13_SERV_SAMPLE_SRC=$(SAMPLE_SRC)/$(WOLFSSL_TLS13_SERV_SAMPLE).c $(COMM_SRC_FILES)
WOLFSSL_TLS13_CLNT_SAMPLE_SRC=$(SAMPLE_SRC)/$(WOLFSSL_TLS13_CLNT_SAMPLE).c $(COMM_SRC_FILES)
OPENSSL_SAMPLE_NB_CLNT_SRC=$(SAMPLE_SRC)/$(OPENSSL_SAMPLE_NB_CLNT).c $(COMM_SRC_FILES)
OPENSSL_SAMPLE_NB_SERV_SRC=$(SAMPLE_SRC)/$(OPENSSL_SAMPLE_NB_SERV).c $(COMM_SRC_FILES)
OPENSSL_D12_CLNT_SRC=$(SAMPLE_SRC)/$(OPENSSL_D12_CLNT).c $(COMM_SRC_FILES)
OPENSSL_D12_SERV_SRC=$(SAMPLE_SRC)/$(OPENSSL_D12_SERV).c $(COMM_SRC_FILES)
OPENSSL_D12_CUSTOM_BIO_CLNT_SRC=$(SAMPLE_SRC)/$(OPENSSL_D12_CUSTOM_BIO_CLNT).c $(COMM_SRC_FILES)
OPENSSL_D12_NB_CLNT_SRC=$(SAMPLE_SRC)/$(OPENSSL_D12_NB_CLNT).c $(COMM_SRC_FILES)
OPENSSL_D12_NB_SERV_SRC=$(SAMPLE_SRC)/$(OPENSSL_D12_NB_SERV).c $(COMM_SRC_FILES)

TLS12_SERV_SRC=$(SAMPLE_SRC)/$(TLS12_SERV).c $(COMM_SRC_FILES)
TLS12_CLNT_SRC=$(SAMPLE_SRC)/$(TLS12_CLNT).c $(COMM_SRC_FILES)
TLS12_SERV_SRC=$(SAMPLE_SRC)/$(TLS12_SERV).c $(COMM_SRC_FILES)
TLS12_VERF_CB_CLNT_SRC=$(SAMPLE_SRC)/$(TLS12_VERF_CB_CLNT).c $(COMM_SRC_FILES)
TLS12_VERF_CB_SERV_SRC=$(SAMPLE_SRC)/$(TLS12_VERF_CB_SERV).c $(COMM_SRC_FILES)
TLS13_CLNT_SRC=$(SAMPLE_SRC)/$(TLS13_CLNT).c $(COMM_SRC_FILES)
TLS13_SERV_SRC=$(SAMPLE_SRC)/$(TLS13_SERV).c $(COMM_SRC_FILES)
TLS13_CLNT_DHE_SRC=$(SAMPLE_SRC)/$(TLS13_CLNT_DHE).c $(COMM_SRC_FILES)
TLS13_SERV_DHE_SRC=$(SAMPLE_SRC)/$(TLS13_SERV_DHE).c $(COMM_SRC_FILES)
TLS13_RESUMPTION_CLNT_SRC=$(SAMPLE_SRC)/$(TLS13_RESUMPTION_CLNT).c $(COMM_SRC_FILES)
TLS13_RESUMPTION_SERV_SRC=$(SAMPLE_SRC)/$(TLS13_RESUMPTION_SERV).c $(COMM_SRC_FILES)

# Test code Srcs
OPENSSL_TLS13_SERV_SRC=$(TEST_TLS13_SRC)/$(OPENSSL_TLS13_SERV).c $(COMM_SRC_FILES)
OPENSSL_TLS13_CLNT_SRC=$(TEST_TLS13_SRC)/$(OPENSSL_TLS13_CLNT).c $(COMM_SRC_FILES)
WOLFSSL_TLS13_SERV_SRC=$(TEST_TLS13_SRC)/$(WOLFSSL_TLS13_SERV).c $(COMM_SRC_FILES)
WOLFSSL_TLS13_CLNT_SRC=$(TEST_TLS13_SRC)/$(WOLFSSL_TLS13_CLNT).c $(COMM_SRC_FILES)

# Sample Code Objs
WOLFSSL_TLS13_SERV_SAMPLE_OBJ=$(addprefix $(OBJ_DIR)/,$(WOLFSSL_TLS13_SERV_SAMPLE_SRC:.c=.o))
WOLFSSL_TLS13_CLNT_SAMPLE_OBJ=$(addprefix $(OBJ_DIR)/,$(WOLFSSL_TLS13_CLNT_SAMPLE_SRC:.c=.o))
OPENSSL_SAMPLE_NB_CLNT_OBJ=$(addprefix $(OBJ_DIR)/,$(OPENSSL_SAMPLE_NB_CLNT_SRC:.c=.o))
OPENSSL_SAMPLE_NB_SERV_OBJ=$(addprefix $(OBJ_DIR)/,$(OPENSSL_SAMPLE_NB_SERV_SRC:.c=.o))
OPENSSL_D12_CLNT_OBJ=$(addprefix $(OBJ_DIR)/,$(OPENSSL_D12_CLNT_SRC:.c=.o))
OPENSSL_D12_SERV_OBJ=$(addprefix $(OBJ_DIR)/,$(OPENSSL_D12_SERV_SRC:.c=.o))
OPENSSL_D12_CUSTOM_BIO_CLNT_OBJ=$(addprefix $(OBJ_DIR)/,$(OPENSSL_D12_CUSTOM_BIO_CLNT_SRC:.c=.o))
OPENSSL_D12_NB_CLNT_OBJ=$(addprefix $(OBJ_DIR)/,$(OPENSSL_D12_NB_CLNT_SRC:.c=.o))
OPENSSL_D12_NB_SERV_OBJ=$(addprefix $(OBJ_DIR)/,$(OPENSSL_D12_NB_SERV_SRC:.c=.o))

TLS12_CLNT_OBJ=$(addprefix $(OBJ_DIR)/,$(TLS12_CLNT_SRC:.c=.o))
TLS12_SERV_OBJ=$(addprefix $(OBJ_DIR)/,$(TLS12_SERV_SRC:.c=.o))
TLS12_VERF_CB_CLNT_OBJ=$(addprefix $(OBJ_DIR)/,$(TLS12_VERF_CB_CLNT_SRC:.c=.o))
TLS12_VERF_CB_SERV_OBJ=$(addprefix $(OBJ_DIR)/,$(TLS12_VERF_CB_SERV_SRC:.c=.o))
TLS13_CLNT_OBJ=$(addprefix $(OBJ_DIR)/,$(TLS13_CLNT_SRC:.c=.o))
TLS13_SERV_OBJ=$(addprefix $(OBJ_DIR)/,$(TLS13_SERV_SRC:.c=.o))
TLS13_CLNT_DHE_OBJ=$(addprefix $(OBJ_DIR)/,$(TLS13_CLNT_DHE_SRC:.c=.o))
TLS13_SERV_DHE_OBJ=$(addprefix $(OBJ_DIR)/,$(TLS13_SERV_DHE_SRC:.c=.o))
TLS13_RESUMPTION_SERV_OBJ=$(addprefix $(OBJ_DIR)/,$(TLS13_RESUMPTION_SERV_SRC:.c=.o))
TLS13_RESUMPTION_CLNT_OBJ=$(addprefix $(OBJ_DIR)/,$(TLS13_RESUMPTION_CLNT_SRC:.c=.o))

# Test code Objs
OPENSSL_TLS13_SERV_OBJ=$(addprefix $(OBJ_DIR)/,$(OPENSSL_TLS13_SERV_SRC:.c=.o))
OPENSSL_TLS13_CLNT_OBJ=$(addprefix $(OBJ_DIR)/,$(OPENSSL_TLS13_CLNT_SRC:.c=.o))
WOLFSSL_TLS13_SERV_OBJ=$(addprefix $(OBJ_DIR)/,$(WOLFSSL_TLS13_SERV_SRC:.c=.o))
WOLFSSL_TLS13_CLNT_OBJ=$(addprefix $(OBJ_DIR)/,$(WOLFSSL_TLS13_CLNT_SRC:.c=.o))

DEPENDENCY_DIR=dependency
OPENSSL_1_1_1=openssl-1.1.1a
OPENSSL_1_1_1_DIR=$(DEPENDENCY_DIR)/$(OPENSSL_1_1_1)
OPENSSL_1_1_1_LIBS=$(OPENSSL_1_1_1_DIR)/libssl.a
WOLFSSL_MASTER=wolfssl-master
WOLFSSL_DIR=$(DEPENDENCY_DIR)/$(WOLFSSL_MASTER)
WOLFSSL_LIBS=$(WOLFSSL_DIR)/src/.libs/libwolfssl.so
DEPENDENCY = $(OPENSSL_1_1_1_LIBS) $(WOLFSSL_LIBS)

ifeq ($(ADDRSAN),1)
	SANFLAGS = -fsanitize=address
endif
ifeq ($(LEAKSAN),1)
	SANFLAGS = -fsanitize=leak
endif

CFLAGS = -g -ggdb -Wall -Werror $(SANFLAGS) -I $(COMMON_SRC)
OPENSSL_CFLAGS = $(CFLAGS) -I $(OPENSSL_1_1_1_DIR)/include
WOLFSSL_CFLAGS = $(CFLAGS) -I $(WOLFSSL_DIR)
LDFLAGS = $(OPENSSL_1_1_1_DIR)/libssl.a $(OPENSSL_1_1_1_DIR)/libcrypto.a -lpthread -ldl $(SANFLAGS)
WOLFSSL_LDFLAGS = -L $(BIN_DIR) -lwolfssl $(SANFLAGS)

CC = gcc
CP = cp
RM = rm

#.PHONY all init_task clean

all : init_task $(TARGET)

$(OBJ_DIR)/$(COMMON_SRC)%.o:$(COMMON_SRC)%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR)/$(SAMPLE_SRC)/$(OPENSSL)%.o:$(SAMPLE_SRC)/$(OPENSSL)%.c
	$(CC) $(OPENSSL_CFLAGS) -c $< -o $@

$(OBJ_DIR)/$(SAMPLE_SRC)/$(WOLFSSL)%.o:$(SAMPLE_SRC)/$(WOLFSSL)%.c
	$(CC) $(WOLFSSL_CFLAGS) -c $< -o $@

$(OBJ_DIR)/$(TEST_TLS13_SRC)/$(OPENSSL)%.o:$(TEST_TLS13_SRC)/$(OPENSSL)%.c
	$(CC) $(OPENSSL_CFLAGS) -c $< -o $@

$(OBJ_DIR)/$(TEST_TLS13_SRC)/$(WOLFSSL)%.o:$(TEST_TLS13_SRC)/$(WOLFSSL)%.c
	$(CC) $(WOLFSSL_CFLAGS) -c $< -o $@

build_dependency:$(DEPENDENCY)

#TODO Add build for OpenSSL-master
#TODO Generate exes from different openssl version

$(OPENSSL_1_1_1_LIBS): $(OPENSSL_1_1_1_DIR).tar.gz
	@echo "Building $(OPENSSL_1_1_1_DIR)..."
	@cd $(DEPENDENCY_DIR) && tar -zxvf $(OPENSSL_1_1_1).tar.gz > /dev/null
	@cd $(OPENSSL_1_1_1_DIR) && ./config -d > /dev/null
	@cd $(OPENSSL_1_1_1_DIR) && make > /dev/null

WOLFSSL_CONF_ARGS=--enable-tls13 --enable-harden --enable-debug

$(WOLFSSL_LIBS): $(WOLFSSL_DIR)
	@echo "Building $(WOLFSSL_DIR)..."
	@cd $(WOLFSSL_DIR) && autoreconf -i > /dev/null
	@cd $(WOLFSSL_DIR) && ./configure $(WOLFSSL_CONF_ARGS) > /dev/null
	@cd $(WOLFSSL_DIR) && make

init_task: build_dependency
	@mkdir -p $(BIN_DIR)
	@mkdir -p $(OBJ_DIR)
	@mkdir -p $(OBJ_DIR)/$(COMMON_SRC)
	@mkdir -p $(OBJ_DIR)/$(SAMPLE_SRC)
	@mkdir -p $(OBJ_DIR)/$(TEST_TLS13_SRC)
	@cp $(WOLFSSL_LIBS)* $(BIN_DIR)

$(BIN_DIR)/$(OPENSSL_SAMPLE_NB_CLNT):$(OPENSSL_SAMPLE_NB_CLNT_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(OPENSSL_SAMPLE_NB_SERV):$(OPENSSL_SAMPLE_NB_SERV_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(OPENSSL_D12_CLNT):$(OPENSSL_D12_CLNT_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(OPENSSL_D12_NB_SERV):$(OPENSSL_D12_NB_SERV_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(OPENSSL_D12_NB_CLNT):$(OPENSSL_D12_NB_CLNT_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(OPENSSL_D12_SERV):$(OPENSSL_D12_SERV_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(OPENSSL_D12_CUSTOM_BIO_CLNT):$(OPENSSL_D12_CUSTOM_BIO_CLNT_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(TLS13_RESUMPTION_SERV):$(TLS13_RESUMPTION_SERV_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(TLS13_RESUMPTION_CLNT):$(TLS13_RESUMPTION_CLNT_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(TLS13_SERV_DHE):$(TLS13_SERV_DHE_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(TLS13_CLNT_DHE):$(TLS13_CLNT_DHE_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(TLS13_CLNT):$(TLS13_CLNT_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(TLS13_SERV):$(TLS13_SERV_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(TLS12_CLNT):$(TLS12_CLNT_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(TLS12_SERV):$(TLS12_SERV_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(TLS12_VERF_CB_CLNT):$(TLS12_VERF_CB_CLNT_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(TLS12_VERF_CB_SERV):$(TLS12_VERF_CB_SERV_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(OPENSSL_TLS13_SERV):$(OPENSSL_TLS13_SERV_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(OPENSSL_TLS13_CLNT):$(OPENSSL_TLS13_CLNT_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(WOLFSSL_TLS13_SERV):$(WOLFSSL_TLS13_SERV_OBJ)
	$(CC) $^ $(WOLFSSL_LDFLAGS) -o $@

$(BIN_DIR)/$(WOLFSSL_TLS13_CLNT):$(WOLFSSL_TLS13_CLNT_OBJ)
	$(CC) $^ $(WOLFSSL_LDFLAGS) -o $@

$(BIN_DIR)/$(WOLFSSL_TLS13_SERV_SAMPLE):$(WOLFSSL_TLS13_SERV_SAMPLE_OBJ)
	$(CC) $^ $(WOLFSSL_LDFLAGS) -o $@

$(BIN_DIR)/$(WOLFSSL_TLS13_CLNT_SAMPLE):$(WOLFSSL_TLS13_CLNT_SAMPLE_OBJ)
	$(CC) $^ $(WOLFSSL_LDFLAGS) -o $@

clean:
	@$(RM) -rf *.o *.a
	@$(RM) -rf $(TARGET)
	@$(RM) -rf $(OBJ_DIR) $(BIN_DIR)
