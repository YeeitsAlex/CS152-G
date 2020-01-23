%{

%}

INPUT [a-zA-z]
DIGIT [0-9]

%%
" "             //Ignore Whitespace
"function"      {printf("FUNCTION\n");}
"beginparams"   {printf("BEGIN_PARAMS\n");}
"endparams"     {printf("END_PARAMS\n");}
"beginlocals"   {printf("BEGIN_LOCALS\n");}
"endlocals"     {printf("END_LOCALS\n");}
"beginbody"     {printf("BEGIN_BODY\n");}
"endbody"       {printf("END_BODY\n");}
"integer"       {printf("INTEGER\n");}
"array"         {printf("ARRAY\n");}
"of"            {printf("OF\n");}
"if"            {printf("IF\n");}
"then"          {printf("THEN\n");}
"endif"         {printf("ENDIF\n");}
"else"          {printf("ELSE\n");}
"while"         {printf("WHILE\n");}
"do"            {printf("DO\n");}
"for"           {printf("FOR\n");}
"beginloop"     {printf("BEGINLOOP\n");}
"endloop"       {printf("ENDLOOP\n");}
"continue"      {printf("CONTINUE\n");}
"read"          {printf("READ\n");}
"write"         {printf("WRITE\n");}
"and"           {printf("AND\n");}
"or"            {printf("OR\n");}
"not"           {printf("NOT\n");}
"true"          {printf("TRUE\n");}
"false"         {printf("FALSE\n");}
"return"        {printf("RETURN\n");}
"-"             {printf("SUB\n");}
"+"             {printf("ADD\n");}
"*"             {printf("MULT\n");}
"/"             {printf("DIV\n");}
"%"             {printf("MOD\n");}
"=="            {printf("EQ\n");}
"<>"            {printf("NEQ\n");}
"<"             {printf("LT\n");}
">"             {printf("GT\n");}
"<="            {printf("LTE\n");}
">="            {printf("GTE\n");}
";"             {printf("SEMICOLON\n");}
":"             {printf("COLON\n");}
","             {printf("COMMA\n");}
"("             {printf("L_PAREN\n");}
")"             {printf("R_PAREN\n");}
"["             {printf("L_SQUARE_BRACKET\n");}
"]"             {printf("R_SQUARE_BRACKET\n");}
":="            {printf("ASSIGN\n");}



{INPUT}+          {printf("IDENT %s\n", yytext);}   //FOR INPUT with only strings
{INPUT}+{DIGIT}+  {printf("IDENT %s\n", yytext);}   //NOT CORRECT...For INPUT with strings and digits
{DIGIT}+          {printf("NUMBER %s\n", yytext);}  //For NUMBER

//Need to fix regex




%%

int main(){
  yylex();
}
