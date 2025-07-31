%{
#include <stdio.h>

int c = 0;    // character count
int w = 0;    // word count
int l = 0;    // line count

FILE *fp;
%}

%%

[a-zA-Z0-9]+         { c += yyleng; w++; }

[ \t]+               { c += yyleng; }        // spaces and tabs (not counted as words)

\n                   { l++; c++; }           // newline is a character too

.                    { c++; }                // any other single character

%%

int yywrap() {
    return 1;
}

int main() {
    char filename[100];

    //printf("Enter the input file name: ");
    //scanf("%s", filename);

    fp = fopen("input2.txt", "r");
    if (fp == NULL) {
        perror("Error opening file");
        return 1;
    }

    yyin = fp;  // set the Lex input pointer

    yylex();    // run lexical analyzer

    // Display results
    printf("\nNumber of lines: %d\n", l);
    printf("Number of words: %d\n", w);
    printf("Number of characters: %d\n", c);

    fclose(fp);
    return 0;
}

/*
input2.txt:
Hello world
welcome to lex programming
*/
