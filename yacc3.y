%{
#include <stdio.h>
#include <stdlib.h>

void print_postfix(char *op);
%}

%token NUMBER

%%
expr: expr '+' term { print_postfix("+"); }
    | expr '-' term { print_postfix("-"); }
    | term
    ;

term: term '*' factor { print_postfix("*"); }
    | term '/' factor { print_postfix("/"); }
    | factor
    ;

factor: '(' expr ')'  
      | NUMBER { printf("%d ", $1); }
      ;

%%

int main() {
    printf("Enter an infix expression:\n");
    yyparse();
    return 0;
}

void print_postfix(char *op) {
    printf("%s ", op);
}
