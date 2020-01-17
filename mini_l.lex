%{

%}

INPUT [a-zA-z]
DIGIT [0-9]

%%
" "             //Ignore Whitespace
"function"      {printf("FUNCTION\n");}
"beginparams"   {printf("BEGIN_PARAMS");}
"endparams"     {printf("END_PARAMS");}
"beginlocals"   {printf("BEGIN_LOCALS");}

{INPUT}+        {printf("IDENT %s\n", yytext);}
{DIGIT}+        {printf("NUMBER %s\n", yytext);}







%%

int main(){
  yylex();
}
