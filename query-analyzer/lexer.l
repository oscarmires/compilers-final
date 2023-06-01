%{
#include "y.tab.h"
extern int yylval;
%}

%%

[ \t] ;             /* ignore whitespace */ 

"get" | 
"select" | 
"look for" | 
"find"                          { return VERB; }

"in" | 
"at" | 
"from"                          { return PREP; }

"with" |
"where"                         { return COND_BEGIN; }

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
"is lower or equal to"          { return COMPARATOR; }

[a-zA-Z0-9]+\.csv               { return FILENAME; }
[0-9]+                          { yylval = atoi(yytext); return NUMBER; }
[a-zA-Z0-9]+                    { return NAME; }

. return yytext[0];

%%
