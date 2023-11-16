all:
	bison -d parser.y
	flex lex.l
	gcc -o a.out parser.tab.c lex.yy.c
	./a.out <input.txt> output.txt
	