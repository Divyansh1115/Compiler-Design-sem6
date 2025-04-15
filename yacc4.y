%{
#include <stdio.h>

int yylex();
void yyerror(const char *s);
%}

%token NUMBER

%%
expr: expr '+' term { $$ = $1 + $3; }
    | expr '-' term { $$ = $1 - $3; }
    | term
    ;

term: term '*' factor { $$ = $1 * $3; }
    | term '/' factor { $$ = $1 / $3; }
    | factor
    ;

factor: '(' expr ')' { $$ = $2; }
      | NUMBER { $$ = $1; }
      ;

%%

int main() {
    printf("Enter an arithmetic expression:\n");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}
