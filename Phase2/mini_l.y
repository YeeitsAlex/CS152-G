%{
 #include <stdio.h>
 #include <stdlib.h>
 void yyerror(const char *msg);
 extern int currLine;
 extern int currPos;
 FILE * yyin;
%}

%union{
  char* id;
  int num;
}


%error-verbose
%start program
%token FUNCTION BEGIN_PARAMS END_PARAMS BEGIN_LOCALS END_LOCALS BEGIN_BODY END_BODY INTEGER ARRAY OF IF THEN ENDIF ELSE WHILE DO FOR BEGINLOOP ENDLOOP CONTINUE READ WRITE TRUE FALSE RETURN SEMICOLON COLON COMMA 

%token <id> IDENT
%token <num> NUMBER
%left ASSIGN
%left OR
%left AND
%right NOT
%left LT LTE GT GTE EQ NEQ
%left ADD SUB
%left MULT DIV MOD
%nonassoc UMINUS
%token L_SQUARE_BRACKET R_SQUARE_BRACKET
%token L_PAREN R_PAREN 



%%
program:              %empty {printf("program -> epsilon\n");}
                      | function program {printf("program -> function program\n");}
                      ;

function:             FUNCTION ident SEMICOLON BEGIN_PARAMS declarations END_PARAMS BEGIN_LOCALS declarations END_LOCALS BEGIN_BODY statements END_BODY {printf("function -> FUNCTION ident SEMICOLON BEGIN_PARAMS declarations END_PARAMS BEGIN_LOCALS declarations END_LOCALS BEGIN_BODY statements END_BODY\n");}
                      ;


declaration:          identifiers COLON INTEGER {printf("declaration -> identifiers COLON INTEGER\n");}
                      | identifiers COLON ARRAY L_SQUARE_BRACKET NUMBER R_SQUARE_BRACKET OF INTEGER {printf("declaration -> identifiers COLON ARRAY L_SQUARE_BRACKET NUMBER R_SQUARE_BRACKET OF INTEGER\n");}
                      ;

declarations:         %empty {printf("declarations -> epsilon\n");}
                      | declaration SEMICOLON declarations {printf("declarations -> declaration SEMICOLON declarations\n");}
                      ;
                
ident:                IDENT {printf("ident -> IDENT %s\n", $1);}
                      ;

identifiers:          ident {printf("identifiers -> ident\n");}
                      | ident COMMA identifiers {printf("identifiers -> ident COMMA identifiers\n");}
                      ;

statement:            var ASSIGN expression {printf("statement -> var ASSIGN expression\n");}
                      | IF bool_expr THEN statements ENDIF {printf("statement -> IF bool_expr THEN statements ENDIF\n");}
                      | IF bool_expr THEN statements ELSE statements ENDIF {printf("statement -> IF bool_expr THEN statements ELSE statements ENDIF\n");}
                      | IF bool_expr AND bool_expr THEN statements ENDIF {printf("statement -> IF bool_expr AND bool_expr THEN statements ENDIF\n");}
                      | IF bool_expr AND bool_expr THEN statements ELSE statements ENDIF {printf("statement -> IF bool_expr AND bool_expr THEN statements ENDIF\n");}
                      | WHILE bool_expr BEGINLOOP statements ENDLOOP {printf("statement -> WHILE bool_expr BEGINLOOP statements ENDLOOP\n");}
                      | DO BEGINLOOP statements ENDLOOP WHILE bool_expr {printf("statement -> DO BEGINLOOP statements ENDLOOP WHILE bool_expr");}
                      | FOR vars ASSIGN NUMBER SEMICOLON bool_expr SEMICOLON vars ASSIGN expression BEGINLOOP statements ENDLOOP {printf("statement -> FOR vars ASSIGN NUMBER SEMICOLON bool_expr SEMICOLON vars ASSIGN expression BEGINLOOP statements ENDLOOP");}
                      | READ vars {printf("statement -> READ vars\n");}
                      | WRITE vars {printf("statement -> WRITE vars\n");}
                      | CONTINUE {printf("statement -> CONTINUE\n");} 
                      | RETURN expression {printf("statement -> RETURN expression\n");}
                      ; 

