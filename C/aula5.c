#include <stdio.h>
#include <stdlib.h>

int main()
{
    int c;
    for(c = 0; c< 10; c++) // c-- = c = c-1 = c-=1
    {
        printf("Teste %i\n", c+1);
    }
    
    return 0;
}
