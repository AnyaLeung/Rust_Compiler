scanner: lex.yy.o symbols.o
	gcc -o p lex.yy.c symbols.o -ll

lex.yy.o: scanner.l
	lex scanner.l
	gcc -c -g lex.yy.c

symbols.o: symbols.c symbols.h
	gcc -c -g symbols.c

clean:
	rm -f *.o lex.yy.c
