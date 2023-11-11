%{
    #include<stdio.h>
    #include<stdlib.h>
    extern FILE* yyin;
%}
%token  DEBUT FIN cst pour si sinon tantque type idf valeur affect virgule operant comp pv po pf ao af et ou


%%
S : declaration DEBUT instruction FIN {printf("la structure du programme est respectée");YYACCEPT;};

declaration : 
type idf pv {printf("simple declaration");} 
| type affectation pv {printf("declaration et affectation");}
| cst type idf pv {printf("simple declaration de cst");}
| cst type affectation pv {printf("declaration et affectation de cst");}
| declaration virgule declaration {printf("declaration courecte");};

instruction : 
affectation instruction {printf("affectation");}
| condition instruction {printf("une condition");} 
| boucle instruction {printf("boucle");}
|affectation {printf("affectation simple");}
| condition {printf("une condition simple");} 
| boucle {printf("boucle simple");};

affectation : idf affect valeur pv {printf("affectation simple");} 
| idf affect idf pv {printf("affectation d'une valeur idf a un idf");}
| idf affect operation pv {printf("affectation d'une operation");};

condition : si po comparaison pf ao instruction af {printf("une condition");}
| si po comparaison pf ao instruction af sinon ao instruction af {printf("une condition avec sinon");};

boucle : pour po idf affect valeur pv comparaison pv operation pf ao instruction af {printf("boucle pour");}
| tantque po comparaison pf ao instruction af {printf("boucle tant que");};

operation : valeur operant valeur {printf("operation entre valeur");} 
| idf operant idf {printf("operation entre idf");}
| valeur operant idf {printf("operation entre valeur et idf");}
| idf operant valeur {printf("operation entre idf et valeur");}
| idf operation {printf("operation complexe 1");}
| valeur operation {printf("operation complexe 2");}
|po operation pf{printf("operation avec priouite");};

comparaison : valeur comp valeur {printf("comparaison 1");} 
| valeur comp idf {printf("comparaison 2");} 
| idf comp valeur {printf("comparaison 3");} 
| idf comp idf {printf("comparaison 4");} 
| comparaison et comparaison {printf("comparaison et");} 
| comparaison ou comparaison {printf("comparaison ou");};    

%%
int yyerror(char* msg){
    printf("%s",msg);
    return 1;
}
int main(){
    yyin=fopen("code_test.txt","r");
    yyparse();
    return 0;
}
