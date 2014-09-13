#include <stdio.h>
#include <stdlib.h>

int main( int argc, char **argv ){

	if( argc < 2 ){
		printf("Usage: %s <EnvironmentVariable>\r\n", argv[0]);
		exit(1);
	}

	printf("%s: %p\r\n", argv[1], getenv(argv[1]));
}
