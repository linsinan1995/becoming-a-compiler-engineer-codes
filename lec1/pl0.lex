%{
    #include <math.h>

%}

ASSIGN   "="|"<-"
DIGIT    [0-9]
ID       [a-zA-Z][a-zA-Z0-9]*
KEYWORD  "if"|"then"|"while"|"do"|"read"|"write"|"call"|"procedure"|"begin"|"end"|"const"|"var"|"odd"|"for"
LOGIC    "=="|">"|">="|"<="|"<"
%%

{DIGIT}+                    {printf("(%s, int)\n", yytext);}
{DIGIT}+"."{DIGIT}*         {printf("(%s, float)\n", yytext);}
{KEYWORD}                   {printf("(%s, keyword)\n", yytext );}
{ID}                        {printf("(%s, identifier)\n", yytext);}
{ASSIGN}                    {printf("(%s, assignment)\n", yytext);}
{LOGIC}                     {printf("(%s, logic operator)\n", yytext);}
"+"|"-"|"*"|"/"             {printf("(%s, operator)\n", yytext);}
"{"[^}\n]*"}"               {/* eat up one-line comments */}
[ \t\n]+                    {/* eat up whitespace */}
"("                         {printf("(%s, open parent)\n", yytext);}
")"                         {printf("(%s, close parent)\n", yytext);}
";"                         {printf("(%s, line terminator)\n", yytext);}
.                           {printf( "Unrecognized character: %s\n", yytext );}

%%


int yywrap() {}

int main() {
    yylex();
}