
tree:
	gcc -c tree.c 


main:	tree
	gcc -o xmltree main.c tree.o

clean:
	rm *.o xmltree 


