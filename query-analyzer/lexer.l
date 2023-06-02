%{
#include "y.tab.h"
extern YYSTYPE yylval;
%}

%%


[ \t] ; /* ignore whitespace */   

[Gg]"et" | 
[Ss]"elect" | 
[Ll]"ook for" | 
[Ff]"ind"                          { return VERB; } /* Query start verbs */

"in" | 
"from"                          { return FILE_PREP; } /* File preposition */
[a-zA-Z0-9_]+\.csv               { yylval.strval = strdup(yytext); return FILENAME; } /* Filename */

"with" |
"where"                         { yylval.strval = strdup(yytext); return COND_BEGIN; } /* Condition starts */

"is more than" | 
"is above" | 
"is greater than"               { return GT; }

"is lower than" | 
"is less than" |
"is below" | 
"is lesser than" |              { return LT; }

"is equal to" | 
"equals"                     { return EQ; }

"is at least" | 
"is greater or equal to"        { return GTEQ; }

"is at most" | 
"is lower or equal to"          { return LTEQ; }


"and"                           { return AND; } /* Boolean */
"or"                            { return OR; }  /* Boolean */

"anything" |
"everything" |
"all"                           { return ALL; }

"the first"                     { return HEAD; }
"the last"                      { return TAIL; }


[0-9]+                          { yylval.intval = atoi(yytext); return NUMBER; }
[a-zA-Z0-9]+                    { yylval.strval = strdup(yytext); return NAME; }

\n      return 0;
.       return yytext[0];

%%
