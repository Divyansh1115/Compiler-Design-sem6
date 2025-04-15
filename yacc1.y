%{
#include <stdio.h>
#include <string.h>

int is_palindrome(char *str);
%}

%token WORD

%%
sentence: WORD { 
    if (is_palindrome($1)) 
        printf("Palindrome detected: %s\n", $1);
    else
        printf("Not a palindrome: %s\n", $1);
}
%%

int main() {
    printf("Enter a string:\n");
    yyparse();
    return 0;
}

int is_palindrome(char *str) {
    int len = strlen(str);
    for (int i = 0; i < len / 2; i++) {
        if (str[i] != str[len - i - 1]) return 0;
    }
    return 1;
}
