%{
    #include<stdio.h>
    extern FILE* yyin;
%}
%token  DEBUT FIN cst si sinon type idf valeur affect virgule operant comp pv po pf ao af et ou pour tantque incrementation decrementation


%%

declaration: 
A1  |cst A1;
A1: type B1;
B1: idf E1;
E1: pv  terminer_1 {printf("affectation valide\n");} | C1 | affect D1;
C1: virgule B1;
D1: valeur E1;
terminer_1: declaration | DEBUT instruction;

instruction : 
si A2 | G2 | pour N2 | tantque Y2 ;
A2: po B2;
B2: idf C2 |valeur C2;
C2:comp D2;
D2:idf E2 |valeur E2;
E2:et B2 | ou B2 | pf F2;
F2:ao instruction;
G2:idf H2;
H2:affect I2;
I2:idf J2 |valeur J2;
J2:operant I2| pv K2;
K2:af L2 | pv FIN {printf("reconnaissance succes\n");} | af FIN {printf("reconnaissance succes\n");};
L2: sinon M2 | instruction;
M2: ao instruction; 
N2: po O2;
O2:idf P2;
P2:affect Q2;
Q2:valeur R2;
R2:pv S2;
S2:idf T2;
T2:comp U2;
U2:idf EE2 | valeur EE2;
EE2: pv FF2;
FF2:idf V2;
V2:incrementation W2 | decrementation W2;
W2:pf X2;
X2:ao instruction;
Y2: po Z2;
Z2:idf AA2;
AA2:comp BB2;
BB2:valeur CC2;
CC2:pf DD2;
DD2:ao instruction;
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
