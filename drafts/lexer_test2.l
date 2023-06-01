%{
#include <stdio.h>
%}

%%

[ \t] ;             /* ignore whitespace */ 

"get" | 
"select" | 
"look for" | 
"find"                          { printf("VERB\n"); }

"in" | 
"at" | 
"from"                          { printf("PREP\n"); }

"with" |
"where"                         { printf("COND\n"); }

"is more than" | 
"is greater than" | 
"is lower than" | 
"is less than" | 
"is lesser than" | 
"is equal to" | 
"is equals" | 
"is at least" | 
"is at most" | 
"is greater or equal to" | 
"is lower or equal to"          { printf("COMP\n"); }

[a-zA-Z0-9]+\.csv               { printf("FILE_NAME\n"); }
[0-9]+                          { printf("NUM\n"); }
[a-zA-Z0-9]+                    { printf("NAME\n"); }

. return yytext[0];

%%

int main(int argc, char **argv) {
    yylex();
    return (0);
}
