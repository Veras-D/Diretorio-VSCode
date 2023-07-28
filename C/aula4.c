#include <stdio.h>
#include <stdlib.h>

int main()
{
    int num;

    printf("Escolha entre 1 ou 2: ");
    scanf("%i", &num);

    switch(num)
    {
    case 1:
        printf("Você escolheu 1\n");
        break;
    case 2:
        printf("Você escolheu 2\n");
        break;
    default:
        printf("Opção invalida\n");
        break;

    }
    return 0;
}
