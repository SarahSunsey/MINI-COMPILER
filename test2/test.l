%option noyywrap

%{
#include<stdio.h>
#include "test.tab.h"
int yyerror(char *sp);
%}

%%

"max\n" { printf("MAX"); }
"min\n" { printf("MIN"); }
. {yyerror("Unkonwn token !!!");}

%%

int main(){
yyparse();
}

int yyerror(char *sp){
printf("%s", sp);
exit(1);

}

