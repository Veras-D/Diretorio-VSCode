// do-while executa a condição pelo menos uma vez
#include <stdio.h>
#include <stdlib.h>

int main()
{
    int cont = 0;
    do {
        printf("Teste do-while %i\n", cont+1);
        cont++;
    }
    while(cont<10);
    return 0;
}