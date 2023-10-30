%{
#include <stdio.h>
#include <string.h>
extern int nb_ligne;
%}

%token IDF INT FLOAT commentaire seul_commentaire

%%
expression:IDF { printf("hello"); }
    ;

%%


int main() {
    yyparse();
    return 0;
}
yywrap()
{}
