# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mtemel <mtemel@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/21 10:34:24 by ysensoy           #+#    #+#              #
#    Updated: 2023/02/25 23:44:43 by mtemel           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = minishell
CC = gcc
CLAFGS = -Wall -Wextra -Werror
SRCS = $(wildcard *.c built-in/*.c check_token/*.c executor/*.c expand/*.c functions/*.c \
		heredoc/*.c lexer/*.c list/*.c pipe/*.c redirections/*.c)
OBJ = $(SRCS:.c = .o)

$(NAME): $(OBJ)
	@$(CC) $(CLAFGS) $(SRCS) $(pkg-config --cflags --libs readline) -lreadline -L -I -o $(NAME)
	@echo "\033[1;92mCOMPILATION SUCCESSFUL\033[0m"

#$(CC) $(CLAFGS) $(SRCS) -lreadline -L "realine_path" -I "realine_path" -o $(NAME)

all: $(NAME)

clean:
	rm -rf  $(NAME)

fclean: clean
	rm -rf .heredoc

re: fclean all

.PHONY: all clean fclean re
