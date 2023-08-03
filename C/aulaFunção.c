#include <stdio.h>
#include <stdlib.h>

float media(float a, float b);

int main()
{
    float a, b, resul;
    printf("a: ");
    scanf("%f", &a);
    printf("b: ");
    scanf("%f", &b);
    resul = media(a, b);
    printf("O a media entre %.2f e %.2f é: %.2f\n", a, b, resul);
    return 0;
}
float media(float a, float b)
{
    float md;
    md = (a + b) / 2;
    return(md);
}
/*
void teste(void)
{
    printf("Teste\n");
}
*/