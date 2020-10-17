%{
    int no_of_line  = 0;
    int no_of_chars = 0;
%}


%%
\n  ++no_of_line;
.   ++no_of_chars;
end return 0;
%%

int yywrap(){}
int main(){
    yylex();
    printf("number of line %d, number of chars %d", no_of_line, no_of_chars);
}
