VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtexe"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL "clk"
        SIGNAL "run"
        SIGNAL "ptext(63:0)"
        SIGNAL "ctext(63:0)"
        SIGNAL "ptext_valid"
        SIGNAL "iv(63:0)"
        SIGNAL "trial_key(71:0)"
        SIGNAL "next_key"
        SIGNAL "ramsel"
        SIGNAL "ramwea"
        SIGNAL "ramaddra(7:0)"
        SIGNAL "ramdoa(31:0)"
        SIGNAL "ramdia(31:0)"
        SIGNAL "ramdob(31:0)"
        SIGNAL "ramweb"
        SIGNAL "ramdib(31:0)"
        SIGNAL "ramaddrb(7:0)"
        PORT Input "clk"
        PORT Input "run"
        PORT Output "ptext(63:0)"
        PORT Input "ctext(63:0)"
        PORT Output "ptext_valid"
        PORT Input "iv(63:0)"
        PORT Input "trial_key(71:0)"
        PORT Output "next_key"
        BEGIN BLOCKDEF "rc5_ram"
            TIMESTAMP 2003 9 25 22 49 25
            LINE N 64 176 0 176 
            LINE N 64 256 0 256 
            LINE N 64 336 0 336 
            RECTANGLE N 0 324 64 348 
            LINE N 64 416 0 416 
            RECTANGLE N 0 404 64 428 
            LINE N 64 496 0 496 
            RECTANGLE N 0 484 64 508 
            LINE N 64 576 0 576 
            RECTANGLE N 0 564 64 588 
            LINE N 400 176 464 176 
            RECTANGLE N 400 164 464 188 
            LINE N 400 256 464 256 
            RECTANGLE N 400 244 464 268 
            LINE N 64 -224 0 -224 
            RECTANGLE N 64 -256 400 608 
        END BLOCKDEF
        BEGIN BLOCKDEF "rc5_decrypt"
            TIMESTAMP 2003 9 25 22 49 51
            LINE N 64 96 0 96 
            LINE N 64 160 0 160 
            RECTANGLE N 0 148 64 172 
            LINE N 464 96 528 96 
            LINE N 464 160 528 160 
            LINE N 464 224 528 224 
            RECTANGLE N 464 212 528 236 
            LINE N 464 288 528 288 
            RECTANGLE N 464 276 528 300 
            LINE N 64 32 0 32 
            RECTANGLE N 0 20 64 44 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 464 -352 528 -352 
            LINE N 464 -32 528 -32 
            RECTANGLE N 464 -44 528 -20 
            RECTANGLE N 64 -384 464 320 
        END BLOCKDEF
        BEGIN BLOCKDEF "rc5_keyschedule"
            TIMESTAMP 2003 9 25 22 49 56
            RECTANGLE N 64 -256 496 0 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 496 -224 560 -224 
            LINE N 496 -160 560 -160 
            LINE N 496 -96 560 -96 
            RECTANGLE N 496 -108 560 -84 
            LINE N 496 -32 560 -32 
            RECTANGLE N 496 -44 560 -20 
        END BLOCKDEF
        BEGIN BLOCK "ram32x8x2p" "rc5_ram"
            PIN "clk" "clk"
            PIN "wea" "ramwea"
            PIN "web" "ramweb"
            PIN "dia(31:0)" "ramdia(31:0)"
            PIN "addra(7:0)" "ramaddra(7:0)"
            PIN "dib(31:0)" "ramdib(31:0)"
            PIN "addrb(7:0)" "ramaddrb(7:0)"
            PIN "doa(31:0)" "ramdoa(31:0)"
            PIN "dob(31:0)" "ramdob(31:0)"
        END BLOCK
        BEGIN BLOCK "decrypt_init" "rc5_decrypt"
            PIN "clk" "clk"
            PIN "run" "run"
            PIN "ramsel" "ramsel"
            PIN "ctext(63:0)" "ctext(63:0)"
            PIN "iv(63:0)" "iv(63:0)"
            PIN "ramdout(31:0)" "ramdob(31:0)"
            PIN "ptext_valid" "ptext_valid"
            PIN "nextkey" "next_key"
            PIN "ramwe" "ramweb"
            PIN "ptext(63:0)" "ptext(63:0)"
            PIN "ramdin(31:0)" "ramdib(31:0)"
            PIN "ramaddr(7:0)" "ramaddrb(7:0)"
        END BLOCK
        BEGIN BLOCK "keysched" "rc5_keyschedule"
            BEGIN ATTR KEEP_HIERARCHY TRUE
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
                VALUETYPE Boolean
            END ATTR
            PIN "clk" "clk"
            PIN "run" "run"
            PIN "key(71:0)" "trial_key(71:0)"
            PIN "ramdout(31:0)" "ramdoa(31:0)"
            PIN "ramwe" "ramwea"
            PIN "ramsel" "ramsel"
            PIN "ramaddr(7:0)" "ramaddra(7:0)"
            PIN "ramdin(31:0)" "ramdia(31:0)"
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        IOMARKER 192 1968 "clk" R180 28
        BEGIN BRANCH "clk"
            WIRE 192 1968 272 1968
        END BRANCH
        IOMARKER 192 1888 "run" R180 28
        BEGIN BRANCH "run"
            WIRE 192 1888 272 1888
        END BRANCH
        BEGIN BRANCH "ptext(63:0)"
            WIRE 3184 1280 3328 1280
            WIRE 3328 1280 3344 1280
        END BRANCH
        BEGIN BRANCH "ctext(63:0)"
            WIRE 2448 1152 2464 1152
            WIRE 2464 1152 2656 1152
        END BRANCH
        BEGIN BRANCH "ptext_valid"
            WIRE 3184 960 3200 960
            WIRE 3200 960 3328 960
            WIRE 3328 960 3344 960
        END BRANCH
        BEGIN BRANCH "clk"
            WIRE 2560 960 2656 960
        END BRANCH
        BEGIN BRANCH "run"
            WIRE 2560 1024 2656 1024
        END BRANCH
        IOMARKER 3344 1280 "ptext(63:0)" R0 28
        IOMARKER 3344 960 "ptext_valid" R0 28
        IOMARKER 2448 1152 "ctext(63:0)" R180 28
        BEGIN INSTANCE "decrypt_init" 2656 1312 R0
        END INSTANCE
        BEGIN BRANCH "iv(63:0)"
            WIRE 2448 1344 2464 1344
            WIRE 2464 1344 2656 1344
        END BRANCH
        IOMARKER 2448 1344 "iv(63:0)" R180 28
        BEGIN INSTANCE "ram32x8x2p" 1536 2176 R180
        END INSTANCE
        BEGIN BRANCH "clk"
            WIRE 1536 2400 1744 2400
            WIRE 1744 2400 1760 2400
        END BRANCH
        BEGIN INSTANCE "keysched" 1072 768 R0
            BEGIN DISPLAY -168 -376 ATTR "KEEP_HIERARCHY"
                FONT 28 "Arial"
                DISPLAYFORMAT NAMEEQUALSVALUE
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH "trial_key(71:0)"
            WIRE 720 672 1072 672
        END BRANCH
        IOMARKER 720 672 "trial_key(71:0)" R180 28
        BEGIN BRANCH "clk"
            WIRE 976 544 1072 544
            BEGIN DISPLAY 976 544 ATTR "Name"
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "run"
            WIRE 992 608 1072 608
            BEGIN DISPLAY 992 608 ATTR "Name"
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "next_key"
            WIRE 3184 1408 3456 1408
        END BRANCH
        IOMARKER 3456 1408 "next_key" R0 28
        BEGIN BRANCH "ramsel"
            WIRE 1632 608 1984 608
            WIRE 1984 608 2144 608
            WIRE 2144 608 2144 1408
            WIRE 2144 1408 2656 1408
            BEGIN DISPLAY 1984 608 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "ramwea"
            WIRE 1536 2000 1568 2000
            WIRE 1568 2000 1648 2000
            WIRE 1632 544 1648 544
            WIRE 1648 544 1648 2000
            BEGIN DISPLAY 1568 2000 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "ramaddra(7:0)"
            WIRE 1536 1760 1584 1760
            WIRE 1584 1760 1664 1760
            WIRE 1632 672 1664 672
            WIRE 1664 672 1664 1760
            BEGIN DISPLAY 1584 1760 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "ramdoa(31:0)"
            WIRE 1056 736 1072 736
            WIRE 1056 736 1056 1040
            WIRE 1056 1040 1056 2000
            WIRE 1056 2000 1072 2000
            BEGIN DISPLAY 1056 1040 ATTR "Name"
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "ramdia(31:0)"
            WIRE 1536 1840 1616 1840
            WIRE 1616 1840 1680 1840
            WIRE 1632 736 1680 736
            WIRE 1680 736 1680 1840
            BEGIN DISPLAY 1616 1840 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "ramdob(31:0)"
            WIRE 992 1472 992 1920
            WIRE 992 1920 1072 1920
            WIRE 992 1472 1168 1472
            WIRE 1168 1472 2656 1472
            BEGIN DISPLAY 1168 1472 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "ramweb"
            WIRE 1536 1920 1936 1920
            WIRE 1936 1920 3264 1920
            WIRE 3184 1472 3264 1472
            WIRE 3264 1472 3264 1920
            BEGIN DISPLAY 1936 1920 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "ramdib(31:0)"
            WIRE 1536 1680 1936 1680
            WIRE 1936 1680 3248 1680
            WIRE 3184 1536 3248 1536
            WIRE 3248 1536 3248 1680
            BEGIN DISPLAY 1936 1680 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "ramaddrb(7:0)"
            WIRE 1536 1600 1600 1600
            WIRE 1600 1600 1600 1712
            WIRE 1600 1712 3200 1712
            WIRE 3184 1600 3200 1600
            WIRE 3200 1600 3200 1712
            BEGIN DISPLAY 1600 1600 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
    END SHEET
END SCHEMATIC
