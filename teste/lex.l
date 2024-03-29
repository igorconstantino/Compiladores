%{
    #include "parser.tab.h"
%}

%option noyywrap
%option yylineno

digit [0-9]
letter [a-zA-Z]
id (_|{letter})({letter}|{digit})*
number ({digit})+
ws [ \t\n]
delim ({ws})*

%%  

{delim} {}
"int"     {return INT;}
"float"   {return FLOAT;}
"="       {return ASSIGN;}
"=="      {return EQUAL;}
"("       {return LPAREN;}
")"       {return RPAREN;}
"{"       {return LBRACE;}
"}"       {return RBRACE;}
"if"      {return IF;}
"while"   {return WHILE;}
"+"       {return ADD;}
"-"       {return SUB;}
"*"       {return MUL;}
"/"       {return DIV;}
";"       {return SEMI;}
">"       {return GT;}
"<"       {return LT;}
{id}      {return ID;}
{number}  {return NUM;}








