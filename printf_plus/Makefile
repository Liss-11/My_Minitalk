# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: afrolova <afrolova@student.42barcel>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/26 22:56:47 by afrolova          #+#    #+#              #
#    Updated: 2023/07/07 19:39:38 by alissiafrolov    ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

		#COLORS

END_COLOR = \033[0;0m
GRAY = \033[0;90m
RED = \033[0;91m
GREEN = \033[0;92m
YELLOW = \033[0;93m
BLUE = \033[0;94m
MAGENTA = \033[0;95m
CYAN = \033[0;96m
WHITE = \033[0;97m

         #CARPETAS

DIR_OBJ = OBJ
DIR_SRCS = SRCS

SRCS = ft_printf.c ft_write.c ft_numbers.c ft_hexadecimales.c ft_utils.c 

OBJS = $(addprefix $(DIR_OBJ)/,$(SRCS:.c=.o))
EXEC_NAME = printf
NAME = printf.a
CC = gcc
RM = rm -rf
AR += -rcs
CFLAGS += -Wall -Werror -Wextra

HEADER = INC/ft_printf.h

all: 				OBJ/ $(NAME)

$(NAME):			$(OBJS)
					$(AR) $@ $(OBJS)
					@echo "${GREEN}<----------- ft_printf compiled successfully! ----------->${END_COLOR}"

$(DIR_OBJ)/%.o: 	$(DIR_SRCS)/%.c $(HEADER)
					$(CC) -IINC $(CFLAGS) -c $< -o $@

OBJ/:
			@-mkdir OBJ

exec:		$(OBJS) 
			@$(CC) $(OBJS) -o $(EXEC_NAME)

clean:
			@$(RM) $(OBJS)
			@$(RM) OBJ/
			@echo "${BLUE}<----------- ft_printf object files cleaned! ----------->${END_COLOR}"

fclean:		clean
			@$(RM) $(NAME)
			@$(RM) $(EXEC_NAME)
			@echo "${CYAN}<----------- ft_print executable files cleaned! ----------->${END-COLOR}"
			
re:			fclean
			@make
			@echo "${YELLOW}<----------- Cleaned und rebuilt everything for ft_printf ----------->${END_COLOR}"

dev: re

.PHONY: all clean fclean re dev exec 
