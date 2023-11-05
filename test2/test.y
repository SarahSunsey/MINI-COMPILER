%{
#include <stdio.h>
#include <stdlib.h>
int yylex();

%}

%token MAX MIN
%%

programe: max | min;

max: MAX {
printf("this is max\n");
exit(0);
};
min: MIN {
printf("this is min\n");
exit(0);
};

%%
