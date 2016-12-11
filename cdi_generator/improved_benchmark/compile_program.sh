echo "=========CLEANING UP========\n"
rm $1.o
rm $1_program
rm $1.cdi.s

echo "=========BUILDING C========\n"
gcc --save-temps -c -g -std=c99 $1.c $2.c
echo "=========CDI PROCESSING ASM==========\n"
python ../gen_cdi.py $1.s $2.s
echo "=========BUILD CDI PROGRAM==========\n"
gcc -c -o $1.o $1.cdi.s
gcc -c -o $2.o $2.cdi.s 
gcc -o $1_program $1.o $2.o cdi_abort.o
echo "=========RUN CDI PROGRAM==========\n"
./$1_program
