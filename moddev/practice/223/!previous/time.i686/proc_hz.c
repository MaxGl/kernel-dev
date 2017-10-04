#include "libdiag.h"
                    
uint64_t proc_hz( void ) {
   time_t t1, t2;
   uint64_t cf, cs;
   time( &t1 );
   while( t1 == time( &t2 ) ) cf  = rdtsc();
   while( t2 == time( &t1 ) ) cs  = rdtsc();
   return (unsigned long)( cs - cf - calibr( 1000 ) );
}

