%{
#include <stdio.h>
#include <math.h>

int binaryToDecimal(int binary);
%}

%token BINARY

%%
expr: BINARY { 
    printf("Decimal equivalent: %d\n", binaryToDecimal($1));
}
%%

int main() {
    printf("Enter a binary number:\n");
    yyparse();
    return 0;
}

int binaryToDecimal(int binary) {
    int decimal = 0, i = 0;
    while (binary > 0) {
        int digit = binary % 10;
        decimal += digit * pow(2, i);
        binary /= 10;
        i++;
    }
    return decimal;
}
