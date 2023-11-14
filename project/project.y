%{
#include <stdio.h>
int nb_ligne=1;
extern void yyerror(const char* msg);
%}
%token BEGINN aff pvg idf  cst  virgule
%token FLOAT_NUM INT BOOL STRING  BOOL_VAL CHARR VOID STR PRINTFF
%token INT_NUM FLOATVAR real charr string BOOL_VAR
%token commentaire seulcommentaire
%token lt gt eq eqeq neq 
%token pl min and mul orr 
%token incr lteq gteq not decr divv  po pf ao af
%token ENDD
%token FOR IF ELSE 
%start S

%%
datatype:INT|FLOATVAR|CHARR|VOID|BOOL
COMP:lt|gt|eq|eqeq|neq 
unary:incr|decr

S: declarations BEGINN programme ENDD {printf("\nprogramme correct (syntaxiquement correcte)");}
;

declarations: declaration declarations 
|declaration
;

declaration:cst datatype declarationCNST 
|INT declarationENTIER
|FLOATVAR declarationFLOAT
|BOOL declarationBOOL
;
declarationCNST:
 idf eq VALUE virgule declarationCNST
|idf pvg 
|idf eq INT_NUM pvg 
;
declarationENTIER:idf virgule declarationENTIER
|idf pvg 
|idf eq INT_NUM pvg 
;

declarationFLOAT:idf virgule declarationFLOAT
|idf pvg
|idf eq FLOAT_NUM pvg
;

declarationBOOL:idf virgule declarationBOOL
|idf pvg
;

programme:
idf aff expression pvg
|PRINTFF '(' STR ')' pvg
| IF  '(' condition ')' '{' programme '}' else
| idf unary pvg
| unary idf pvg
|FOR '(' statement pvg condition pvg statement ')' '{' programme '}'
|programme programme
;

statement :
datatype idf aff VALUE 
| idf aff expression
|idf unary
|unary idf
;
condition: idf COMP expression 
|BOOL_VAR
;
else: ELSE '{' programme '}'
|
;

term: expression OP term
|VALUE
;
expression: term
;

OP: min | pl | and | mul | orr
VALUE: INT_NUM | FLOAT_NUM |idf |BOOL_VAL



%%
yywrap()
{}
void yyerror(const char* msg) {
  fprintf(stderr, "\nError: %s ligne %d\n ", msg,nb_ligne);
}
int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE *file = freopen(argv[1], "r", stdin);
    if (file == NULL) {
        perror("Error");
        return 1;
    }

    yyparse();

    fclose(file);

    return 0;
}