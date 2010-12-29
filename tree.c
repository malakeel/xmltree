#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/dir.h>
//#include <sys/param.h>
#include <string.h>
#include <dirent.h>
#include <sys/stat.h>
#include <unistd.h>

#define FALSE 0
#define TRUE !FALSE

extern  int alphasort();

int get_files(char * directory_name , struct direct **files ){
  int filter_dots();
  return scandir(directory_name, &files, filter_dots, alphasort);
}

int list_directory(char * directory ){

  struct direct **files;
  struct stat   statbuf ; 
  
  int filter_dots();
  int count = scandir(directory, &files, filter_dots, alphasort);
  
  //int count = get_files(top_dir,files);
  int i = 0; 
  char * current_file;

  if(count == 0){
    printf("<directory name=\"%s\"/>\n", directory);
  }
  else
    {
      printf("<directory name=\"%s\">\n", directory);
      chdir(directory);
      for (i=0;i<count;i++){
	current_file = files[i]->d_name ;
	int e = stat(current_file  , &statbuf);
	if(e != 0){
	  perror("e");
	}
	//if directory
	if(S_ISDIR((&statbuf)->st_mode)){
	    list_directory(current_file );
	  }
	else
	  printf("<file>%s</file>\n",current_file);
      }
      chdir("../");
      printf("</directory>\n");    }
}

int filter_dots(struct direct   *entry){
  char * tmp = entry->d_name;  
  
  if ((strcmp(entry->d_name, ".") == 0) || (strcmp(entry->d_name, "..") == 0))
    return 0;
  else
    return (TRUE);
}





/* Read directory entries from FD into BUF, reading at most NBYTES.
   Reading starts at offset *BASEP, and *BASEP is updated with the new
   position after reading.  Returns the number of bytes read; zero when at
   end of directory; or -1 for errors.  
   extern __ssize_t getdirentries (int __fd, char *__restrict __buf,
   size_t __nbytes,
	
*/

