%{
#include <stdio.h>
%}

%token IDF
%token lt

%token END

%%
S:lt {printf("I WANT TO CRY");}
;
%%
int yywrap(){
    return 1;
}
int main() {
    yylex();
    return 0;
}
