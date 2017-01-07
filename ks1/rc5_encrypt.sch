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
        SIGNAL "trial_key(71:0)"
        SIGNAL "XLXN_13(31:0)"
        SIGNAL "XLXN_15(5:0)"
        SIGNAL "XLXN_16"
        SIGNAL "XLXN_22(31:0)"
        SIGNAL "next_key"
        SIGNAL "ptext_valid"
        SIGNAL "XLXN_25(31:0)"
        SIGNAL "XLXN_26(5:0)"
        SIGNAL "XLXN_27"
        SIGNAL "XLXN_28"
        SIGNAL "XLXN_24"
        PORT Input "clk"
        PORT Input "run"
        PORT Output "ptext(63:0)"
        PORT Input "ctext(63:0)"
        PORT Input "trial_key(71:0)"
        PORT Output "next_key"
        PORT Output "ptext_valid"
        BEGIN BLOCKDEF "rc5_statemachine"
            TIMESTAMP 2003 9 13 13 45 38
            RECTANGLE N 64 -448 496 0 
            LINE N 64 -416 0 -416 
            LINE N 64 -288 0 -288 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 496 -416 560 -416 
            LINE N 496 -352 560 -352 
            LINE N 496 -288 560 -288 
            LINE N 496 -224 560 -224 
            RECTANGLE N 496 -236 560 -212 
            LINE N 496 -160 560 -160 
            RECTANGLE N 496 -172 560 -148 
            LINE N 496 -96 560 -96 
            RECTANGLE N 496 -108 560 -84 
            LINE N 496 -32 560 -32 
            RECTANGLE N 496 -44 560 -20 
        END BLOCKDEF
        BEGIN BLOCKDEF "rc5_ram"
            TIMESTAMP 2003 9 13 8 16 39
            RECTANGLE N 64 -256 400 128 
            LINE N 64 -224 0 -224 
            LINE N 64 -144 0 -144 
            LINE N 64 16 0 16 
            RECTANGLE N 0 4 64 28 
            LINE N 64 -64 0 -64 
            RECTANGLE N 0 -76 64 -52 
            LINE N 0 96 64 96 
            RECTANGLE N 0 84 64 108 
        END BLOCKDEF
        BEGIN BLOCKDEF "rc5_docrypt"
            TIMESTAMP 2003 9 13 13 46 13
            RECTANGLE N 64 -384 464 0 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 464 -352 528 -352 
            LINE N 464 -32 528 -32 
            RECTANGLE N 464 -44 528 -20 
        END BLOCKDEF
        BEGIN BLOCK "sm" "rc5_statemachine"
            PIN "clk" "clk"
            PIN "run" "run"
            PIN "key(71:0)" "trial_key(71:0)"
            PIN "ramdout(31:0)" "XLXN_13(31:0)"
            PIN "next_key" "next_key"
            PIN "ramwe" "XLXN_16"
            PIN "start_round" "XLXN_24"
            PIN "ramaddr(5:0)" "XLXN_26(5:0)"
            PIN "ramdin(31:0)" "XLXN_25(31:0)"
            PIN "s0(31:0)" "XLXN_15(5:0)"
            PIN "s1(31:0)" "XLXN_22(31:0)"
        END BLOCK
        BEGIN BLOCK "XLXI_1" "rc5_docrypt"
            PIN "clk" "clk"
            PIN "run" "run"
            PIN "start_round" "XLXN_24"
            PIN "ptext(63:0)" "ctext(63:0)"
            PIN "s0(31:0)" "XLXN_15(5:0)"
            PIN "s1(31:0)" "XLXN_22(31:0)"
            PIN "ctext_valid" "ptext_valid"
            PIN "ctext(63:0)" "ptext(63:0)"
        END BLOCK
        BEGIN BLOCK "ram" "rc5_ram"
            PIN "clk" "clk"
            PIN "we" "XLXN_16"
            PIN "din(31:0)" "XLXN_25(31:0)"
            PIN "addr(5:0)" "XLXN_26(5:0)"
            PIN "dout(31:0)" "XLXN_13(31:0)"
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
        BEGIN INSTANCE "sm" 1280 1312 R0
        END INSTANCE
        BEGIN BRANCH "ptext(63:0)"
            WIRE 3184 1280 3200 1280
            WIRE 3200 1280 3344 1280
        END BRANCH
        BEGIN BRANCH "ctext(63:0)"
            WIRE 2448 1152 2640 1152
            WIRE 2640 1152 2656 1152
        END BRANCH
        BEGIN BRANCH "trial_key(71:0)"
            WIRE 928 1152 1280 1152
        END BRANCH
        IOMARKER 928 1152 "trial_key(71:0)" R180 28
        BEGIN BRANCH "XLXN_13(31:0)"
            WIRE 1264 1280 1280 1280
            WIRE 1264 1280 1264 1376
            WIRE 1264 1376 1728 1376
            WIRE 1728 1376 1728 1568
            WIRE 1664 1568 1728 1568
        END BRANCH
        BEGIN BRANCH "run"
            WIRE 1200 1024 1280 1024
            BEGIN DISPLAY 1200 1024 ATTR "Name"
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "clk"
            WIRE 1200 896 1280 896
            BEGIN DISPLAY 1200 896 ATTR "Name"
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "XLXN_22(31:0)"
            WIRE 1840 1280 2656 1280
        END BRANCH
        BEGIN BRANCH "XLXN_15(5:0)"
            WIRE 1840 1216 2656 1216
        END BRANCH
        BEGIN BRANCH "XLXN_24"
            WIRE 1840 1024 2368 1024
            WIRE 2368 1024 2368 1088
            WIRE 2368 1088 2656 1088
        END BRANCH
        BEGIN BRANCH "next_key"
            WIRE 1840 896 2112 896
        END BRANCH
        IOMARKER 2112 896 "next_key" R0 28
        BEGIN BRANCH "ptext_valid"
            WIRE 3184 960 3200 960
            WIRE 3200 960 3344 960
        END BRANCH
        BEGIN INSTANCE "ram" 1664 1664 R180
        END INSTANCE
        BEGIN BRANCH "XLXN_25(31:0)"
            WIRE 1664 1648 1952 1648
            WIRE 1840 1152 1952 1152
            WIRE 1952 1152 1952 1648
        END BRANCH
        BEGIN BRANCH "XLXN_26(5:0)"
            WIRE 1664 1728 1936 1728
            WIRE 1840 1088 1936 1088
            WIRE 1936 1088 1936 1728
        END BRANCH
        BEGIN BRANCH "clk"
            WIRE 1664 1888 1744 1888
        END BRANCH
        BEGIN INSTANCE "XLXI_1" 2656 1312 R0
        END INSTANCE
        BEGIN BRANCH "clk"
            WIRE 2560 960 2656 960
        END BRANCH
        BEGIN BRANCH "run"
            WIRE 2560 1024 2656 1024
        END BRANCH
        BEGIN BRANCH "XLXN_16"
            WIRE 1664 1728 1936 1728
            WIRE 1664 1808 1920 1808
            WIRE 1840 960 1920 960
            WIRE 1920 960 1920 1808
            WIRE 1840 1088 1936 1088
            WIRE 1936 1088 1936 1728
        END BRANCH
        IOMARKER 3344 1280 "ptext(63:0)" R0 28
        IOMARKER 3344 960 "ptext_valid" R0 28
        IOMARKER 2448 1152 "ctext(63:0)" R180 28
    END SHEET
END SCHEMATIC
