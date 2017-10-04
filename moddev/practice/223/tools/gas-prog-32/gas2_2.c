#include <stdio.h>

int main( int argc, char *argv[] ) {
   printf( "----- begin prog\n" );
   int ret = 7;
   asm volatile (
     "movl  $1, %%eax\n"
     "movl  %0, %%ebx\n"
     "int $0x80\n"     
     : : "b"(ret) : "%eax"
   );
   printf( "----- final prog\n" );
   return 0;    // never!
};
      


