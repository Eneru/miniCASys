CC = gcc
CFLAGS = -Wall -g -pedantic -std=c99
IFLAGS = -Iinclude

OPATH = obj/
BPATH = bin/

vpath %.c src/
vpath %.h include/
vpath %.o obj/

main : main.o matrix.o operations.o resol.o memoire.o prompt.o parseur.o | bin
	$(CC) $(CFLAGS) -o $(BPATH)main $(OPATH)main.o $(OPATH)matrix.o $(OPATH)operations.o $(OPATH)resol.o $(OPATH)memoire.o $(OPATH)prompt.o $(OPATH)parseur.o

parseur.o : parseur.c parseur.h base.h
prompt.o : prompt.c prompt.h base.h
memoire.o : memoire.c memoire.h matrix.h
resol.o : resol.c resol.h matrix.h operations.h
matrix.o : matrix.c matrix.h
operations.o : operations.c operations.h matrix.h
main.o : main.c matrix.h operations.h resol.h

%.o : %.c | obj
	$(CC) $(CFLAGS) -o $(OPATH)$@ -c $< $(IFLAGS)

obj :
	mkdir obj

bin :
	mkdir bin

clean :
	rm obj/* bin/*

cleanall : clean
	rm -r lib/* doc/*

archive :
	tar -f L2S4-ALA-TP2_razanajato-harenome.tar.gz -cvz src/*.c include/*.h makefile
