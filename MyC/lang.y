%{

#include "Table_des_symboles.h"
#include "Attribute.h"
#include "PCode/PCode.h"

#include <stdio.h>
  
extern int yylex();
extern int yyparse();

void yyerror (char* s) {
  printf ("%s\n",s);
  }
    

%}

%union { 
  struct ATTRIBUTE * att;
}

%token <att> NUM
%token TINT
%token <att> ID
%token AO AF PO PF PV VIR
%token RETURN VOID EQ
%token <att> IF ELSE WHILE

%token <att> AND OR NOT DIFF EQUAL SUP INF
%token PLUS MOINS STAR DIV
%token DOT ARR

%left OR                       // higher priority on ||
%left AND                      // higher priority on &&
%left DIFF EQUAL SUP INF       // higher priority on comparison
%left PLUS MOINS               // higher priority on + - 
%left STAR DIV                 // higher priority on * /
%left DOT ARR                  // higher priority on . and -> 
%nonassoc UNA                  // highest priority on unary operator
%nonassoc ELSE


%start prog  

// liste de tous les non terminaux dont vous voulez manipuler l'attribut
%type <att> exp typename


%%

prog : func_list                {}
;

func_list : func_list fun       {}
| fun                           {}
;

// I. Functions

fun : type fun_head fun_body    {}
;

fun_head : fun_name po pf       {printf(" {\n");} // erreur si profondeur diff zero
| fun_name po params pf         {printf(" {\n");}
;

fun_name : ID                   {printf("%s", $1->name);}

params : type var vir params    {}
| type var                      {}

vlist : vlist vir ID            {}
| ID                            {}
;

var : ID                        {printf("%s", $1->name);}
;

vir : VIR                       {printf(",");}
;

po : PO                         {printf("(");}
;

pf : PF                         {printf(")");}
;

fun_body : AO block AF          {printf("}\n");}
;

// Block
block:
decl_list inst_list            {}
;

// II.1 Declarations

decl_list : decl_list decl     {}
|                              {}
;

decl: var_decl PV              {}
;

var_decl : type vlist           {
                                //if ($1->type_val == INT) printf("INTEGER");
                                }
;

type
: typename                     {printf("%s ", $1->name);}
;

typename
: TINT                          {
                                $$ = new_attribute();
                                $$->name = "int";
                                $$->type_val = INT;
                                }
| VOID                          {
                                $$ = new_attribute();
                                $$->name = "void";
                                }
;

// II. Instructions

inst_list : inst inst_list   {}
| inst                      {}
;

pv : PV                       {printf(";\n");}
;
 
inst:
exp pv                        {}
| ao block af                 {}
| aff pv                      {}
| ret pv                      {}
| cond                        {}
| loop                        {}
| pv                          {}
;

// Accolades pour gerer l'entr??e et la sortie d'un sous-bloc

ao : AO                       {}
;

af : AF                       {}
;


// II.2 Affectations

aff : ID EQ exp               {}
;


// II.2 Return
ret : RETURN exp              {}
| RETURN PO PF                {}
;

// II.3. Conditionelles
//           N.B. ces r??gles g??n??rent un conflit d??clage reduction
//           qui est r??solu comme on le souhaite par un d??calage (shift)
//           avec ELSE en entr??e (voir y.output)

cond :
if bool_cond inst elsop       {}
;

// la regle avec else vient avant celle avec vide pour induire une resolution
// adequate du conflit shift / reduce avec ELSE en entr??e

elsop : else inst             {}
|                             {}
;

bool_cond : PO exp PF         {}
;

if : IF                       {}
;

else : ELSE                   {}
;

// II.4. Iterations

loop : while while_cond inst  {}
;

while_cond : PO exp PF        {}

while : WHILE                 {}
;


// II.3 Expressions
exp :
// II.3.1 Exp. arithmetiques
MOINS exp %prec UNA         {}
// -x + y lue comme (- x) + y  et pas - (x + y)
| exp PLUS exp                {printf("ADDI;\n");}
| exp MOINS exp               {printf("SUBI;\n");}
| exp STAR exp                {printf("MULTI;\n");}
| exp DIV exp                 {printf("DIVI;\n");}
| PO exp PF                   {}
| ID                          {}
| app                         {}
| NUM                         {printf("LOAD(%i);\n", $1->int_val);}


// II.3.2. Bool??ens

| NOT exp %prec UNA           {}
| exp INF exp                 {printf("LT\n");}
| exp SUP exp                 {printf("GT\n");}
| exp EQUAL exp               {printf("EQUAL\n");}
| exp DIFF exp                {printf("DIFF\n");}
| exp AND exp                 {printf("AND\n");}
| exp OR exp                  {printf("OR\n");}

;

// II.4 Applications de fonctions

app : ID PO args PF           {}
;

args :  arglist               {}
|                             {}
;

arglist : exp VIR arglist     {}
| exp                         {}
;



%% 
int main () {

    /* Ici on peut ouvrir le fichier source, avec les messages 
     d'erreur usuel si besoin, et rediriger l'entr??e standard 
     sur ce fichier pour lancer dessus la compilation.
    */

    printf("Compiling MyC source code into PCode (Version 2021) !\n\n");
    return yyparse();
} 

