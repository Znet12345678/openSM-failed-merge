CC = i686-w64-mingw32-gcc
AR = i686-w64-mingw32-ar
LDFLAGS =  -L${PWD} -L${PWD}/.. -lsm -Wl,-rpath=${PWD}
CFLAGS = -Werror -I../include -O2 -g -fPIC -std=c99
PREFIX=/usr/local
tests:
	@echo "LDCC opensm-libio-test-txt.exe"
	@${CC} -o opensm-libio-test-txt.exe  opensm-libio-test-txt.c ${CFLAGS} ${LDFLAGS}
	@echo "TEST opensm-libio-test-txt.exe"
	@wine ./opensm-libio-test-txt.exe
	@echo "LDCC opensm-libio-test-file.exe"
	@${CC} -o opensm-libio-test-file.exe opensm-libio-test-file.c ${CFLAGS} ${LDFLAGS}
	@echo "TEST opensm-lbio-test-file.exe"
	@wine ./opensm-libio-test-file.exe
	@echo "LDCC opensm-libuser-test.exe"
	@${CC} -o opensm-libuser-test.exe opensm-libuser-test.c ${CFLAGS} ${LDFLAGS}
	@echo "TEST opensm-libuser-test.exxe"
	@wine ./opensm-libuser-test.exe
