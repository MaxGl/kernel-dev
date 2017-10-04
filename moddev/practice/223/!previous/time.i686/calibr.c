#include "libdiag.h"

#define NUMB 10
unsigned calibr( int rep ) {
   uint32_t n, m, sum = 0;
   n = m = ( rep >= 0 ? NUMB : rep );
   while( n-- ) {
      uint64_t cf, cs;   
      cf = rdtsc();
      cs = rdtsc();
      sum += (uint32_t)( cs - cf );
   }
   return sum / m;
}
