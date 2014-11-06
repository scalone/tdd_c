CC = gcc
INCS =
LIBS =
CFLAGS += -g -std=c99 -pedantic -Wall ${INCS}
#LDFLAGS += -static ${LIBS}
SRC = sut.c
OBJ = ${SRC:.c=.o}

all: sut runner test

compile: sut program

options:
	@echo sut build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"

.c.o:
	@echo CC $<
	@${CC} -c ${CFLAGS} $<

runner: runner.o sut.o
	@echo CC -o $@
	@${CC} -o $@ runner.o sut.o

program: program.o sut.o
	@echo CC -c -o $@
	@${CC} -o $@ program.o sut.o

sut: ${OBJ}
	@echo CC -o $@
	@${CC} -c -o $@ ${OBJ} ${LDFLAGS}

clean:
	@echo cleaning
	@rm -f runner program *.o *.core sut

test:
	./runner
