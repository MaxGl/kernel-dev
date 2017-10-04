#include <stdio.h>
#include <stdlib.h>

void asmexit( short retcod ) {
   exit( retcod );
};

int main( int argc, char *argv[] ) {
//   printf( "----- begin prog\n" );
   short ret = 7;
   asmexit( ret );
//   printf( "----- final prog\n" );
   return 0;    // never!
};
