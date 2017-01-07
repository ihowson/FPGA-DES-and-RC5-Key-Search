// write format:
// data 48 bits | addr 8 bits | unused | read/write | dvalid | ready | version 4 bits

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/mman.h>

#include "iflib.h"
#include "ks2.h"

char *memp;
int fd;
int numunits;


const int BUFFER = 0;
const int CTEXT = 1;
const int PTEXT = 2;
const int IV = 3;

const int S_VERSION = 0xf;
const int S_READY = 16;
const int S_DVALID = 32;
const int S_RW = 64;
const int S_UNUSED = 128;
const int S_ADDR = 0xff00;
const int S_LSDATA = 0xffff0000;
const int S_MATCH = 0x40000;
const int S_RUN = 0x20000;
const int S_KEYVALID = 0x10000;

const int MAXUNITS = 16;

KeySearch2::KeySearch2() {
    // set up the interface
    fd = open(DEVICE, O_RDWR);
    memp = (char *)mmap(NULL, MTRRZ, PROT_READ, MAP_PRIVATE, fd, 0);
    if (memp  == MAP_FAILED) {
	perror(DEVICE);
	exit(1);
    }

    // read out the version
    int ver;
    read32(&ver, pil_addr(BUFFER));
    version = ver & S_VERSION;

    // count the number of search units - they should be initialised with a value of 1
    int i;
    //units.push_back(new SearchUnit(0, this));
    //units.push_back(new SearchUnit(1, this));

    for (i = 0; i < MAXUNITS; i++) {
        //      printf("checking %d\n", i);
        units.push_back(new SearchUnit(i, this));
	//printf("addr = %d key = %x\n", i, units[i]->getKey());
	if (units[i]->getKey() != 1) {
	    numunits = i;
	    delete units[i];
	    units.pop_back();
	    return;
	}
    }
}

KeySearch2::~KeySearch2() {
    munmap(memp, MTRRZ);

    // FIXME: delete the searchunit objects

    close(fd);
}

char* KeySearch2::pil_addr(int addr) {
    addr ^= 0xf0;
    return memp + addr * 8;
}

void KeySearch2::wait_ready() {
    int64 status;
    int i;
  
    for (i = 0; i < 100; i++) { 
	read64(&status, pil_addr(BUFFER));
	if (status.w[0] & S_READY)
	    return;
    }
  
    printf("WARNING: timed out waiting for READY!\n");
}

int KeySearch2::getVersion() {
    return version;
}

void KeySearch2::setPlainText(int msw, int lsw) {
    setWord(PTEXT, msw, lsw);
}

void KeySearch2::setCipherText(int msw, int lsw) {
    setWord(CTEXT, msw, lsw);
}

void KeySearch2::setIV(int msw, int lsw) {
    setWord(IV, msw, lsw);
}

void KeySearch2::setWord(int addr, int msw, int lsw) {
    int64 i;
  
    wait_ready();
  
    i.w[1] = msw;
    i.w[0] = lsw;
  
    printf("write64 0x%x %x\n", msw, lsw);

    write64(i, pil_addr(addr));
}

int64 KeySearch2::getWord(int addr) {
    int64 i;
  
    wait_ready();
  
    read64(&i, pil_addr(addr));
    printf("\tread 0x%x %x from %x\n", i.w[1], i.w[0], addr);
    return i;
}

int64 KeySearch2::readBuffer(int addr) {
    wait_ready();
    setWord(BUFFER, 0, (addr & 0xff) << 8);
    wait_ready();
    return getWord(BUFFER);
}

void KeySearch2::writeBuffer(int addr, int msw, int lsw) {
    int m, l;

    m = (msw & 0xffff) << 16 + ((lsw & 0xffff0000) >> 16);
    l = ((lsw & 0xffff) << 16) + ((addr & 0xff) << 8) + S_RW;

    setWord(BUFFER, m, l);
}

int KeySearch2::getKey(int index) {
    int64 i;
    
    i = readBuffer(index);
    //printf("\tstatus is 0x%x\n", i.w[0]);
    return i.w[1];
}

int KeySearch2::getUnitCount() {
    return units.size();
}

SearchUnit& KeySearch2::operator[](const int& i) {
    return *units[i];
}

SearchUnit::SearchUnit(const int& i, KeySearch2* keysearch) {
    index = i;
    ks = keysearch;
}

void SearchUnit::setBlock(int msw, int lsw) {
    ks->writeBuffer(index, msw, lsw);
    blockm = msw;
    blockl = lsw;
}

int64 SearchUnit::getBlock() {
    int64 i;
    i.w[1] = blockm;
    i.w[0] = blockl;

    return i;
}

int SearchUnit::getKey() {
    return ks->getKey(index);
}

bool SearchUnit::gotMatch() {
    int64 i;
    i = ks->readBuffer(index);

    if (i.w[0] & S_MATCH)
	return true;
    
    return false;
}

bool SearchUnit::isRunning() {
    int64 i;
    i = ks->readBuffer(index);

    if (i.w[0] & S_RUN)
	return true;
    
    return false;
}
    
bool SearchUnit::hasKey() {
    int64 i;
    i = ks->readBuffer(index);

    if (i.w[0] & S_KEYVALID)
	return true;
    
    return false;
}

void SearchUnit::restart() {
    setBlock(blockm, blockl);
}
