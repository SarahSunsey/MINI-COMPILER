%token idf cst aff pvg
%%
S: idf aff cst pvg {printf("syntaxe correcte");

}

;
%%

main ()
{
yyparse();
}
