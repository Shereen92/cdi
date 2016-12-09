gcc --save-temps -g -std=c99 $1.c
python ../gen_cdi.py $1.s
gcc -c -o $1.o $1.cdi.s 
gcc -o $1_program $1.o cdi_abort.o
./$1_program
