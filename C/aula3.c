#include <stdio.h>
#include <stdlib.h>
// <, >, >=, <=, ==, !=
int main()
{
    int a, b;

    printf("Digite o valor de a: ");
    scanf("%i", &a);
    printf("Digite o valor de b: ");
    scanf("%i", &b);

    if(a < b) {
        printf("%i é maior que %i\n", b, a);
    }

    if(b < a) {
        printf("%i é maior que %i\n", a, b);
    }

    if(a != b) {
        printf("a é diferente de b\n");
    }

    else {
        printf("a é igual b\n");
    }

    if(a == 0 && b ==0) {
        printf("a e b são iguais a 0\n");
    }

    else if(a == 0) {
        printf("a é igual a 0\n");
    }

    else if(b == 0) {
        printf("b é igual a 0\n");
    }

    else {
        printf("nenhum dos valores é igual a 0\n");
    }


    return 0;
}