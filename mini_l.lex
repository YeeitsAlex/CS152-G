%{
  int currLine = 1, currPos = 1;
%}

IDENTIFIER  [a-zA-Z]
DIGIT 	    [0-9]
UNDERLINE   [_]

%%
" "             //Ignore Whitespace
"function"      {printf("FUNCTION\n"); currPos += yyleng;}
"beginparams"   {printf("BEGIN_PARAMS"); currPos += yyleng;}
"endparams"     {printf("END_PARAMS"); currPos += yyleng;}
"beginlocals"   {printf("BEGIN_LOCALS"); currPos += yyleng;}
"endlocals"     {printf("END_LOCALS"); currPos += yyleng;}
"beginbody"     {printf("BEGIN_BODY"); currPos += yyleng;}
"endbody"       {printf("END_BODY"); currPos += yyleng;}
"integer"       {printf("INTEGER"); currPos += yyleng;}
"array"         {printf("ARRAY"); currPos += yyleng;}
"of"            {printf("OF"); currPos += yyleng;}
"if"            {printf("IF"); currPos += yyleng;}
"then"          {printf("THEN"); currPos += yyleng;}
"endif"         {printf("ENDIF"); currPos += yyleng;}
"else"          {printf("ELSE"); currPos += yyleng;}
"while"         {printf("WHILE"); currPos += yyleng;}
"do"            {printf("DO"); currPos += yyleng;}
"for"           {printf("FOR"); currPos += yyleng;}
"beginloop"     {printf("BEGINLOOP"); currPos += yyleng;}
"endloop"       {printf("ENDLOOP"); currPos += yyleng;}
"continue"      {printf("CONTINUE"); currPos += yyleng;}
"read"          {printf("READ"); currPos += yyleng;}
"write"         {printf("WRITE"); currPos += yyleng;}
"and"           {printf("AND"); currPos += yyleng;}
"or"            {printf("OR"); currPos += yyleng;}
"not"           {printf("NOT"); currPos += yyleng;}
"true"          {printf("TRUE"); currPos += yyleng;}
"false"         {printf("FALSE"); currPos += yyleng;}
"return"        {printf("RETURN"); currPos += yyleng;}
"-"             {printf("SUB"); currPos += yyleng;}
"+"             {printf("ADD"); currPos += yyleng;}
"*"             {printf("MULT"); currPos += yyleng;}
"/"             {printf("DIV"); currPos += yyleng;}
"%"             {printf("MOD"); currPos += yyleng;}
"=="            {printf("EQ"); currPos += yyleng;}
"<>"            {printf("NEQ"); currPos += yyleng;}
"<"             {printf("LT"); currPos += yyleng;}
">"             {printf("GT"); currPos += yyleng;}
"<="            {printf("LTE"); currPos += yyleng;}
">="            {printf("GTE"); currPos += yyleng;}
";"             {printf("SEMICOLON"); currPos += yyleng;}
":"             {printf("COLON"); currPos += yyleng;}
","             {printf("COMMA"); currPos += yyleng;}
"("             {printf("L_PAREN"); currPos += yyleng;}
")"             {printf("R_PAREN"); currPos += yyleng;}
"["             {printf("L_SQUARE_BRACKET"); currPos += yyleng;}
"]"             {printf("R_SQUARE_BRACKET"); currPos += yyleng;}
":="            {printf("ASSIGN"); currPos += yyleng;}

"\n"            {currLine++; currPos = 1;}

{DIGIT}+ 	                                        {printf("NUMBER %s\n", yytext); currPos += yyleng;}
{UNDERLINE}+({DIGIT}*|{IDENTIFIER}*|{UNDERLINE})*                {printf("Error with ID: %s\n", yytext);}
({DIGIT}+)+({UNDERLINE}*|{IDENTIFIER}*|{DIGIT}*)*	{printf("Error num first");}
{IDENTIFIER}+({UNDERLINE}*{DIGIT}*{IDENTIFIER}*)*{UNDERLINE} {printf("Error ends with underscore");}

{IDENTIFIER}+({UNDERLINE}*{DIGIT}*{IDENTIFIER}*)*({DIGIT}*|{IDENTIFIER}*)*   {printf("IDENT %s\n", yytext); currPos += yyleng;}




%%

int main(){
  yylex();
}
