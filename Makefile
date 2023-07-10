# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: afrolova <afrolova@student.42barcel>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/26 10:44:37 by afrolova          #+#    #+#              #
#    Updated: 2023/07/08 17:40:07 by alissiafrolov    ###   ########.fr        #
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

#LIBRARY

PRINTF = printf_plus
PRINTF_LIB = printf_plus/printf.a

#FOLDERS

CLIENT = Client_src
SERVER = Server_src


PRINTF_INC = printf_plus/INC
HEADER = INC/minitalk.h


#VARIABLES

NAME = minitalk
C_NAME = client
S_NAME = server
RM = rm -rf
CC = gcc
FLAGS = -Wall -Werror -Wextra

SRC_CLIENT = Client_src/client.c
SCR_SERVER = Server_src/server.c

#OBJ_CLIENT = $(SRC_CLIENT:.c=.o)
#OBJ_SERVER = $(SRC_SERVER:.c=.o)

OBJ_CLIENT = Client_src/client.o

all:
						$(MAKE) -C $(PRINTF)
						$(MAKE) $(NAME)

$(NAME)::				
						$(MAKE) $(C_NAME)
						$(MAKE) $(S_NAME)

$(NAME)::
						@echo "$(GREEN)\t\t\t\t\t Minitalk is compiled! $(END_COLOR)"

$(CLIENT)/%.o:			$(CLIENT)/%.c Makefile $(PRINTF_LIB)
						@$(CC) $(FLAGS) -IINC -I $(PRINTF_INC) -c $< -o $@


$(SERVER)/%.o:			$(SERVER)/%.c Makefile $(PRINTF_LIB)
						@$(CC) $(FLAGS) -IINC -I $(PRINTF_INC) -c $< -o $@

$(C_NAME)::				$(PRINTF_LIB) $(HEADER) $(OBJ_CLIENT)
						$(CC) $(FLAGS) $(PRINTF_LIB) $(SRC_CLIENT) -o $(C_NAME)
						@echo "$(YELLOW) \t\t\t\t\t Compiling Client......$(END_COLOR)"

$(C_NAME)::
						@echo "$(GREEN) \t\t\t\t\t Client Compiled! $(END_COLOR)"
					


$(S_NAME)::				$(PRINTF_LIB) $(HEADER) $(OBJ_SERVER)
						@$(CC) $(FLAGS) $(PRINTF_LIB) $(SRC_CLIENT) -o $(S_NAME)
						@echo "$(YELLOW) \t\t\t\t Compiling Server......$(END_COLOR)"

$(S_NAME)::
						@echo "$(GREEN) \t\t\t\t\t Servert Compiled! $(END_COLOR)"
	

clean:
						@$(RM) $(OBJ_CLIENT)
						@$(RM) $(OBJ_SERVER)
						@$(MAKE) clean -C $(PRINTF)
						@echo "$(CYAN)\t\t\t\t\t All object files are cleaned $(END_COLOR)"

fclean:					
						@$(MAKE) clean
						@$(RM) $(S_NAME)
						@$(RM) $(C_NAME)
						@$(MAKE) fclean -C $(PRINTF)
						@echo "$(CYAN)\t\t\t\t\t All cleaned! $(NED_COLOR)"

re:						
						@$(MAKE) fclean
						@$(MAKE)
						@echo "$(CYAN)\t\t\t\t     All cleaned and Rebuild! $(NED_COLOR)"

.PHONY: all clean fclean re

						
