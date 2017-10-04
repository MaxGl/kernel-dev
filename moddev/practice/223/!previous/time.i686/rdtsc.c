#include "libdiag.h"

unsigned long long rdtsc( void ) {
   unsigned long long int x;
// asm volatile ( ".byte 0x0f, 0x31" : "=A" (x) );
   asm volatile ( "rdtsc" : "=A" (x) );
   return x;
}
