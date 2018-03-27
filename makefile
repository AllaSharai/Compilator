C=g++

all: comp

comp: main.o emitter.o error.o init.o lexer.o parser.o symbol.o
	$(C) -o comp main.o emitter.o error.o init.o lexer.o parser.o symbol.o 

main.o: main.c global.h
	$(C) -c main.c

error.o: error.c global.h
	$(C) -c error.c

emitter.o: emitter.c global.h
	$(C) -c emitter.c

init.o: init.c global.h
	$(C) -c init.c

lexer.o: lexer.c global.h
	$(C) -c lexer.c

parser.o: parser.c global.h
	$(C) -c parser.c

symbol.o: symbol.c global.h
	$(C) -c symbol.c

clean:
	rm -rf *.o comp
