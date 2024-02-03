SOURCE = systeme.c

OUTPUT = systeme

CC = gcc

CFLAGS = -D_REENTRANT -I ft_v1.0/include/ -L ft_v1.0/lib/ -pthread -lfthread

all: $(OUTPUT)

$(OUTPUT): $(SOURCE)
	$(CC) $(CFLAGS) -o $(OUTPUT) $(SOURCE)

clean:
	rm -f $(OUTPUT)

