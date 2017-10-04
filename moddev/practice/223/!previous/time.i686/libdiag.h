#ifndef _LIBDIAG_H
#define _LIBDIAG_H

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <time.h>
#include <string.h>
#include <stdint.h>
#include <pthread.h>

unsigned long long rdtsc( void );
unsigned calibr( int rep );
uint64_t proc_hz( void );
void set_rt( void );
double tick2us( unsigned long long proc_hz, unsigned long ticks );

#endif
