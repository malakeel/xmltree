#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/dir.h>
#include <string.h>
#include <dirent.h>
#include <sys/stat.h>




int get_files(char * directory_name , struct direct **files );

int list_directory(char * directory );


int filter_dots(struct direct   *entry);





/* Read directory entries from FD into BUF, reading at most NBYTES.
   Reading starts at offset *BASEP, and *BASEP is updated with the new
   position after reading.  Returns the number of bytes read; zero when at
   end of directory; or -1 for errors.  
   extern __ssize_t getdirentries (int __fd, char *__restrict __buf,
   size_t __nbytes,
	
*/

