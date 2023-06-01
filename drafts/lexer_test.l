%{
#include <stdio.h>
%}

%%

"get" 
| "select" 
| "search for" 
| "find"    { printf("VERB\n"); }
"in" | "at" | "from"                        { printf("PREP\n"); }
"with" | "where"                            { printf("COND\n"); }
"and" | "or"                                { printf("LOGICO\n"); }

[0-9]+                                      { printf("NUM\n"); }
[a-zA-Z0-9]+                                { printf("NAME\n"); }

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
"is lower or equal to"                      { printf("COMP\n"); }

[a-zA-Z0-9]+\.csv                         { printf("FILE_NAME\n"); }
[ \t] ; 			/* ignore whitespace */ 

\n return 0; 		/* logical EOF */
. return yytext[0];

%%

int main(int argc, char **argv) {

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
    yylex();

    return (0);
}

