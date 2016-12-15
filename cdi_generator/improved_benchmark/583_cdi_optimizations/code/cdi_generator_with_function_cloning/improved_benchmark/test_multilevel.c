#include <stdio.h>
void bar(){
	printf("bar\n");
}
void foo(){
	printf("foo\n");
	bar();
}

int main(){
	printf("main\n");
	foo();
	foo();
	printf("fin\n");
}

// bar has two callsites
// foo has three callsites
