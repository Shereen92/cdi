# 1 "printf.c"
# 1 "/home/misiker/Desktop/CDI/cdi_generator/improved_benchmark//"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 32 "<command-line>" 2
# 1 "printf.c"
# 37 "printf.c"
# 1 "outchar.h" 1




void outchar(char c) {
    asm volatile ("syscall"
            :
            : "a" (1), "D" (1), "S" (&c), "d" (1)
       );
}
# 38 "printf.c" 2
# 1 "printf.h" 1
# 85 "printf.h"
# 1 "/home/misiker/Desktop/CDI/GCC/dest/lib/gcc/x86_64-pc-linux-gnu/6.1.0/include/stdarg.h" 1 3 4
# 40 "/home/misiker/Desktop/CDI/GCC/dest/lib/gcc/x86_64-pc-linux-gnu/6.1.0/include/stdarg.h" 3 4

# 40 "/home/misiker/Desktop/CDI/GCC/dest/lib/gcc/x86_64-pc-linux-gnu/6.1.0/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 99 "/home/misiker/Desktop/CDI/GCC/dest/lib/gcc/x86_64-pc-linux-gnu/6.1.0/include/stdarg.h" 3 4
typedef __gnuc_va_list va_list;
# 86 "printf.h" 2


# 87 "printf.h"
void tfp_printf(char *fmt, ...);
# 39 "printf.c" 2


void outchar(char c);

static char* bf;
static char buf[12];
static unsigned int num;
static char uc;
static char zs;

static void out(char c) {
    *bf++ = c;
    }

static void outDgt(char dgt) {
 out(dgt+(dgt<10 ? '0' : (uc ? 'A' : 'a')-10));
 zs=1;
    }

static void divOut(unsigned int div) {
    unsigned char dgt=0;
 num &= 0xffff;
 while (num>=div) {
  num -= div;
  dgt++;
  }
 if (zs || dgt>0)
  outDgt(dgt);
    }

void tfp_printf(char *fmt, ...)
 {
 va_list va;
 char ch;
 char* p;

 
# 75 "printf.c" 3 4
__builtin_va_start(
# 75 "printf.c"
va
# 75 "printf.c" 3 4
,
# 75 "printf.c"
fmt
# 75 "printf.c" 3 4
)
# 75 "printf.c"
                ;

 while ((ch=*(fmt++))) {
  if (ch!='%') {
   outchar(ch);
   }
  else {
   char lz=0;
   char w=0;
   ch=*(fmt++);
   if (ch=='0') {
    ch=*(fmt++);
    lz=1;
    }
   if (ch>='0' && ch<='9') {
    w=0;
    while (ch>='0' && ch<='9') {
     w=(((w<<2)+w)<<1)+ch-'0';
     ch=*fmt++;
     }
    }
   bf=buf;
   p=bf;
   zs=0;
   switch (ch) {
    case 0:
     goto abort;
    case 'u':
    case 'd' :
     num=
# 104 "printf.c" 3 4
        __builtin_va_arg(
# 104 "printf.c"
        va
# 104 "printf.c" 3 4
        ,
# 104 "printf.c"
        unsigned int
# 104 "printf.c" 3 4
        )
# 104 "printf.c"
                                ;
     if (ch=='d' && (int)num<0) {
      num = -(int)num;
      out('-');
      }
     divOut(10000);
     divOut(1000);
     divOut(100);
     divOut(10);
     outDgt(num);
     break;
    case 'x':
    case 'X' :
        uc= ch=='X';
     num=
# 118 "printf.c" 3 4
        __builtin_va_arg(
# 118 "printf.c"
        va
# 118 "printf.c" 3 4
        ,
# 118 "printf.c"
        unsigned int
# 118 "printf.c" 3 4
        )
# 118 "printf.c"
                                ;
     divOut(0x1000);
     divOut(0x100);
     divOut(0x10);
     outDgt(num);
     break;
    case 'c' :
     out((char)(
# 125 "printf.c" 3 4
               __builtin_va_arg(
# 125 "printf.c"
               va
# 125 "printf.c" 3 4
               ,
# 125 "printf.c"
               int
# 125 "printf.c" 3 4
               )
# 125 "printf.c"
                              ));
     break;
    case 's' :
     p=
# 128 "printf.c" 3 4
      __builtin_va_arg(
# 128 "printf.c"
      va
# 128 "printf.c" 3 4
      ,
# 128 "printf.c"
      char*
# 128 "printf.c" 3 4
      )
# 128 "printf.c"
                       ;
     break;
    case '%' :
     out('%');
    default:
     break;
    }
   *bf=0;
   bf=p;
   while (*bf++ && w > 0)
    w--;
   while (w-- > 0)
    outchar(lz ? '0' : ' ');
   while ((ch= *p++))
    outchar(ch);
   }
  }
 abort:;
 
# 146 "printf.c" 3 4
__builtin_va_end(
# 146 "printf.c"
va
# 146 "printf.c" 3 4
)
# 146 "printf.c"
          ;
 }
