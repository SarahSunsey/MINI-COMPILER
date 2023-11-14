%{
#include "project.tab.h"
#include <stdio.h>
extern nb_ligne;
%}
IDF [A-Z]+[A-Za-z0-9]*(_[A-Za-z0-9]+)*
INTNUM [0-9]+
float [-]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?
commentaire "/*"([^*]|\*+[^*/])*\*+"/"



%%
["].*["]    return STR;
"BEGIN"         return BEGINN;
"FLOAT"|"float" return FLOATVAR;
"BOOL"|"bool"   return BOOL;
"true"|"false"  return BOOL_VAL;
"STRING"|"string" return STRING;
"int"|"INT"       return INT;
"CONST"|"const"   return cst;
"END"   return ENDD;
"CHAR"|"char" return CHARR;
"void"|"VOID" return VOID;
"for"   return FOR; 
"if"	return IF; 
"else"	return ELSE;
"printf" return PRINTFF;

{IDF} { if (strlen(yytext) <= 10 && yytext[strlen(yytext)-1] != '_') { return idf; }}
{INTNUM}       return INT_NUM;
{float}          return FLOAT_NUM;
{commentaire}       return commentaire;


"("     { return '('; }
")"     { return ')'; }
"{"     { return '{'; }
"}"     { return '}'; }
"<"     return lt;
">"     return gt;
"="     return eq;
":="    return aff;
";"     return pvg;
"=="    return eqeq;
"!="    return neq;
"+"     return pl;
"-"     return min;
"&&"    return and;
"*"     return mul;
"||"    return orr;
"++"    return incr;
"<="    return lteq;
">="    return gteq;
"!"     return neq;
"--"    return decr;
"/"     return divv;
","     return virgule;


\/\/.*
\/\*(.*\n)*.*\*\/
[ \t]*
[\n]* {nb_ligne++;}
.	                    { printf("\nErreur lexicale  dans la ligne %d",nb_ligne); }
%%
