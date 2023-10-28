%{

#include <string.h>
#include <stdio.h>
int nb_ligne = 0;
%}


INT [-]?[0-9]+
FLOAT [-]?[0-9]*\.?[0-9]+
commentaire "/*"([^*]|\*+[^*/])*\*+"/"
char ({[a-zA-Z]})
/* (idf) commences with an uppercase letter (A-Z) followed by a sequence of digits (0-9), uppercase letters (A-Z), lowercase letters (a-z), or the underscore symbol '_'. Its length should not exceed 10 characters.
   Identifiers must adhere to the following conditions:
   > The identifier must not contain consecutive underscores.
   > The underscore symbol '_' must not appear at the end of the identifier. */
IDF ^[A-Z][A-Za-z0-9]*(_[A-Za-z0-9]+)*$

%%

{IDF} {if (strlen(yytext) <= 10) {
        printf("Valid IDF");}}
[\t ]+    { /* Ignore whitespace */ }
\n        {  nb_ligne++; }
{commentaire} {printf("COM");}
.|\n      { /* Ignore any other characters or newline characters */ }


%%
int yywrap(){
    return 1;
}
int main() {
    yylex();
    return 0;
}
