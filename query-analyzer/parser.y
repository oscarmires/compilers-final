%{
#include <stdio.h>

int yylex();
void yyerror(const char *s);
%}

%union {
    char* strval;
    int intval;
    char* exprstr;
}

%token <intval> FILE_PREP GT LT EQ GTEQ LTEQ AND OR NUMBER HEAD TAIL ALL
%token <strval> VERB NAME COND_BEGIN FILENAME 

%type <exprstr> comp_op log_expr condition range

%%

query:  VERB range FILE_PREP FILENAME COND_BEGIN condition      { printf("import pandas as pd\n\ndf = pd.read_csv(\"../data/%s\")\n\nprint(df[%s]%s)\n", $4, $6, $2); }
    |   VERB range FILE_PREP FILENAME                           { printf("import pandas as pd\n\ndf = pd.read_csv(\"../data/%s\")\n\nprint(df%s)\n", $4, $2); }
    ;


range:  HEAD NUMBER NAME {
            char *result = NULL;
                asprintf(&result, ".head(%d)", $2);
                if (result != NULL) {
                    $$ = result;
                } else {
                    fprintf(stderr, "Memory allocation failed.\n");
                }
        }
    |   TAIL NUMBER NAME {
            char *result = NULL;
                asprintf(&result, ".tail(%d)", $2);
                if (result != NULL) {
                    $$ = result;
                } else {
                    fprintf(stderr, "Memory allocation failed.\n");
                }
        }
    |   ALL                                             { $$ = ""; }
    ;


/* Condition (everithing after "COND_BEGIN") */
condition:  condition AND log_expr { 
                char *result = NULL;
                asprintf(&result, "(%s) & (%s)", $1, $3);
                if (result != NULL) {
                    $$ = result;
                } else {
                    fprintf(stderr, "Memory allocation failed.\n");
                }
            }
    |       condition OR log_expr { 
                char *result = NULL;
                asprintf(&result, "(%s) | (%s)", $1, $3);
                if (result != NULL) {
                    $$ = result;
                } else {
                    fprintf(stderr, "Memory allocation failed.\n");
                }
            }
    |       log_expr                                    { $$ = $1; }
    ;

/* Logic expression */
log_expr:    NAME comp_op NUMBER { 
                char *result = NULL;
                asprintf(&result, "df[\"%s\"] %s %d", $1, $2, $3);
                if (result != NULL) {
                    $$ = result;
                } else {
                    fprintf(stderr, "Memory allocation failed.\n");
                }
            }
    ;

/* Comparison operator */
comp_op:    GT                                      { $$ = ">"; }
    |       LT                                      { $$ = "<"; }
    |       EQ                                      { $$ = "=="; }
    |       GTEQ                                    { $$ = ">="; }
    |       LTEQ                                    { $$ = "<="; }
    ;

%%

void yyerror(const char* message) {
    fprintf(stderr, "Error: %s\n", message);
}


int main() {
    yyparse();
    return 0;
}
