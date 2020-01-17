%{

%}

INPUT [a-zA-z]
DIGIT [0-9]

%%

{INPUT}+    {printf("IDENT %\n", yytext);}
{DIGIT}+    {printf("NUMBER %\n", yytext);}
"function"  {printf("FUNCTION\n")}






%%

int main(){
  yylex();
}
