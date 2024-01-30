SOURCE = systeme.c

OUTPUT = systeme

CC = gcc

CFLAGS = -pthread

all: $(OUTPUT)

$(OUTPUT): $(SOURCE)
	$(CC) $(CFLAGS) -o $(OUTPUT) $(SOURCE)

clean:
	rm -f $(OUTPUT)

