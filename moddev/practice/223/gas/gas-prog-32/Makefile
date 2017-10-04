CC = gcc -Wall
LIST = gas1 gas2_0 gas2_1 gas2_2

all:    $(LIST)

gas2_1:	gas2_1.c exit.S
	gcc -c gas2_1.c -o gas2_1.o
	gcc -c exit.S -o exit.o
	gcc gas2_1.o exit.o -o gas2_1
	@rm -f *.o

clean disclean:
	@rm -f *.o
	@rm -f $(LIST)
