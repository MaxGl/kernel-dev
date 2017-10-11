#include "mod_proc.h"

static char *buf_msg;                      // размещаемый буфер устройства
static ulong size = 0;                     // max. размер буфера 
module_param( size, ulong, 0 );
static ulong length = 0;                   // актуальная (текущая) длина данных

#include "proc_node_read.c"
#include "proc_node_write.c"

char *node_var( void ) {
   static char str[ 40 ];
   sprintf( str, "%s_%d", NAME_NODE, VARIANT );
   return str;
}

struct file_operations proc_fops = {
  .read  = proc_node_read,
  .write = proc_node_write,
};

static struct proc_dir_entry *own_proc_node;

static int __init proc_init( void ) {
   int ret;
   own_proc_node =  // размещение имени устройства
          proc_create( node_var(), S_IFREG | S_IRUGO | S_IWUGO, NULL, &proc_fops );
   if( NULL == own_proc_node ) {
      ret = -ENOENT;
      ERR( "can't create /proc/%s", node_var() );
      goto err_node;
   }
   if( 0 == size ) size = LEN_MSG + 1;     // инициализация буфера устройства
   if( !( buf_msg = (char*)vmalloc( size ) ) ) {
      ret = -ENOMEM;
      ERR( "can't allocate buffer %ld bytes", size );
      goto err_mem;
   }
   memset( buf_msg, NULL_CHAR, size );     // обнуление буфера
   if( ( LEN_MSG + 1 ) == size ) {
      strcpy( buf_msg, 
              ".........1.........2.........3.........4.........5.........6\n" );
      length = strlen( buf_msg );
   }
   LOG( "/proc/%s installed, buffer size %ld", node_var(), size );
   return 0;
err_mem:
   remove_proc_entry( node_var() , NULL );
err_node:
   return ret;
}

static void __exit proc_exit( void ) {
   vfree( buf_msg );
   proc_remove( own_proc_node );
   LOG( "/proc/%s removed", node_var() );
}
