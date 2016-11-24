CC = i686-w64-mingw32-gcc
AR = i686-w64-mingw32-ar
OBJS = obj/libio.o obj/libmisc.o obj/libclient.o obj/libuser.o obj/libsh.o
LDFLAGS =  -L${PWD} -Wl,-rpath=${PWD} -lws2_32
CFLAGS = -Iinclude -O2 -g -fPIC -std=gnu99
PREFIX=/usr/local
all:
	@echo "CC libio.o"
	@${CC} -c lib/libio.c -o obj/libio.o ${CFLAGS}
	@echo "CC libmisc.o"
	@${CC} -c lib/libmisc.c -o obj/libmisc.o ${CFLAGS}
	@echo "CC libclient.o"
	@${CC} -c lib/libclient.c -o obj/libclient.o ${CFLAGS}
	@echo "CC libuser.o"
	@${CC} -c lib/libuser.c -o obj/libuser.o ${CFLAGS}
	@echo "CC libsh.o"
	@${CC} -c lib/libsh.c -o obj/libsh.o ${CFLAGS}
	@echo "AR libsm.a"
	@${AR} rcs libsm.a ${OBJS}
	@echo "LDCC libsm.dll"
	@${CC} -o libsm.dll ${OBJS} -shared ${LDFLAGS} ${CFLAGS}
	@echo "LDCC server.proto.exe"
	@${CC}  server/server.c -o server/server.proto.exe ${CFLAGS} ${LDFLAGS} -lsm
	@echo "LDCC client.proto.exe"
	@${CC} client/client.c -o client/client.proto.exe ${CFLAGS} ${LDFLAGS} -lsm
	@echo "LDCC tools_dDat.exe"
	@${CC} ${OBJS} src/tools_dDat.c -o tools_dDat.exe ${LDFLAGS} ${CFLAGS}
	@echo "LDCC tools_wfDat.exe"
	@${CC} ${OBJS} src/tools_wfDat.c -o tools_wfDat.exe ${LDFLAGS} ${CFLAGS}
	@echo "LDCC tools_dfDat.exe"
	@${CC} ${OBJS} src/tools_dfDat.c -o tools_dfDat.exe ${LDFLAGS} ${CFLAGS}
	@echo "LDCC tools_wDat.exe"
	@${CC} ${OBJS} src/tools_wDat.c -o tools_wDat.exe ${LDFLAGS} ${CFLAGS}
	@echo "LDCC dev_dump_fDat.exe"
	@${CC} ${OBJS} src/dump_fDat.c -o dev_dump_fDat.exe ${LDFLAGS} ${CFLAGS}
	@echo "LDCC dev_send_txt.exe"
	@${CC} ${OBJS} src/dev_send_txt.c -o dev_send_txt.exe ${LDFLAGS} ${CFLAGS}
	@echo "LDCC client_txt_generic.exe"
	@${CC} -o client_txt_generic src/client_txt_generic.c ${LDFLAGS} ${CFLAGS} -lsm
	@echo "LDCC dump_serverconf.exe"
	@${CC} ${CFLAGS} -o dump_serverconf.exe debug/dump_serverconf.c ${OBJS} ${LDFLAGS}
	@echo "TEST tests"
	@make -C tests tests
install:
	@echo "INSTALL libsm.so"
	@install libsm.so ${PREFIX}/lib
	@echo "INSTALL libsm.a"
	@install libsm.a ${PREFIX}/lib
clean:
	@echo "CLEAN"
	@rm -f obj/*.o dev_send_txt dev_dump_fDat tools_wDat libsm.a libsm.so client_txt_generic tools_dfDat tools_wfDat tools_dDat libsm.a libsm.so libsm.so.1 server/server.proto client/client.proto tests/opensm-libio-test-txt tests/opensm-libio-test-file
