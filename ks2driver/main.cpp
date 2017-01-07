#include <iostream>

#include <unistd.h>
#include <cstdio>

#include "ks2.h"
#include "iflib.h"

int main (void)
{
    vector<int> keys;

    int64 ptext, ctext, iv;
    /*    // *** DES
    //write_ctext(0x617b3a0c, 0xe8f07100);
    //write_ptext(0x01234567, 0x89abcdef);
	
    // *** RC5
    //write_ctext(0x2fb7852a, 0x562d285a);
    //write_ptext(0x4bebbc07, 0x2615ef7a);
    write_ctext(0x562d285a, 0x2fb7852a);
    //write_ptext(0x50f9efe2, 0xb0af5ef2);
	
    //write_ctext(0, 0);
    write_ptext(0x4bebbc07, 0x2615ef7a);
    */
    // DES
    ptext.w[1] = 0x0;
    ptext.w[0] = 0x200;
    ctext.w[1] = 0x8ca64de9;
    ctext.w[0] = 0xc1b123a7;
    iv.w[1] = 0;
    iv.w[0] = 0;
    

    // XOR
    /*    ptext.w[1] = 0x0;
    ptext.w[0] = 0x089abcde;
    ctext.w[1] = 0x0;
    ctext.w[0] = 0x0;
    iv.w[1] = 0;
    iv.w[0] = 0;*/

    // RC5
    /*    ctext.w[1] = 0x562d285a;
    ctext.w[0] = 0x2fb7852a;
    ptext.w[1] = 0x4bebbc07;
    ptext.w[0] = 0x2615ef7a;
    iv.w[1] = 0x1f59ce07;
    iv.w[0] = 0x419a1486;
    */
    cout << "Initialising... ";
	
    KeySearch2 ks;

    int version = ks.getVersion();
    if (version != 2) {
	cout << "wrong board version detected (got " << version << ", expected 2" << endl;
	exit(0);
    }

    printf("board version is %d\n", version);

    cout << ks.getUnitCount() << " search units detected" << endl;

    cout << endl << "Setting up search parameters" << endl;
    printf("\tptext = 0x%x %x\n", ptext.w[1], ptext.w[0]);
    ks.setPlainText(ptext.w[1], ptext.w[0]);
    printf("\tctext = 0x%x %x\n", ctext.w[1], ctext.w[0]);
    ks.setCipherText(ctext.w[1], ctext.w[0]);
    printf("\t   iv = 0x%x %x\n\n", iv.w[1], iv.w[0]);
    ks.setIV(iv.w[1], iv.w[0]);
    
    int block = 0;

    for (int i = 0; i < ks.getUnitCount(); i++) {
        printf("setting su %d to %x", i, block);
        ks[i].setBlock(0, block++);
    }
	
    // DES only
    ks[0].setBlock(0, 0x01010101);


    // enter main loop
    while(1) {
	//	printf("\033[2J\033[H"); // clear screen
	int col = 0;
	for (int i = 0; i < ks.getUnitCount(); i++) {
	    if (col == 3) {
		col = 0;
		printf("\n");
	    }
	    col++;
	    
	    int key = ks[i].getKey();
	    printf("\033[1m%3d\033[0m %08x  ", i, key);
	    printf("key = %d run = %d match = %d", ks[i].hasKey(), ks[i].isRunning(), ks[i].gotMatch());
	    if (ks[i].gotMatch()) {
		keys.push_back(key);
		printf("unit %d got a match! 0x%x", i, key);
		int64 msw;
		ks[i].restart();
	    } else if (ks[i].isRunning() == false) {
	        // load in a new key
	        ks[i].setBlock(0, block);
		printf("unit %d is starting block 0x%x\n", i, block);
		block++;
	    }
	}

	printf("\n");
		
	sleep(1);
    }		
	
    return 0;
}
