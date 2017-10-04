#include <stdio.h>

extern void asmexit( int retcod );

int main( int argc, char *argv[] ) {
   printf( "----- begin prog\n" );
   int ret = 7;
   asmexit( ret );
   printf( "----- final prog\n" );
   return 0;    // never!
};
