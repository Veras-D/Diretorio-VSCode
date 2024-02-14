/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ASCII.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: veras <veras@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/02/14 14:07:34 by veras             #+#    #+#             */
/*   Updated: 2024/02/14 14:17:07 by veras            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

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
