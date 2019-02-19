SRC_DIR=src
BIN_DIR=bin
OBJ_DIR=obj
TLS12_CLIENT = tls12_client
TLS12_SERVER = tls12_server
TLS12_VERF_CB_CLIENT = tls12_verify_cb_client
TLS12_VERF_CB_SERVER = tls12_verify_cb_server
TLS13_CLIENT = tls13_client
TLS13_SERVER = tls13_server
TLS13_CLIENT_DHE = tls13_client_dhe
TLS13_SERVER_DHE = tls13_server_dhe
TLS13_RESUMPTION_CLIENT = tls13_resumption_client
TLS13_RESUMPTION_SERVER = tls13_resumption_server
OPENSSL = openssl
OPENSSL_TLS13_SERVER = openssl_tls13_server
OPENSSL_TLS13_CLIENT = openssl_tls13_client
WOLFSSL = wolfssl
WOLFSSL_TLS13_SERVER = wolfssl_tls13_server
WOLFSSL_TLS13_CLIENT = wolfssl_tls13_client
WOLFSSL_TLS13_SERVER_SAMPLE = wolfssl_tls13_server_sample
WOLFSSL_TLS13_CLIENT_SAMPLE = wolfssl_tls13_client_sample

TARGET=$(BIN_DIR)/$(TLS12_CLIENT) \
    $(BIN_DIR)/$(TLS12_SERVER) \
    $(BIN_DIR)/$(TLS13_CLIENT_DHE) \
    $(BIN_DIR)/$(TLS13_SERVER_DHE) \
    $(BIN_DIR)/$(TLS12_VERF_CB_CLIENT) \
    $(BIN_DIR)/$(TLS12_VERF_CB_SERVER) \
    $(BIN_DIR)/$(TLS13_CLIENT) \
    $(BIN_DIR)/$(TLS13_SERVER) \
    $(BIN_DIR)/$(TLS13_RESUMPTION_CLIENT) \
    $(BIN_DIR)/$(TLS13_RESUMPTION_SERVER) \
	$(BIN_DIR)/$(OPENSSL_TLS13_SERVER) \
	$(BIN_DIR)/$(OPENSSL_TLS13_CLIENT) \
	$(BIN_DIR)/$(WOLFSSL_TLS13_SERVER) \
	$(BIN_DIR)/$(WOLFSSL_TLS13_CLIENT) \
	$(BIN_DIR)/$(WOLFSSL_TLS13_SERVER_SAMPLE) \
	$(BIN_DIR)/$(WOLFSSL_TLS13_CLIENT_SAMPLE)

COMMON_SRC=$(SRC_DIR)/common
TEST_TLS13_SRC=$(SRC_DIR)/tls1.3
SAMPLE_SRC=$(SRC_DIR)/sample

