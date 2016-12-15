#include <stdio.h>
void bar(){
	printf("bar\n");
}
void foo(){
	printf("foo\n");
}

int main(){
	printf("main\n");
	foo();
	foo();
	bar();
	printf("fin\n");
}

// bar has two callsites
// foo has three callsites
