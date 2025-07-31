%{
#include <stdio.h>
%}

%%

abc          { printf("ABC"); }

.|\n         { putchar(yytext[0]); }

%%

int main() {
    printf("Enter text:\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}