COMM_SRC_FILES=$(wildcard $(COMMON_SRC)/*.c)
TLS12_CLIENT_SRC=$(TLS12_CLIENT).c $(COMM_SRC_FILES)
TLS12_SERVER_SRC=$(TLS12_SERVER).c $(COMM_SRC_FILES)
TLS12_VERF_CB_CLIENT_SRC=$(TLS12_VERF_CB_CLIENT).c $(COMM_SRC_FILES)
TLS12_VERF_CB_SERVER_SRC=$(TLS12_VERF_CB_SERVER).c $(COMM_SRC_FILES)
TLS13_CLIENT_SRC=$(TLS13_CLIENT).c $(COMM_SRC_FILES)
TLS13_SERVER_SRC=$(TLS13_SERVER).c $(COMM_SRC_FILES)
TLS13_CLIENT_DHE_SRC=$(TLS13_CLIENT_DHE).c $(COMM_SRC_FILES)
TLS13_SERVER_DHE_SRC=$(TLS13_SERVER_DHE).c $(COMM_SRC_FILES)
TLS13_RESUMPTION_CLIENT_SRC=$(TLS13_RESUMPTION_CLIENT).c $(COMM_SRC_FILES)
TLS13_RESUMPTION_SERVER_SRC=$(TLS13_RESUMPTION_SERVER).c $(COMM_SRC_FILES)
OPENSSL_TLS13_SERVER_SRC=$(TEST_TLS13_SRC)/$(OPENSSL_TLS13_SERVER).c $(COMM_SRC_FILES)
OPENSSL_TLS13_CLIENT_SRC=$(TEST_TLS13_SRC)/$(OPENSSL_TLS13_CLIENT).c $(COMM_SRC_FILES)
WOLFSSL_TLS13_SERVER_SRC=$(TEST_TLS13_SRC)/$(WOLFSSL_TLS13_SERVER).c $(COMM_SRC_FILES)
WOLFSSL_TLS13_CLIENT_SRC=$(TEST_TLS13_SRC)/$(WOLFSSL_TLS13_CLIENT).c $(COMM_SRC_FILES)

# Sample Code Srcs
WOLFSSL_TLS13_SERVER_SAMPLE_SRC=$(SAMPLE_SRC)/$(WOLFSSL_TLS13_SERVER_SAMPLE).c $(COMM_SRC_FILES)
WOLFSSL_TLS13_CLIENT_SAMPLE_SRC=$(SAMPLE_SRC)/$(WOLFSSL_TLS13_CLIENT_SAMPLE).c $(COMM_SRC_FILES)

TLS12_CLIENT_OBJ=$(addprefix $(OBJ_DIR)/,$(TLS12_CLIENT_SRC:.c=.o))
TLS12_SERVER_OBJ=$(addprefix $(OBJ_DIR)/,$(TLS12_SERVER_SRC:.c=.o))
TLS12_VERF_CB_CLIENT_OBJ=$(addprefix $(OBJ_DIR)/,$(TLS12_VERF_CB_CLIENT_SRC:.c=.o))
TLS12_VERF_CB_SERVER_OBJ=$(addprefix $(OBJ_DIR)/,$(TLS12_VERF_CB_SERVER_SRC:.c=.o))
TLS13_CLIENT_OBJ=$(addprefix $(OBJ_DIR)/,$(TLS13_CLIENT_SRC:.c=.o))
TLS13_SERVER_OBJ=$(addprefix $(OBJ_DIR)/,$(TLS13_SERVER_SRC:.c=.o))
TLS13_CLIENT_DHE_OBJ=$(addprefix $(OBJ_DIR)/,$(TLS13_CLIENT_DHE_SRC:.c=.o))
TLS13_SERVER_DHE_OBJ=$(addprefix $(OBJ_DIR)/,$(TLS13_SERVER_DHE_SRC:.c=.o))
TLS13_RESUMPTION_SERVER_OBJ=$(addprefix $(OBJ_DIR)/,$(TLS13_RESUMPTION_SERVER_SRC:.c=.o))
TLS13_RESUMPTION_CLIENT_OBJ=$(addprefix $(OBJ_DIR)/,$(TLS13_RESUMPTION_CLIENT_SRC:.c=.o))
OPENSSL_TLS13_SERVER_OBJ=$(addprefix $(OBJ_DIR)/,$(OPENSSL_TLS13_SERVER_SRC:.c=.o))
OPENSSL_TLS13_CLIENT_OBJ=$(addprefix $(OBJ_DIR)/,$(OPENSSL_TLS13_CLIENT_SRC:.c=.o))
WOLFSSL_TLS13_SERVER_OBJ=$(addprefix $(OBJ_DIR)/,$(WOLFSSL_TLS13_SERVER_SRC:.c=.o))
WOLFSSL_TLS13_CLIENT_OBJ=$(addprefix $(OBJ_DIR)/,$(WOLFSSL_TLS13_CLIENT_SRC:.c=.o))

# Sample Code Objs
WOLFSSL_TLS13_SERVER_SAMPLE_OBJ=$(addprefix $(OBJ_DIR)/,$(WOLFSSL_TLS13_SERVER_SAMPLE_SRC:.c=.o))
WOLFSSL_TLS13_CLIENT_SAMPLE_OBJ=$(addprefix $(OBJ_DIR)/,$(WOLFSSL_TLS13_CLIENT_SAMPLE_SRC:.c=.o))

DEPENDENCY_DIR=dependency
OPENSSL_1_1_1=openssl-1.1.1a
OPENSSL_1_1_1_DIR=$(DEPENDENCY_DIR)/$(OPENSSL_1_1_1)
OPENSSL_1_1_1_LIBS=$(OPENSSL_1_1_1_DIR)/libssl.a
WOLFSSL_MASTER=wolfssl-master
WOLFSSL_DIR=$(DEPENDENCY_DIR)/$(WOLFSSL_MASTER)
WOLFSSL_LIBS=$(WOLFSSL_DIR)/src/.libs/libwolfssl.so
DEPENDENCY = $(OPENSSL_1_1_1_LIBS)

CFLAGS = -g -ggdb -Wall -I $(COMMON_SRC)
OPENSSL_CFLAGS = -Werror $(CFLAGS) -I $(OPENSSL_1_1_1_DIR)/include
#TODO(wolfSSL) Need to remove this macro definition it should come from config.h file
WOLFSSL_CFLAGS = $(CFLAGS) -DWOLFSSL_TLS13 -DHAVE_SUPPORTED_CURVES -I $(WOLFSSL_DIR)
LDFLAGS = $(OPENSSL_1_1_1_DIR)/libssl.a $(OPENSSL_1_1_1_DIR)/libcrypto.a -lpthread -ldl
WOLFSSL_LDFLAGS = -L $(WOLFSSL_DIR)/src/.libs -lwolfssl

CC = gcc
CP = cp
RM = rm

#.PHONY all init_task clean

#TODO Add build for wolfssl
all : init_task build_dependency $(TARGET)

$(OBJ_DIR)/$(TEST_TLS13_SRC)/$(OPENSSL)%.o:$(TEST_TLS13_SRC)/$(OPENSSL)%.c
	$(CC) $(OPENSSL_CFLAGS) -c $< -o $@

$(OBJ_DIR)/$(SAMPLE_SRC)/$(WOLFSSL)%.o:$(SAMPLE_SRC)/$(WOLFSSL)%.c
	$(CC) $(WOLFSSL_CFLAGS) -c $< -o $@

$(OBJ_DIR)/$(TEST_TLS13_SRC)/$(WOLFSSL)%.o:$(TEST_TLS13_SRC)/$(WOLFSSL)%.c
	$(CC) $(WOLFSSL_CFLAGS) -c $< -o $@

$(OBJ_DIR)/%.o:%.c
	$(CC) $(OPENSSL_CFLAGS) -c $< -o $@

build_dependency:$(DEPENDENCY)

$(OPENSSL_1_1_1_LIBS): $(OPENSSL_1_1_1_DIR).tar.gz
	cd $(DEPENDENCY_DIR) && tar -zxvf $(OPENSSL_1_1_1).tar.gz
	cd $(OPENSSL_1_1_1_DIR) && ./config -d
	cd $(OPENSSL_1_1_1_DIR) && make

init_task:
	@mkdir -p $(BIN_DIR)
	@mkdir -p $(OBJ_DIR)
	@mkdir -p $(OBJ_DIR)/$(COMMON_SRC)
	@mkdir -p $(OBJ_DIR)/$(SAMPLE_SRC)
	@mkdir -p $(OBJ_DIR)/$(TEST_TLS13_SRC)

$(BIN_DIR)/$(TLS13_RESUMPTION_SERVER):$(TLS13_RESUMPTION_SERVER_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(TLS13_RESUMPTION_CLIENT):$(TLS13_RESUMPTION_CLIENT_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(TLS13_SERVER_DHE):$(TLS13_SERVER_DHE_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(TLS13_CLIENT_DHE):$(TLS13_CLIENT_DHE_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(TLS13_CLIENT):$(TLS13_CLIENT_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(TLS13_SERVER):$(TLS13_SERVER_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(TLS12_CLIENT):$(TLS12_CLIENT_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(TLS12_SERVER):$(TLS12_SERVER_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(TLS12_VERF_CB_CLIENT):$(TLS12_VERF_CB_CLIENT_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(TLS12_VERF_CB_SERVER):$(TLS12_VERF_CB_SERVER_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(OPENSSL_TLS13_SERVER):$(OPENSSL_TLS13_SERVER_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(OPENSSL_TLS13_CLIENT):$(OPENSSL_TLS13_CLIENT_OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

$(BIN_DIR)/$(WOLFSSL_TLS13_SERVER):$(WOLFSSL_TLS13_SERVER_OBJ)
	$(CC) $^ $(WOLFSSL_LDFLAGS) -o $@

$(BIN_DIR)/$(WOLFSSL_TLS13_CLIENT):$(WOLFSSL_TLS13_CLIENT_OBJ)
	$(CC) $^ $(WOLFSSL_LDFLAGS) -o $@

$(BIN_DIR)/$(WOLFSSL_TLS13_SERVER_SAMPLE):$(WOLFSSL_TLS13_SERVER_SAMPLE_OBJ)
	$(CC) $^ $(WOLFSSL_LDFLAGS) -o $@

$(BIN_DIR)/$(WOLFSSL_TLS13_CLIENT_SAMPLE):$(WOLFSSL_TLS13_CLIENT_SAMPLE_OBJ)
	$(CC) $^ $(WOLFSSL_LDFLAGS) -o $@

clean:
	@$(RM) -rf *.o *.a
	@$(RM) -rf $(TARGET)
	@$(RM) -rf $(OBJ_DIR) $(BIN_DIR)
