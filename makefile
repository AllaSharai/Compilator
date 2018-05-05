C=gcc


all: comp

comp: main.o emitter.o error.o init.o lexer.o parser.o symbol.o
	$(C) -o comp main.o emitter.o error.o init.o lexer.o parser.o symbol.o 

main.o: main.c global.h
	$(C) -c main.c

error.o: error.c global.h
	$(C) -c error.c

emitter.o: emitter.c global.h parser.h
	$(C) -c emitter.c

init.o: init.c global.h parser.h
	$(C) -c init.c

lexer.o: lexer.c global.h parser.h
	$(C) -c lexer.c

parser.o: parser.c global.h
	$(C) -c parser.c

symbol.o: symbol.c global.h
	$(C) -c symbol.c

lexer.c : lexer.l
	flex -o lexer.c lexer.l

parser.c, parser.h : parser.y
	bison --defines=parser.h -o parser.c parser.y

clean:
	rm -rf *.o comp
	rm -f lexer.c parser.c parser.h
