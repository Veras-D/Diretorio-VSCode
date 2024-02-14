#include <stdio.h>

int	main(void)
{
	char character;

	character = 'a';
	printf("O código ASCII do %c é: %d\n", character, character);

	character = 'A';
	printf("O código ASCII do %c é: %d\n", character, character);
	return (0);
}