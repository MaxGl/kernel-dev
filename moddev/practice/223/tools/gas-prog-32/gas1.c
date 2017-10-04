#include <stdio.h>

int main( int argc, char *argv[] ) {
   printf( "----- begin prog\n" );
   asm volatile( "nop\n"
                 "nop\n"
                 "nop\n"
                 "nop\n"
               );
   printf( "----- final prog\n" );               
   return 0;
};


