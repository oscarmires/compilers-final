%{
#include <stdio.h>

int yylex();
void yyerror(const char *s);
%}

%token FILENAME VERB PREP COND_BEGIN COMPARATOR NUMBER NAME

%%

statement:  COND_BEGIN          { printf("Cond begin"); }
    ;

%%

void yyerror(const char* message) {
    fprintf(stderr, "Error: %s\n", message);
}


int main() {
    /*
    FILE    *fd;

    if (argc == 2) {
        if (!(fd = fopen(argv[1], "r"))) {
            perror("Error: ");
            return (-1);
        }
        yyset_in(fd);
        yylex();
        fclose(fd);
    }
    else {
        printf("Usage: a.out filename\n");
    }
    */

    yyparse();

    return 0;
}


/* where points is more than 10 */
