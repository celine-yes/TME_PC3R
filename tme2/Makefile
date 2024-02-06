SOURCE = systeme.c

OUTPUT = systeme

CC = gcc

CFLAGS = -D_REENTRANT -I ft_v1.0/include/ -L ft_v1.0/lib/

all: $(OUTPUT)

$(OUTPUT): $(SOURCE)
	$(CC) $(CFLAGS) -o $(OUTPUT) $(SOURCE) -pthread -lfthread -v

clean:
	rm -f $(OUTPUT)

