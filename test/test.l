%{
#include "test1.tab.h"
int nb_ligne=0;
%}
lettre [a-zA-Z]
chiffre [0-9]
IDF {lettre}({lettre}|{chiffre})*
cst {chiffre}+
%%
{IDF} return idf;
{cst} return cst;
= return aff;
; return pvg;
[ \t]
\n {nb_ligne++; }
. printf("erreur lexicale à la ligne %d \n",nb_ligne) ;
%%
int yywrap(){
    return 1;
}
int main() {
    yylex();
    return 0;
}