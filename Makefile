NAME = libftprintf.a
LIBFTNAME = libft.a
LIBFTDIR = ./libft

CC = cc
CFLAGS = -Wall -Wextra -Werror

SRCS = ft_printf.c \
       uns_itoa.c \
       hex_itoa.c

OBJS = $(SRCS:.c=.o)

all: $(NAME)

%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@

$(NAME): $(OBJS) $(LIBFTDIR)/$(LIBFTNAME)
	@cp $(LIBFTDIR)/$(LIBFTNAME) $(NAME)
	@ar -rcs $(NAME) $(OBJS)

$(LIBFTDIR)/$(LIBFTNAME):
	@make -C $(LIBFTDIR) CFLAGS="$(CFLAGS)"

clean:
	@rm -f $(OBJS)
	@cd $(LIBFTDIR) && make clean

fclean: clean
	@rm -f $(NAME)
	@cd $(LIBFTDIR) && make fclean

re: fclean all

.PHONY: all clean fclean re
