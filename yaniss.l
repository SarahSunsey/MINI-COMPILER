%{
    #include<stdio.h>
    int nb_ligne=1;
%}
deb BEGIN
fin END
pour For
tq While
idf [A-Z](([A-Za-z0-9]?|[_])[A-Za-z0-9]){0,9}
int [+-]?([1-9][0-9]*|0)
float {int}[.][0-9]+
bool (true|false)

%%
{deb} {printf("debut\n");}
{fin} {printf("fin\n");}
{pour} {printf("boucle pour\n");}
{tq} {printf("boucle tant que\n");}
"INT" {printf("type entier");}
"FLOAT" {printf("type float");}
"BOOL" {printf("type boolean");}
{idf} {printf("identificateur reconnu: %s\n",yytext);}
{int} {printf("un entier\n");}
{float} {printf("un float\n");}
{bool} {printf("un boolean\n");}
":=" {printf("une affectation reconnue\n");}
\+ {printf("une addition reconnu\n");}
\* {printf("une multiplication reconnu\n");}
\- {printf("une soustraction reconnu\n");}
\/ {printf("une division reconnue\n");}
\% {printf("modulo");}
\< {printf("symbole inferieur\n");}
\> {printf("symbole supperieur\n");}
"<>" {printf("symbole different\n");}
"<=" {printf("symbole inferieur ou egale\n");}
">=" {printf("symbole supperieur ou egale\n");}
"==" {printf("une egalite\n");}
\; {printf("une fin de ligne reconnue\n");}
\( {printf("parenthese ouvrante");}
\) {printf("parenthese fermente");}
\{ {printf("acolade ouvrante");}
\} {printf("acolade fermante");}
"&&" {printf("AND");}
"||" {printf("OR");}
\n {nb_ligne++;}
[ \t]
. printf("valeur non reconnu par le langage a la ligne %d",nb_ligne);

%%
int main()
{
yylex();
return 0;
}
int yywrap(void)
{
return 0;
}