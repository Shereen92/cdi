/*
ybench_ret10 ~ A benchmark featuring initial return sleds of length 10.
*/

#include <stdio.h>

int obtain_number() {
    return 1;
}


int main() {
    int n = 0;
    for(int i = 0; i < 1000000000; i++) {
        n += obtain_number();
        n += obtain_number();
        n += obtain_number();
        n += obtain_number();
        n += obtain_number();
        n += obtain_number();
        n += obtain_number();
        n += obtain_number();
        n += obtain_number();
        n += obtain_number();
    }
    
    printf("%d\n", n);
    return 0;
}