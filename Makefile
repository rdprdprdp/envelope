CC = gcc
#CPP = C Pre-Proccesser
CPPFLAGS =  -I/usr/local/pgsql/include
CFLAGS = $(CPPFLAGS) -g -O2
LIBS = -lpq  -lpq -lcrypto -lssl
LDFLAGS =  -L/usr/local/pgsql/lib $(LIBS)
SOURCES=src/envelope_config.c src/envelope_fossil.c \
src/envelope_handle_auth.c src/envelope_handle_c.c \
src/envelope_handle_cluster.c src/envelope_handle_file.c \
src/envelope_handle_public.c src/envelope_handle_role.c \
src/envelope_handle_upload.c src/envelope_handle_webroot.c \
src/envelope_handle.c src/envelope_main.c \
src/postage_handle_auth.c src/postage_handle_c_copy.c \
src/postage_handle_c_fork.c src/postage_handle_c_package.c \
src/postage_handle_c2.c src/postage_handle_sql.c \
src/util_aes.c src/util_base64.c src/util_canonical.c \
src/util_cookie.c src/util_darray.c src/util_error.c \
src/util_exec.c src/util_file.c src/util_ini.c \
src/util_jsmin.c src/util_json_split.c src/util_request.c \
src/util_salloc.c src/util_split.c src/util_sql.c \
src/util_string.c src/util_sunlogf.c
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=envelope

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@

.c.o:
	$(CC) $(CFLAGS) $< -c -o $@

clean:
	rm $(OBJECTS) $(EXECUTABLE)
