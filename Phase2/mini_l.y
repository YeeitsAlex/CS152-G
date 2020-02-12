%{
 #include <stdio.h>
 #include <stdlib.h>
 void yyerror(const char *msg);
 extern int currLine;
 extern int currPos;
 FILE * yyin;
%}

%union{
  char* idVal;
  int intVal;
}


%error-verbose
%start input
%token <id_val> IDENT
%token <int_val> NUMBER
