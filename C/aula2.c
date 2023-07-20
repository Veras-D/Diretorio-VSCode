#include <stdio.h>
#include <stdlib.h>
int main()
{
    char nome[20];
    int idade;
    printf("\nEscreva seu nome: ");
    scanf("%s", nome);
    printf("Digite sua idade: ");
    scanf("%i", &idade);
    printf("Olá %s sua idade é: %i anos\n\n", nome, idade);
    return 0;
}
