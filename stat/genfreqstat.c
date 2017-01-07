#include <stdio.h>
#include <math.h>

int main (int argc, char **argv) {
    FILE* fd;
    int i;
    int count[256];
    int c;
    int maxval;
    int divisor;

    for (i = 0; i < 256; i++)
	count[i] = 0;

    for (i = 1; i < argc; i++) {
	fd = fopen(argv[1], "rb");
	
	c = fgetc(fd);
	while (c != EOF) {
	    count[(unsigned char)c]++;
	    c = fgetc(fd);
	}

	fclose(fd);
    }


    maxval = count[0];
    for (i = 1; i < 256; i++)
	if (count[i] > maxval)
	    maxval = count[i];

    divisor = ceil((double)maxval / 255.0);
    
    for (i = 0; i < 256; i++)
	count[i] /= divisor;

    //    for (i = 0; i < 256; i++)
    //	printf("% 4d: %d\n", i, count[i]);

    printf("       INIT_00 : bit_vector := X\"");
    for (i = 31; i >= 0; i--)
	printf("%02x", count[i]);

    printf("\";\n       INIT_01 : bit_vector := X\"");
    for (i = 63; i >= 32; i--)
	printf("%02x", count[i]);

    printf("\";\n       INIT_02 : bit_vector := X\"");
    for (i = 95; i >= 64; i--)
	printf("%02x", count[i]);

    printf("\";\n       INIT_03 : bit_vector := X\"");
    for (i = 127; i >= 96; i--)
	printf("%02x", count[i]);

    printf("\";\n       INIT_04 : bit_vector := X\"");
    for (i = 159; i >= 128; i--)
	printf("%02x", count[i]);

    printf("\";\n       INIT_05 : bit_vector := X\"");
    for (i = 191; i >= 160; i--)
	printf("%02x", count[i]);

    printf("\";\n       INIT_06 : bit_vector := X\"");
    for (i = 223; i >= 192; i--)
	printf("%02x", count[i]);

    printf("\";\n       INIT_07 : bit_vector := X\"");
    for (i = 255; i >= 224; i--)
	printf("%02x", count[i]);

    printf("\");\n");
}
