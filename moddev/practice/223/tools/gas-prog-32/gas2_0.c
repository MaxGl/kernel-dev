#include <stdio.h>
#include <stdlib.h>

int main( int argc, char *argv[] ) {
   printf( "----- begin prog\n" );
   int ret = 7;
   exit( ret );
   printf( "----- final prog\n" );
   return 0;    // never!
};
      
