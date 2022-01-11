SHELL=/bin/bash
EXE=
RUN=
OBJ= ${EXE}.o

CFLAG= -std=c++2a -pedantic -Wall -Wextra 

#compile
all: ${EXE} ${OBJ}
	./{EXE}


${EXE}: ${OBJ}
	c++ $^ ${CFLAG} -o $@

%.o: %.cc
	c++ $< ${CFLAG} -c

#test
run:
	./${EXE}

# using debug macro , set FLAG for gdb
debug: CFLAG+= -g -Wfatal-errors -w -DDEBUG 
debug: re

# set FLAG for gprof
prof: CFLAG+= -pg
prof: run
	gprof -b ${EXE}

re:	clean all


clean:
	rm -f ${EXE} ${OBJ}

	
	
