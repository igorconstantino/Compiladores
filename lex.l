%{
int linhas=1, erros=0;
%}

DIGITO     [0-9]
ID         [A-Za-z\_][A-Za-z0-9\_]*
ESPACO     [\t\r" "]
ATRIBUICAO [\=]
PONTUACAO  [!?,\.;]
OPERRACAO  [\+\-\*\/\(\)]
ASPAS      [\"\"]

%%

{ESPACO} /*reconhece espaço em branco*/

{DIGITO}+{ID} {
printf("Identificador invalido: %s - ", yytext);
erros++;
printf("Linha: %d\n", linhas);
} /*reconhece erro em identificador*/

{ID}{DIGITO}*{ID}* {
printf("%s\n", yytext);
}

{DIGITO}+ {
printf("%s\n",yytext);
}

{DIGITO}+"."{DIGITO}+ {
printf("%s\n",yytext);
}

{ATRIBUICAO}+ {
printf("%s\n",yytext); 
}

{PONTUACAO}+ {
printf("%s\n",yytext);
}

{OPERRACAO}+ {
printf("%s\n",yytext);
}

"//"[^\n]* {
printf("\n");
} /*Comentários Simples, nessa linguagem não há
comentário de mais de uma linha, para fazê-lo, deve-se
comentar uma linha por vez */

\n {
linhas++;
} /*reconhece mudança de linhas*/

. {
printf("ERRO: %s - ",yytext);
erros++;
printf("Linha: %d\n", linhas);
} /*Apresenta erro em qualquer coisa que não for uma
regra válida*/

%%

int yywrap();

int main() {
yylex();
printf("Total de erros encontrados: %d\n", erros);
if(erros==0)
puts("\nCódigo analisado com sucesso!\n");
}

int yywrap() {
return 1;
}