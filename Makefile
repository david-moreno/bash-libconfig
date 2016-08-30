NAME=libconfig
DIR=/usr/lib/bash
#MANDIR=/usr/share/man/man

install:
	install -m 644 $(NAME) $(DIR)
	#install $(MAN_NAME) $(MANDIR)

uninstall:
	rm -f $(DIR)/$(NAME)
	#rm -f $(DIR)/$(NAME)
