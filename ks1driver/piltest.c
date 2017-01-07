#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/mman.h>

#include "iflib.h"

char *memp;
int fd;
int numunits;

char *pil_addr(int addr) {
	addr ^= 0xf0;
	return memp + addr * 8;
}

const int STATUS = 0;
const int NEXTKEY = 1;
const int CTEXT = 2;
const int PTEXT = 3;
const int IV = 6;
const int SUSEL = 4;
const int SUKEY = 5;
const int DEBUG = 7;

const int S_VERSION = 15;
const int S_BUFFULL = 16;
const int S_DVALID = 32;
const int S_SUPRESENT = 64;
const int S_SURUNNING = 128;
const int S_BUFEMPTY = 256;

const int MAXUNITS = 16;

void die (void) {
	munmap(memp, MTRRZ);
	close(fd);
	exit(0);
}

void wait_dvalid (void) {
	int64 status;
	int i;
	
	for (i = 0; i < 100; i++) { 
		read64(&status, pil_addr(STATUS));
		if (status.w[0] & S_DVALID)
			return;
	}

	printf("WARNING: timed out waiting for DVALID!\n");
}

void pstat(int status) {
	int val;
	
	printf("status = %x { version 0x%x ", status, status & S_VERSION);
	if (status & S_BUFFULL)
		printf("BUFFER_FULL ");
	if (status & S_DVALID)
		printf("DVALID ");
	if (status & S_SUPRESENT)
		printf("SU_PRESENT ");
	if (status & S_SURUNNING)
		printf("SU_RUNNING ");
	if (status & S_BUFEMPTY)
		printf("S_BUFEMPTY ");
	printf("}\n");
}

int read_status(void) {
	int val;

	read32(&val, pil_addr(STATUS));
	return val;
}

void pil_init(void) {
	fd = open(DEVICE, O_RDWR);
	memp = (char *)mmap(NULL, MTRRZ, PROT_READ, MAP_PRIVATE, fd, 0);
	if (memp  == MAP_FAILED) {
		perror(DEVICE);
		exit(1);
	}
}

int detect_cores(void) {
	int i, status, last;

        printf("Detecting search units: ");
        for (i = 0; i < MAXUNITS; i++) {
                write32(i, pil_addr(SUSEL));
                wait_dvalid();
                read32(&status, pil_addr(STATUS));
                if (status & S_SUPRESENT) {
                        printf("%d ", i);
			last = i;
		}
        }
	printf("\n");
	printf("%d total search units\n\n", last + 1);
	return last + 1;
}

void write_ptext(int b, int a) {
	int64 i;

	wait_dvalid();

	i.w[1] = b;
	i.w[0] = a;
	
	write64(i, pil_addr(PTEXT));
}

void write_ctext(int b, int a) {
	int64 i;

	wait_dvalid();

	i.w[1] = b;
	i.w[0] = a;
	write64(i, pil_addr(CTEXT));
}

void write_iv(int b, int a) {
	int64 i;

	wait_dvalid();

	i.w[1] = b;
	i.w[0] = a;
	write64(i, pil_addr(IV));
}


void select_core(int core) {
	int64 i;

	wait_dvalid();
	
	i.w[1] = 0;
	i.w[0] = core;

	write64(i, pil_addr(SUSEL));
}

void set_key(int core, int b, int a) {
	int64 i;

	select_core(core);
	
	wait_dvalid();
	
	i.w[1] = b;
	i.w[0] = a;

	write64(i, pil_addr(SUKEY));
}

int64 read_key(int sel) {
	int64 val;

	wait_dvalid();

	val.w[0] = sel;
	val.w[1] = 0;

	write64(val, pil_addr(SUSEL));

	wait_dvalid();
	
	read64(&val, pil_addr(SUKEY));

	return val;
}

void clear_buffer(void) {
	write32(0, pil_addr(NEXTKEY));
}

int64 read_buf() {
	int64 val;

	read64(&val, pil_addr(NEXTKEY));

	return val;
}

int main (void)
{
	int version;
	int i, col;	
	int status;
	int64 i64;
	int prevkey;
	char messages[1024];
	char temp[1024];
	
	messages[0] = 0;
	
	strcat(messages, "Running\n");
	
	pil_init();

	status = read_status();

	version = status & S_VERSION;

	pstat(status);
	
	if (version == 0) {
		printf("ERROR: hardware reports version 0 (is board programmed?)\n");
		die();
	} else if (version != 1) {
		printf("ERROR: incorrect hardware version (expecting 1, got %d)\n", version);
		die();
	}

	
	printf("Board version is %d\n", version);

	numunits = detect_cores();

	// *** DES
	//write_ctext(0x617b3a0c, 0xe8f07100);
	//write_ptext(0x01234567, 0x89abcdef);
	
	// *** RC5
	//write_ctext(0x2fb7852a, 0x562d285a);
	//write_ptext(0x4bebbc07, 0x2615ef7a);
        write_ctext(0x562d285a, 0x2fb7852a);
	//write_ptext(0x50f9efe2, 0xb0af5ef2);
	
	//write_ctext(0, 0);
	write_ptext(0x4bebbc07, 0x2615ef7a);
	
	// *** RC5
	write_iv(0x1f59ce07, 0x419a1486);
	
	clear_buffer();
	
	// set initial keys
	// *** DES
	set_key(0, 0x11111111, 0);
	set_key(1, 0x01010100, 0x80000000);
	set_key(2, 0x22222222, 0);
	set_key(3, 0x33333333, 0);
	set_key(4, 0x60587f6b, 0x599b0000);
	set_key(5, 0x615bbceb, 0x60580000);
	set_key(6, 0x66666666, 0);
	set_key(7, 0x77777777, 0);
	set_key(8, 0x88888888, 0);
	set_key(9, 0x99999999, 0);
	set_key(0xa, 0xaaaaaaaa, 0);
	set_key(0xb, 0xbbbbbbbb, 0);
	set_key(0xc, 0xcccccccc, 0);
	set_key(0xd, 0xdddddddd, 0);
	set_key(0xe, 0xeeeeeeee, 0);
	
	// *** RC5
	set_key(0, 0x0, 0x0);
	
	// enter main loop
	while(1) {
		printf("\033[2J\033[H"); // clear screen
		col = 0;
		for (i = 0; i < numunits; i++) {
			if (col == 3) {
				col = 0;
				printf("\n");
			}
			col++;
			
			i64 = read_key(i);
			printf("\033[1m%3d\033[0m %08x %08x  ", i, i64.w[1], i64.w[0]);
		}

		printf("\n");
		
		pstat(status = read_status());
	
		strcat(messages, ".");
		
		while ((status & S_BUFEMPTY) == 0) {
			i64 = read_buf();
			sprintf(temp, "Found a key! 0x%x %x ", i64.w[1], i64.w[0]);
			strcat(messages, temp);
			i64 = read_buf();
			sprintf(temp, "or 0x%x %x\n", i64.w[1], i64.w[0]);
			strcat(messages, temp);
			status = read_status();
		}

		printf(messages);
		printf("\n");
		sleep(1);
	}		
	
	

	
	die();
	return 0;
}
