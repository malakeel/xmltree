#include "tree.h"


int main(int argc, char** argv){

  char pathname[256] ;

  if (argc > 1)
    strcpy( pathname , argv[1]);
  else
    getcwd(pathname, 256); 

  struct dirent * entry;
  DIR * dir_p ;

  if ((dir_p= opendir(pathname)) == NULL){
    perror("Error: ");
    return ;
  }

  entry = readdir(dir_p) ; 
  list_directory(pathname );
}

