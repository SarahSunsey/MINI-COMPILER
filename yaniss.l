%{
    #include<stdio.h>
    #include<stdlib.h>
    #include"yaniss.tab.h"
    int nb_ligne=1;
%}
idf [A-Z](([A-Za-z0-9]?|[_])[A-Za-z0-9]){0,9}
int [+-]?([1-9][0-9]*|0)
float {int}[.][0-9]+
bool true|false

%%
"BEGIN" {return DEBUT;}
"END" {return FIN;}
"const" {return cst;}
"for" {return pour;}
"if" {return si;}
"else" {return sinon;}
"while" {return tantque;}
"INT"|"FLOAT"|"BOOL" {return type;}
{idf} {return idf;}
{int}|{float}|{bool} {return valeur;}
":=" {return affect;}
"," {return virgule;}
"+"|"*"|"-"|"/"|"%" {return operant;}
"<"|">"|"<>"|"<="|">="|"==" {return comp;}
";" {return pv;}
"(" {return po;}
")" {return pf;}
"{" {return ao;}
"}" {return af;}
"&&" {return et;}
"||" {return ou;}
\n {nb_ligne++;}
[ \t]
. {printf("erreur lexical a la ligne %d",nb_ligne);}

%%
int yywrap(void)
{
return 0;
}
