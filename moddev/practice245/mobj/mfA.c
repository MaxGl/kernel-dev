#include <linux/module.h>

extern char *mod_func_1( void ) {
   static char *ststr = __FUNCTION__ ;
   return ststr;   
};
EXPORT_SYMBOL( mod_func_1 );
