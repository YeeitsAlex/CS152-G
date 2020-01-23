%{
  int currLine = 1; currPos = 1;
%}

INPUT [a-zA-z]
DIGIT [0-9]

%%
" "             //Ignore Whitespace
"function"      {printf("FUNCTION\n"); currPos += yyeleng;}
"beginparams"   {printf("BEGIN_PARAMS"); currPos += yyeleng;}
"endparams"     {printf("END_PARAMS"); currPos += yyeleng;}
"beginlocals"   {printf("BEGIN_LOCALS"); currPos += yyeleng;}
"endlocals"     {printf("END_LOCALS"); currPos += yyeleng;}
"beginbody"     {printf("BEGIN_BODY"); currPos += yyeleng;}
"endbody"       {printf("END_BODY"); currPos += yyeleng;}
"integer"       {printf("INTEGER"); currPos += yyeleng;}
"array"         {printf("ARRAY"); currPos += yyeleng;}
"of"            {printf("OF"); currPos += yyeleng;}
"if"            {printf("IF"); currPos += yyeleng;}
"then"          {printf("THEN"); currPos += yyeleng;}
"endif"         {printf("ENDIF"); currPos += yyeleng;}
"else"          {printf("ELSE"); currPos += yyeleng;}
"while"         {printf("WHILE"); currPos += yyeleng;}
"do"            {printf("DO"); currPos += yyeleng;}
"for"           {printf("FOR"); currPos += yyeleng;}
"beginloop"     {printf("BEGINLOOP"); currPos += yyeleng;}
"endloop"       {printf("ENDLOOP"); currPos += yyeleng;}
"continue"      {printf("CONTINUE"); currPos += yyeleng;}
"read"          {printf("READ"); currPos += yyeleng;}
"write"         {printf("WRITE"); currPos += yyeleng;}
"and"           {printf("AND"); currPos += yyeleng;}
"or"            {printf("OR"); currPos += yyeleng;}
"not"           {printf("NOT"); currPos += yyeleng;}
"true"          {printf("TRUE"); currPos += yyeleng;}
"false"         {printf("FALSE"); currPos += yyeleng;}
"return"        {printf("RETURN"); currPos += yyeleng;}
"-"             {printf("SUB"); currPos += yyeleng;}
"+"             {printf("ADD"); currPos += yyeleng;}
"*"             {printf("MULT"); currPos += yyeleng;}
"/"             {printf("DIV"); currPos += yyeleng;}
"%"             {printf("MOD"); currPos += yyeleng;}
"=="            {printf("EQ"); currPos += yyeleng;}
"<>"            {printf("NEQ"); currPos += yyeleng;}
"<"             {printf("LT"); currPos += yyeleng;}
">"             {printf("GT"); currPos += yyeleng;}
"<="            {printf("LTE"); currPos += yyeleng;}
">="            {printf("GTE"); currPos += yyeleng;}
";"             {printf("SEMICOLON"); currPos += yyeleng;}
":"             {printf("COLON"); currPos += yyeleng;}
","             {printf("COMMA"); currPos += yyeleng;}
"("             {printf("L_PAREN"); currPos += yyeleng;}
")"             {printf("R_PAREN"); currPos += yyeleng;}
"["             {printf("L_SQUARE_BRACKET"); currPos += yyeleng;}
"]"             {printf("R_SQUARE_BRACKET"); currPos += yyeleng;}
":="            {printf("ASSIGN"); currPos += yyeleng;}

"\n"            {printf("Line %s, Pos: %s")currLine++; currPos = 1;}

{INPUT}+          {printf("IDENT %s\n", yytext); currPos += yyeleng;}
{INPUT}+{DIGIT}+  {printf("IDENT %s\n", yytext); currPos += yyeleng;}
{DIGIT}+          {printf("NUMBER %s\n", yytext); currPos += yyeleng;}





%%

int main(){
  yylex();
}
