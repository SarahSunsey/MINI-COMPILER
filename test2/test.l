%option noyywrap

%{

#include "test.tab.h”
int yyerror(char *sp);
%}

%%

“"max\n" { return MAX; }
"min\n" { return MIN; }
. {yyerror("Unkonwn token !!!");}

%%

int main(){
yyparse();
}

int yyerror(char *sp){
printf("%s", sp);
exit(1);

}

