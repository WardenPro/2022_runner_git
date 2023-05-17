# E89 Pedagogical & Technical Lab
# project:     tp_laser
# created on:  2022-11-22 - 09:39 +0100
# 1st author:  quentin.gimenez - quentin.gimenez
# description: Makefile

NAME	=	runner

SRCS	=	src/main.c			\
		src/map.c			\
		src/action_wall.c		\
		src/reset_player_pos.c		\
		src/clear_pixelarray.c		\
		src/mk_colour.c			\
		src/deg_to_rads.c		\
		src/move_forward.c		\
		src/send_ray.c			\
		src/pos_from_accurate.c		\
		src/put_pixel.c			\
		src/draw_line.c			\
		src/get_ratio.c			\
		src/get_value.c			\
		src/keys_actions.c		\
		src/raycasting.c		\

OBJS	=	$(SRCS:.c=.o)

CFLAGS	+=	-W -Wall -Wextra -Werror -Iinclude/

LDFLAGS	+= 	-llapin -lsfml-graphics -lsfml-audio -lsfml-window -lsfml-system -lstdc++ -lm -lavcall

RM	=	rm -vf

CC	:=	gcc

ifdef RELEASE
CFLAGS += -O2
endif

ifdef DEBUG
CFLAGS += -g
endif

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS) -o $(NAME)

save:
	git status
	git add src/*.c src/*.jpg include/*.h Makefile
	git commit -m "$(NAME) save"
	git push

clean:
	@$(RM) $(OBJS)

fclean: clean
	@$(RM) $(NAME)

re: fclean all

# Theses rules do not directly map to a specific file
.PHONY: all clean fclean re
