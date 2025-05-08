# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rodrigopeereez <rodrigopeereez@student.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/04/22 10:55:30 by rodrigopeer       #+#    #+#              #
#    Updated: 2025/04/22 10:55:30 by rodrigopeer      ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME			= so_long

GREEN			= \033[0;32m
RED				= \033[0;31m
RESET			= \033[0m

MLX_DIR			= ./libraries/minilibx-linux
INCLUDES		= -I$(LIBFT_DIR) -I$(MLX_DIR)

LIBFT_DIR		= ./libraries/Libft
LIBFT			= $(LIBFT_DIR)/libft.a

CC 				= gcc

STANDARD_FLAGS 	= -Wall -Werror -Wextra
MINILIBX_FLAGS = -L$(MLX_DIR) -lmlx -lXext -lX11

VALGRIND		= @valgrind --leak-check=full --show-leak-kinds=all \
--track-origins=yes --quiet --tool=memcheck --keep-debuginfo=yes

REMOVE 			= rm -f

SRCS_DIR		= ./sources/

SRCS 			= $(addprefix $(SRCS_DIR),\
				so_long.c			\
				ft_check_map.c		\
				ft_close_game.c		\
				ft_free_memory.c	\
				ft_handle_input.c	\
				ft_init_game.c		\
				ft_init_map.c		\
				ft_render_map.c		\
				ft_utils.c)

all:			${LIBFT} ${NAME}

${NAME}:
				${CC} $(STANDARD_FLAGS) $(INCLUDES) $(SRCS) $(LIBFT) $(MINILIBX_FLAGS) -o $(NAME)
				@echo "$(NAME): Compiled successfully."

${LIBFT}:
				@echo
				make bonus -C libraries/Libft

clean:
				make clean -C libraries/Libft
				@echo

fclean:
				${REMOVE} ${NAME}
				@echo "${NAME}: ${RED}${NAME} were deleted${RESET}"
				@echo

re:				fclean all

run:			${NAME}
				${VALGRIND} ./${NAME} assets/maps/valid/map4.ber

.PHONY:			all clean fclean re valgrind run