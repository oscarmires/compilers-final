%{
#include "y.tab.h"
extern int yylval;
%}

%%

[a-zA-Z0-9]+[\.csv]                 { FILE_NAME; }
get | select | search for | find    { VERB; }
in | at | from                      { PREP; }
with | where                        { COND; }

[0-9]+                              { NUM; }
[a-zA-Z0-9]+                        { COLUMN; }

is more than | 
is greater than | 
is lower than | 
is less than | 
is lesser than | 
is equal to | 
is equals | 
is at least | 
is at most | 
is greater or equal to | 
is lower or equal to                { COMP; }

and | or                            { LOGICO; }

[0-9]+				{ yylval = atoi(yytext); return NUMBER; }
[a-z]				{ yylval = yytext[0] - 'a'; return NAME; }
[ \t] ; 			/* ignore whitespace */
\n return 0; 		/* logical EOF */
. return yytext[0];

%%
