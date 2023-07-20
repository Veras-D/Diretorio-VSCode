#include <stdio.h>
int main()
{
    // texto
    /*Texto 
    longo*/
    char nome[40] = "Danilo Veras";
    int idade = 22;
    char sexo[2] = "M";
    float altura = 1.77;

    printf("Nome: %s\nIdade: %i\nSexo: %s\nAltura: %.2f\n", nome, idade, sexo, altura);
    return 0;
}
