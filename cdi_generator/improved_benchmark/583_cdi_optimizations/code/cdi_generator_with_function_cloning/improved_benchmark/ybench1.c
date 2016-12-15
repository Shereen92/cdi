/*
ybench_ret1 ~ A benchmark featuring initial return sleds of length 1.
*/

#include <stdio.h>

int obtain_number() {
    return 1;
}


int main() {
    int n = 0;
    for(int i = 0; i < 1000000000; i++) {
        n += obtain_number();
    }
    
    printf("%d\n", n);
    return 0;
}