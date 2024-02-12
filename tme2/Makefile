CC = gcc

CFLAGS = -D_REENTRANT -I ft_v1.0/include/ -L ft_v1.0/lib/

all: systeme ancienSystem

systeme: systeme.c
	$(CC) $(CFLAGS) -o systeme systeme.c -pthread -lfthread

ancienSystem: ancienSystem.c
	$(CC) $(CFLAGS) -o ancienSystem ancienSystem.c -pthread -lfthread

clean:
	rm -f systeme ancienSystem

