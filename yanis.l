%{
    #include<stdio.h>
    int nb_ligne=1;
%}
idf [A-Z](([A-Za-z0-9]?|[_])[A-Za-z0-9]){0,9}
int [+-]?([1-9][0-9]*|0)
float {int}[.][0-9]*
bool (true|false)

%%
{idf} {printf("identificateur reconnue: %s\n",yytext);}
{int} {printf("un entier\n");}
{float} {printf("un float\n");}
{bool} {printf("un boolean\n");}
\+ {printf("une addition reconnue\n");}
\* {printf("une multiplication reconnue\n");}
\- {printf("une soustraction reconnue\n");}
\/ {printf("une division reconnue\n");}
":=" {printf("une affectation reconnue\n");}
\< {printf("symbole inferieur\n");}
\> {printf("symbole supperieur\n");}
"<>" {printf("symbole different\n");}
"<=" {printf("symbole inferieur ou egale\n");}
">=" {printf("symbole supperieur ou egale\n");}
"==" {printf("une egalite\n");}
\; {printf("une fin de ligne reconnue\n");}
\n {nb_ligne++;}
[\t]
. {printf("valeur non reconnu par le langage a la ligne %d",nb_ligne);}

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