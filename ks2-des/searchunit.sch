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
        SIGNAL "data(47:0)"
        SIGNAL "trialkey(79:0)"
        SIGNAL "keyvalid"
        SIGNAL "ptext(63:0)"
        SIGNAL "match"
        SIGNAL "ptextvalid"
        SIGNAL "XLXN_28(63:0)"
        SIGNAL "trialkey(31:0)"
        SIGNAL "nextkey"
        SIGNAL "selwrite"
        SIGNAL "write"
        SIGNAL "read"
        SIGNAL "selread"
        SIGNAL "addr(3:0)"
        SIGNAL "id(3:0)"
        SIGNAL "ctext(63:0)"
        SIGNAL "iv(63:0)"
        SIGNAL "trialkey(71:0)"
        PORT Input "clk"
        PORT BiDirectional "data(47:0)"
        PORT Input "ptext(63:0)"
        PORT Input "write"
        PORT Input "read"
        PORT Input "addr(3:0)"
        PORT Input "id(3:0)"
        PORT Input "ctext(63:0)"
        PORT Input "iv(63:0)"
        BEGIN BLOCKDEF "counter"
            TIMESTAMP 2003 9 28 12 20 52
            RECTANGLE N 64 -320 432 0 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 432 -288 496 -288 
            LINE N 432 -32 496 -32 
            RECTANGLE N 432 -44 496 -20 
        END BLOCKDEF
        BEGIN BLOCKDEF "sureg"
            TIMESTAMP 2003 9 28 22 3 14
            LINE N 64 32 0 32 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 400 -416 464 -416 
            RECTANGLE N 400 -428 464 -404 
            RECTANGLE N 64 -448 400 64 
        END BLOCKDEF
        BEGIN BLOCKDEF "run_control"
            TIMESTAMP 2003 9 28 12 49 29
            LINE N 64 160 0 160 
            LINE N 64 224 0 224 
            LINE N 64 -160 0 -160 
            LINE N 64 -32 0 -32 
            LINE N 496 -160 560 -160 
            RECTANGLE N 64 -192 496 256 
        END BLOCKDEF
        BEGIN BLOCKDEF "addr_decode"
            TIMESTAMP 2003 9 29 8 36 38
            RECTANGLE N 64 -256 368 0 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 368 -224 432 -224 
            LINE N 368 -32 432 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF "rc5_decrypt_top"
            TIMESTAMP 2003 9 28 11 22 42
            RECTANGLE N 64 -320 528 0 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 528 -288 592 -288 
            RECTANGLE N 528 -300 592 -276 
            LINE N 528 -160 592 -160 
            LINE N 528 -32 592 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF "compare_statistical_fast"
            TIMESTAMP 2003 10 1 10 19 5
            RECTANGLE N 64 -256 368 0 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 368 -224 432 -224 
        END BLOCKDEF
        BEGIN BLOCK "counter1" "counter"
            PIN "clk" "clk"
            PIN "run" "run"
            PIN "load" "selwrite"
            PIN "nextkey" "nextkey"
            PIN "data(47:0)" "data(47:0)"
            PIN "valid" "keyvalid"
            PIN "count(79:0)" "trialkey(79:0)"
        END BLOCK
        BEGIN BLOCK "sureg1" "sureg"
            PIN "keyvalid" "keyvalid"
            PIN "match" "match"
            PIN "run" "run"
            PIN "clk" "clk"
            PIN "key(31:0)" "trialkey(31:0)"
            PIN "data(47:0)" "data(47:0)"
            PIN "read" "selread"
        END BLOCK
        BEGIN BLOCK "runcontrol1" "run_control"
            PIN "clk" "clk"
            PIN "match" "match"
            PIN "run" "run"
            PIN "keywrite" "selwrite"
            PIN "keyvalid" "keyvalid"
        END BLOCK
        BEGIN BLOCK "XLXI_2" "addr_decode"
            PIN "readin" "read"
            PIN "writein" "write"
            PIN "addr(3:0)" "addr(3:0)"
            PIN "id(3:0)" "id(3:0)"
            PIN "readout" "selread"
            PIN "writeout" "selwrite"
        END BLOCK
        BEGIN BLOCK "XLXI_4" "rc5_decrypt_top"
            PIN "clk" "clk"
            PIN "run" "run"
            PIN "ctext(63:0)" "ctext(63:0)"
            PIN "iv(63:0)" "iv(63:0)"
            PIN "trial_key(71:0)" "trialkey(71:0)"
            PIN "ptext(63:0)" "XLXN_28(63:0)"
            PIN "ptext_valid" "ptextvalid"
            PIN "next_key" "nextkey"
        END BLOCK
        BEGIN BLOCK "XLXI_5" "compare_statistical_fast"
            PIN "clk" "clk"
            PIN "valid" "ptextvalid"
            PIN "trial(63:0)" "XLXN_28(63:0)"
            PIN "ptext(63:0)" "ptext(63:0)"
            PIN "match" "match"
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE "counter1" 672 1504 R0
        END INSTANCE
        BEGIN BRANCH "clk"
            WIRE 496 1216 672 1216
        END BRANCH
        IOMARKER 496 1216 "clk" R180 28
        BEGIN BRANCH "run"
            WIRE 608 1280 672 1280
            BEGIN DISPLAY 608 1280 ATTR "Name"
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "data(47:0)"
            WIRE 448 1472 576 1472
            WIRE 576 1472 672 1472
            WIRE 576 1472 576 1584
            WIRE 576 1584 1216 1584
            WIRE 1216 1584 1216 1728
            WIRE 1152 1728 1216 1728
        END BRANCH
        IOMARKER 448 1472 "data(47:0)" R180 28
        BEGIN INSTANCE "sureg1" 688 2144 R0
        END INSTANCE
        BEGIN BRANCH "clk"
            WIRE 592 2048 624 2048
            WIRE 624 2048 688 2048
            BEGIN DISPLAY 624 2048 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "run"
            WIRE 592 1984 624 1984
            WIRE 624 1984 688 1984
            BEGIN DISPLAY 624 1984 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1408 1472 1504 1472
        BEGIN BRANCH "keyvalid"
            WIRE 640 1856 688 1856
            WIRE 640 1856 640 2208
            WIRE 640 2208 1232 2208
            WIRE 1168 1216 1232 1216
            WIRE 1232 1216 1232 2032
            WIRE 1232 2032 1232 2208
            WIRE 1232 2032 1456 2032
            WIRE 1456 2032 1632 2032
            BEGIN DISPLAY 1456 2032 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "clk"
            WIRE 2592 1216 2640 1216
            BEGIN DISPLAY 2592 1216 ATTR "Name"
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "ptext(63:0)"
            WIRE 2544 1408 2640 1408
            WIRE 2544 1408 2544 1520
        END BRANCH
        IOMARKER 2544 1520 "ptext(63:0)" R90 28
        BEGIN INSTANCE "runcontrol1" 1632 1808 R0
        END INSTANCE
        BEGIN BRANCH "clk"
            WIRE 1568 1648 1584 1648
            WIRE 1584 1648 1632 1648
            BEGIN DISPLAY 1584 1648 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "run"
            WIRE 2192 1648 2272 1648
            BEGIN DISPLAY 2272 1648 ATTR "Name"
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "match"
            WIRE 656 1920 688 1920
            WIRE 656 1920 656 2160
            WIRE 656 2160 1408 2160
            WIRE 1408 2160 2432 2160
            WIRE 2432 2160 3152 2160
            WIRE 1408 1776 1632 1776
            WIRE 1408 1776 1408 2160
            WIRE 3072 1216 3152 1216
            WIRE 3152 1216 3152 2160
            BEGIN DISPLAY 2432 2160 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "XLXN_28(63:0)"
            WIRE 2416 624 2544 624
            WIRE 2544 624 2544 1344
            WIRE 2544 1344 2640 1344
        END BRANCH
        BEGIN BRANCH "trialkey(79:0)"
            WIRE 1168 1472 1248 1472
            WIRE 1248 1472 1280 1472
            WIRE 1280 1472 1408 1472
            WIRE 1280 1472 1280 1568
            BEGIN DISPLAY 1248 1472 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1280 1568 1280 1664
        BEGIN BRANCH "trialkey(31:0)"
            WIRE 672 2112 688 2112
            WIRE 672 2112 672 2272
            WIRE 672 2272 1104 2272
            WIRE 1104 2272 1280 2272
            WIRE 1280 1664 1280 2272
            BEGIN DISPLAY 1104 2272 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "nextkey"
            WIRE 608 1408 608 1520
            WIRE 608 1520 2096 1520
            WIRE 2096 1520 2496 1520
            WIRE 608 1408 672 1408
            WIRE 2416 880 2496 880
            WIRE 2496 880 2496 1520
            BEGIN DISPLAY 2096 1520 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "ptextvalid"
            WIRE 2416 752 2432 752
            WIRE 2432 752 2560 752
            WIRE 2560 752 2560 1280
            WIRE 2560 1280 2640 1280
            BEGIN DISPLAY 2432 752 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE "XLXI_2" 240 736 R0
        END INSTANCE
        BEGIN BRANCH "selwrite"
            WIRE 656 800 736 800
            WIRE 736 800 992 800
            WIRE 992 800 1184 800
            WIRE 1184 800 1184 1968
            WIRE 1184 1968 1632 1968
            WIRE 656 800 656 1344
            WIRE 656 1344 672 1344
            WIRE 672 704 736 704
            WIRE 736 704 736 800
            BEGIN DISPLAY 992 800 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "write"
            WIRE 112 576 240 576
        END BRANCH
        BEGIN BRANCH "read"
            WIRE 112 512 240 512
        END BRANCH
        BEGIN BRANCH "selread"
            WIRE 512 784 720 784
            WIRE 512 784 512 1936
            WIRE 512 1936 512 2176
            WIRE 512 2176 688 2176
            WIRE 672 512 720 512
            WIRE 720 512 720 784
            BEGIN DISPLAY 512 1936 ATTR "Name"
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "addr(3:0)"
            WIRE 112 640 240 640
        END BRANCH
        BEGIN BRANCH "id(3:0)"
            WIRE 112 704 240 704
        END BRANCH
        IOMARKER 112 576 "write" R180 28
        IOMARKER 112 512 "read" R180 28
        IOMARKER 112 640 "addr(3:0)" R180 28
        IOMARKER 112 704 "id(3:0)" R180 28
        BEGIN BRANCH "clk"
            WIRE 1712 624 1824 624
            BEGIN DISPLAY 1712 624 ATTR "Name"
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "run"
            WIRE 1712 688 1824 688
            BEGIN DISPLAY 1712 688 ATTR "Name"
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE "XLXI_4" 1824 912 R0
        END INSTANCE
        BEGIN BRANCH "ctext(63:0)"
            WIRE 1696 752 1824 752
        END BRANCH
        IOMARKER 1696 752 "ctext(63:0)" R180 28
        BEGIN BRANCH "iv(63:0)"
            WIRE 1696 816 1824 816
        END BRANCH
        IOMARKER 1696 816 "iv(63:0)" R180 28
        BEGIN BRANCH "trialkey(71:0)"
            WIRE 1504 1472 1664 1472
            WIRE 1664 880 1824 880
            WIRE 1664 880 1664 1120
            WIRE 1664 1120 1664 1472
            BEGIN DISPLAY 1664 1120 ATTR "Name"
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE "XLXI_5" 2640 1440 R0
        END INSTANCE
    END SHEET
END SCHEMATIC
