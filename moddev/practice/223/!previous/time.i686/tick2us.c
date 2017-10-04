#include "libdiag.h"

double tick2us( unsigned long long proc_hz, unsigned long ticks ) {
   return ( ( 1E9 / proc_hz ) * ticks ) / 1000.;
}
