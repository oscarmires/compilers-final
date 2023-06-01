%{
#include <stdio.h>

int yylex();
void yyerror(const char *s);
%}

%token FILE_NAME VERB PREP COND NUM COLUMN COMP LOGICO NUMBER NAME

%%

statement:  NAME '=' expression
    |       expression              { printf("= %d\n", $1); }
    ;
expression: expression '+' NUMBER   { $$ = $1 + $3; }
    |       expression '-' NUMBER   { $$ = $1 - $3; }
    |       NUMBER                  { $$ = $1; }
    ;

%%

void yyerror(const char* message) {
    fprintf(stderr, "Error: %s\n", message);
}


int main() {
    yyparse();
    return 0;
}


/* where points is more than 10 */
