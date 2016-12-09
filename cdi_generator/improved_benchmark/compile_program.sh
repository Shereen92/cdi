python ../gen_cdi.py test.s
gcc -c -o test.o test.cdi.s 
gcc -o test_program test.o cdi_abort.o
./test_program
