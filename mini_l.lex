%{
  int currLine = 1, currPos = 1;
%}

INPUT [a-zA-z]
DIGIT [0-9]

%%
" "             //Ignore Whitespace
"function"      {printf("FUNCTION\n"); currPos ++;}
"beginparams"   {printf("BEGIN_PARAMS"); currPos++;}
"endparams"     {printf("END_PARAMS"); currPos++;}
"beginlocals"   {printf("BEGIN_LOCALS"); currPos++;}
"endlocals"     {printf("END_LOCALS"); currPos++;}
"beginbody"     {printf("BEGIN_BODY"); currPos++;}
"endbody"       {printf("END_BODY"); currPos++;}
"integer"       {printf("INTEGER"); currPos++;}
"array"         {printf("ARRAY"); currPos++;}
"of"            {printf("OF"); currPos++;}
"if"            {printf("IF"); currPos++;}
"then"          {printf("THEN"); currPos++;}
"endif"         {printf("ENDIF"); currPos++;}
"else"          {printf("ELSE"); currPos++;}
"while"         {printf("WHILE"); currPos++;}
"do"            {printf("DO"); currPos++;}
"for"           {printf("FOR"); currPos++;}
"beginloop"     {printf("BEGINLOOP"); currPos++;}
"endloop"       {printf("ENDLOOP"); currPos++;}
"continue"      {printf("CONTINUE"); currPos++;}
"read"          {printf("READ"); currPos++;}
"write"         {printf("WRITE"); currPos++;}
"and"           {printf("AND"); currPos++;}
"or"            {printf("OR"); currPos++;}
"not"           {printf("NOT"); currPos++;}
"true"          {printf("TRUE"); currPos++;}
"false"         {printf("FALSE"); currPos++;}
"return"        {printf("RETURN"); currPos++;}
"-"             {printf("SUB"); currPos++;}
"+"             {printf("ADD"); currPos++;}
"*"             {printf("MULT"); currPos++;}
"/"             {printf("DIV"); currPos++;}
"%"             {printf("MOD"); currPos++;}
"=="            {printf("EQ"); currPos++;}
"<>"            {printf("NEQ"); currPos++;}
"<"             {printf("LT"); currPos++;}
">"             {printf("GT"); currPos++;}
"<="            {printf("LTE"); currPos++;}
">="            {printf("GTE"); currPos++;}
";"             {printf("SEMICOLON"); currPos++;}
":"             {printf("COLON"); currPos++;}
","             {printf("COMMA"); currPos++;}
"("             {printf("L_PAREN"); currPos++;}
")"             {printf("R_PAREN"); currPos++;}
"["             {printf("L_SQUARE_BRACKET"); currPos++;}
"]"             {printf("R_SQUARE_BRACKET"); currPos++;}
":="            {printf("ASSIGN"); currPos++;}

"\n"            {printf("Line: %d, Pos: %d"), currLine++, currPos = 1;}

{INPUT}+          {printf("IDENT %s\n", yytext); currPos++;}
{INPUT}+{DIGIT}+  {printf("IDENT %s\n", yytext); currPos++;}
{DIGIT}+          {printf("NUMBER %s\n", yytext); currPos++;}





%%

int main(){
  yylex();
}
