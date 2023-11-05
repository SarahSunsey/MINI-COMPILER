%{
#include <stdio.h>
#include <string.h>
extern int nb_ligne;

#include <stdlib.h>

extern FILE *yyin;
extern int lineno;
extern int yylex();
void yyerror();



%}
%token IDF INT FLOATER INTEGER FLOAT commentaire seul_commentaire char
%union {
         int	entier;
		 float	real;	
		 char	character; 
         char*	string;
}



%%
TYPE: INT|FLOAT
expression: TYPE INTEGER
    |TYPE FLOATER

    ;

%%
void yyerror ()
{
  fprintf(stderr, "Syntax error at line %d\n", nb_ligne);
  exit(1);
}

int main() {
    yyparse();
    return 0;
}
yywrap()
{}
