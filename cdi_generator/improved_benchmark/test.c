#include <stdio.h>
void bar(int i){
	printf("%d\n", i);
}
int foo(int num){
	int pr = 1;
	for(int i = 1;i <= num; ++i)
		pr *= i;
	bar(pr);
	return pr; // Fails on return sled of foo_2
}

int main(){
	int n1, n2, n3, n4;
	printf("hi1\n");
	n1 = 5;
	printf("hi2\n");
	n2 = foo(n1);
	printf("hi3\n");
	n3 = foo(n1+10);
	printf("hi4\n");
	n4 = foo(n1+5);
	printf("hi5\n");
	printf("%d! = %d \n", n1, n2);
	printf("%d! = %d \n", n1+10, n3);
	printf("%d \n", (1<<16) -1 );
	bar(n4);
}

// bar has two callsites
// foo has three callsites
