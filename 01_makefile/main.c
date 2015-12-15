
#include <stdio.h>
#include <errno.h>
#include <unistd.h>

const char data[13] = "hacktheplanet";

int main(int argc, char** argv) {
	
	char other[sizeof(data)];

	for(int i=0; i<sizeof(data); i++) {
		other[i] = data[i];
	}

	while(1);

	return 0;
}

