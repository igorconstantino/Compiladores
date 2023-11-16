%{
	#include <stdio.h>
	extern int yylex();
	extern int yylineno;
	void yyerror(char *s);
%}

%locations

%token INT FLOAT MUL DIV GT LT ASSIGN EQUAL LPAREN RPAREN LBRACE RBRACE IF WHILE ADD SUB SEMI ID NUM

%start program

%%

program:statements| ;

statements:statement| ;

statement:statements expression
	|if_statement
	|while_statement
	| ;

if_statement:statement IF tailer_statement| ;

while_statement:statement WHILE tailer_statement| ;

tailer_statement:LPAREN expression RPAREN LBRACE statement RBRACE;

expression:type ID SEMI
	|type ID ASSIGN NUM SEMI
	|type ID EQUAL NUM SEMI
	|type ID ASSIGN ID SEMI 
	|type ID ASSIGN expression SEMI
	|ID EQUAL ID SEMI
	|ID EQUAL NUM SEMI
	|ID ASSIGN ID SEMI
	|ID ASSIGN expression SEMI
	|ID EQUAL ID
	|ID ASSIGN ID
	|ID EQUAL NUM
	|ID GT NUM
	|ID LT NUM
	|ID GT ID
	|ID LT ID
	|NUM GT ID
	|NUM LT ID
	|NUM GT NUM
	|NUM LT NUM
	|NUM ADD NUM
	|NUM ADD ID
	|ID ADD NUM
	|ID ADD ID
	|NUM SUB NUM
	|NUM SUB ID
	|ID SUB NUM
	|ID SUB ID
	|NUM MUL NUM
	|NUM MUL ID
	|ID MUL NUM
	|ID MUL ID
	|NUM DIV NUM
	|NUM DIV ID
	|ID DIV NUM
	|ID DIV ID

type:INT|FLOAT;

%%

void yyerror(char *s){
	fprintf(stderr, "error: %s, Line: %d\n", s, yylineno);
}

int main(){
	yyparse();
	printf("Parser finished!");
	return 0;
}