statements:           %empty {printf("statements -> epsilon\n");}
                      | statement SEMICOLON statements {printf("statements -> statement SEMICOLON statements\n");}
                      ;

bool_expr:            relation_and_expr {printf("bool_expr -> relation_and_expr\n");}
                      | relation_and_expr OR bool_expr {printf("bool_expr -> relation_and_expr OR bool_expr\n");}
                      ;

relation_and_expr:    relation_expr {printf("relation_and_expr -> relation_expr\n");}
                      | relation_expr AND relation_and_expr {printf("relation_and_expr -> relation_expr AND relation_and_expr\n");}
                      ;

relation_expr:        NOT relation_expression {printf("relation_expr -> NOT relation_expr\n");}
                      | relation_expression {printf("relation_expr -> relation_exprs\n");}
                      ;

relation_expression:  expression comp expression {printf("relation_expression -> expression comp expression\n");}
                      | TRUE  {printf("relation_expression -> TRUE\n");}
                      | FALSE {printf("relation_expression -> FALSE\n");}
                      | L_PAREN bool_expr R_PAREN {printf("relation_expression -> L_PAREN bool_expr R_PAREN\n");}
                      ;

comp:                 EQ {printf("comp -> EQ\n");}
                      | NEQ {printf("comp -> NEQ\n");}
                      | LT {printf("comp-> LT\n");}
                      | GT {printf("comp -> GT\n");}
                      | LTE {printf("comp -> LTE\n");}
                      | GTE {printf("comp -> GTE\n");}
                      ;

expression:           mult_expr {printf("expression -> mult_expr\n");}
                      | mult_expr ADD expression {printf("expression -> mult_expr ADD expression\n");}
                      | mult_expr SUB expression {printf("expression -> mult_expr SUB expression\n");}
                      ; 

mult_expr:            term {printf("mult_expr -> term\n");}
                      | term MULT mult_expr {printf("mult_expr -> term MULT mult_expr\n");}
                      | term DIV mult_expr {printf("mult_expr -> term DIV mult_expr\n");}
                      | term MOD mult_expr {printf("mult_expr -> term MOD mult_expr\n");}
                      ;

term:                 identifiers L_PAREN expression R_PAREN {printf("term -> identifiers L_PAREN expression R_PAREN\n");}
                      | SUB var {printf("term -> SUB var\n");} 
                      | SUB NUMBER {printf("term -> SUB NUMBER\n");} 
                      | SUB L_PAREN expression R_PAREN {printf("term -> SUB L_PAREN expression R_PAREN\n");} 
                      | var {printf("term -> var\n");} 
                      | NUMBER {printf("term -> NUMBER\n");} 
                      | L_PAREN expression R_PAREN {printf("term -> L_PAREN expression R_PAREN\n");}
                      ;                    

var:                  ident {printf("var -> ident\n");}
                      | ident L_SQUARE_BRACKET expression R_SQUARE_BRACKET {printf("var -> ident L_SQUARE_BRACKET expression R_SQUARE_BRACKET\n");}
                      ;

vars:                 var {printf("vars -> var\n");}
                      | var COMMA vars {printf("vars -> var COMMA vars\n");}
                      ;

%%


int main(int argc, char **argv) {
   if (argc > 1) {
      yyin = fopen(argv[1], "r");
      if (yyin == NULL){
         printf("syntax: %s filename\n", argv[0]);
      }//end if
   }//end if
   yyparse(); // Calls yylex() for tokens.
   return 0;
}

void yyerror(const char *msg) {
   printf("** Line %d, position %d: %s\n", currLine, currPos, msg);
}
