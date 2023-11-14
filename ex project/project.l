%{
#include "project.tab.h"
#include <string.h>
#include <stdio.h>
int nb_ligne = 0;

%}

lettre [a-zA-Z]
INT_NUM [0-9]
IDF ^[A-Z][A-Za-z0-9]*(_[A-Za-z0-9]+)*$
real [-+]?{INT_NUM}+
char ({lettre}|{INT_NUM})
string \"[^\"]*\"
commentaire "/*"([^*]|\*+[^*/])*\*+"/"
seul_commentaire \{[^{}]+\}
FLOAT_NUM [+-]?{INT_NUM}+\.{INT_NUM}





%%

{IDF} {if (strlen(yytext) <= 10) return IDF;}

"<"     {return lt;}



[ \t]
\n      { nb_ligne++; }
.       { printf("erreur lexicale à la ligne %d \n", nb_ligne); }
%%
