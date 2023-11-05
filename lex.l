%{
#include <string.h>
#include <stdio.h>
void yyerror();
#include <stdlib.h>
extern FILE *yyin;
extern FILE *yyout;

#include "lex.tab.h" // Include the Bison-generated header file
int nb_ligne = 1;
%}

INT [-]?[0-9]+
FLOAT [-]?[0-9]*\.?[0-9]+
commentaire "/*"([^*]|\*+[^*/])*\*+"/"
seul_commentaire \{[^{}]\}
char ({[a-zA-Z]})
/* (idf) commences with an uppercase letter (A-Z) followed by a sequence of digits (0-9), uppercase letters (A-Z), lowercase letters (a-z), or the underscore symbol '_'. Its length should not exceed 10 characters.
   Identifiers must adhere to the following conditions:
   > The identifier must not contain consecutive underscores.
   > The underscore symbol '_' must not appear at the end of the identifier. */
IDF ^[A-Z][A-Za-z0-9]*(_[A-Za-z0-9]+)*$

%%

{IDF} { if (strlen(yytext) <= 10) { return IDF; }}

{INT} {return INTEGER; }
"int" |"INT" {return INT;}
{FLOAT} { return FLOATER; }
"float" |"FLOAT" {return FLOAT;}
"/*"([^*]|\*+[^*/])*\*+"/" { return commentaire; }

\{[^{}]+\} { return seul_commentaire; }

[ \t]+ { /* Ignore whitespace */ }

\n { nb_ligne++; }



.|\n { /* Ignore any other characters or newline characters */ }

%%
int yywrap(){
    return 1;
}
int main() {
    yylex();
    return 0;
}
