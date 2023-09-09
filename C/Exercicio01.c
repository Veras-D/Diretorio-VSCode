#include <stdio.h>
#include <stdlib.h>

int calc(float vG, float vE);

int main()
{
    printf("Gasolina VS Etanol\n");
    float pGasolina, pEtanol;
    printf("Qual o preço da gasolina? ");
    scanf("%f", &pGasolina);
    printf("Qual o preço da etanol? ");
    scanf("%f", &pEtanol);
    int resul = calc(pGasolina, pEtanol);
    switch(resul)
    {
        case 0:
            printf("Abasteça com Gasolina.\n");
            break;
        case 1:
            printf("Abasteça com Etanol.\n");
            break;
        case 2:
            printf("Abasteça com qualquer um.\n");
            break;
        default:
            printf("Erro.\n");
            break;
    }
    return 0;
}

int calc(float vG, float vE) 
{
    if(vG * 0.7 > vE)
    {
        return 1;
    }
    else if(vG * 0.7 < vE)
    {
        return 0;
    }
    else
    {
        return 2;
    }
}
