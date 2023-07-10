/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afrolova <afrolova@student.42barcel>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/05/29 00:16:46 by afrolova          #+#    #+#             */
/*   Updated: 2023/07/08 17:37:52 by alissiafrolov    ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */
#include "../printf_plus/INC/ft_printf.h"
#include "../INC/minitalk.h"

void	ft_sigin(int signal)
{
	static int				bit = 0;
	static unsigned char	c = '\0';

	c = c << 1;
	if (signal == SIGUSR1)
	{
	}
	else
		c = c | 1;
	bit++;
	if (bit == 8)
	{
		write(1, &c, sizeof(c));
		bit = 0;
		c = '\0';
	}
}

int	main(int argc, char **argv)
{
	int	pid;

	pid = getpid();
	argv = NULL;
	if (argc != 1)
		ft_error("Error\nToo many arguments");
	ft_printf("PID: %d\n", pid);
	signal(SIGUSR1, &ft_sigin);
	signal(SIGUSR2, &ft_sigin);
	while (1)
		pause();
	return (0);
}
