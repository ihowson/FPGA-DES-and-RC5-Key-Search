VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtexe"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL "clk"
        SIGNAL "cmd(1:0)"
        SIGNAL "addr(3:0)"
        SIGNAL "id(3:0)"
        SIGNAL "status(2:0)"
        SIGNAL "XLXN_167"
        SIGNAL "XLXN_168"
        SIGNAL "XLXN_170"
        SIGNAL "trial_key(71:0)"
        SIGNAL "data(63:0)"
        SIGNAL "XLXN_180"
        SIGNAL "XLXN_182(63:0)"
        SIGNAL "ctext(63:0)"
        SIGNAL "ptext(63:0)"
        SIGNAL "XLXN_186"
        SIGNAL "XLXN_189"
        SIGNAL "XLXN_190"
        SIGNAL "XLXN_192"
        SIGNAL "data(39:0)"
        SIGNAL "XLXN_198"
        SIGNAL "XLXN_199"
        SIGNAL "iv(63:0)"
        SIGNAL "XLXN_201"
        PORT Input "clk"
        PORT Input "cmd(1:0)"
        PORT Input "addr(3:0)"
        PORT Input "id(3:0)"
        PORT Output "status(2:0)"
        PORT BiDirectional "data(63:0)"
        PORT Input "ctext(63:0)"
        PORT Input "ptext(63:0)"
        PORT Input "iv(63:0)"
        BEGIN BLOCKDEF "core_cmd_decode"
            TIMESTAMP 2003 9 17 5 33 41
            LINE N 400 -160 464 -160 
            LINE N 400 -224 464 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -288 0 -288 
            RECTANGLE N 0 -300 64 -276 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -352 0 -352 
            RECTANGLE N 0 -364 64 -340 
            LINE N 400 -352 464 -352 
            LINE N 400 -288 464 -288 
            RECTANGLE N 64 -384 400 -128 
        END BLOCKDEF
        BEGIN BLOCKDEF "core_status_reg"
            TIMESTAMP 2003 9 17 5 33 46
            LINE N 64 -32 0 -32 
            LINE N 64 32 0 32 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 400 -160 464 -160 
            RECTANGLE N 400 -172 464 -148 
            RECTANGLE N 64 -192 400 64 
        END BLOCKDEF
        BEGIN BLOCKDEF "compare_exact"
            TIMESTAMP 2003 9 17 5 33 38
            LINE N 64 32 0 32 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 368 -160 432 -160 
            RECTANGLE N 64 -192 368 64 
        END BLOCKDEF
        BEGIN BLOCKDEF "keygen_reg"
            TIMESTAMP 2003 9 17 5 34 17
            RECTANGLE N 64 -192 400 0 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 400 -160 464 -160 
            RECTANGLE N 400 -172 464 -148 
        END BLOCKDEF
        BEGIN BLOCKDEF "run_control"
            TIMESTAMP 2003 9 17 5 34 24
            LINE N 64 96 0 96 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 64 32 0 32 
            LINE N 496 -96 560 -96 
            LINE N 496 -32 560 -32 
            LINE N 496 -160 560 -160 
            RECTANGLE N 64 -192 496 128 
        END BLOCKDEF
        BEGIN BLOCKDEF "keygen"
            TIMESTAMP 2003 9 17 5 33 57
            RECTANGLE N 64 -256 432 0 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 432 -224 496 -224 
            LINE N 432 -32 496 -32 
            RECTANGLE N 432 -44 496 -20 
        END BLOCKDEF
        BEGIN BLOCKDEF "rc5_decrypt_top"
            TIMESTAMP 2003 9 17 5 15 24
            LINE N 64 32 0 32 
            RECTANGLE N 0 20 64 44 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 528 -224 592 -224 
            RECTANGLE N 528 -236 592 -212 
            LINE N 528 -128 592 -128 
            LINE N 528 -32 592 -32 
            RECTANGLE N 64 -256 528 64 
        END BLOCKDEF
        BEGIN BLOCK "cmd_decode" "core_cmd_decode"
            PIN "clk" "clk"
            PIN "cmd(1:0)" "cmd(1:0)"
            PIN "addr(3:0)" "addr(3:0)"
            PIN "id(3:0)" "id(3:0)"
            PIN "status_read" "XLXN_167"
            PIN "keygen_read" "XLXN_168"
            PIN "keygen_write" "XLXN_192"
            PIN "restart" "XLXN_170"
        END BLOCK
        BEGIN BLOCK "XLXI_12" "keygen_reg"
            PIN "read" "XLXN_168"
            PIN "clk" "clk"
            PIN "key(71:0)" "trial_key(71:0)"
            PIN "data(63:0)" "data(63:0)"
        END BLOCK
        BEGIN BLOCK "status_reg" "core_status_reg"
            PIN "clk" "clk"
            PIN "read" "XLXN_167"
            PIN "initialised" "XLXN_189"
            PIN "paused" "XLXN_190"
            PIN "status(2:0)" "status(2:0)"
        END BLOCK
        BEGIN BLOCK "XLXI_16" "run_control"
            PIN "clk" "clk"
            PIN "key_write" "XLXN_192"
            PIN "match" "XLXN_186"
            PIN "keyset" "XLXN_201"
            PIN "restart" "XLXN_170"
            PIN "run" "XLXN_180"
            PIN "paused" "XLXN_190"
            PIN "initialised" "XLXN_189"
        END BLOCK
        BEGIN BLOCK "comparator" "compare_exact"
            PIN "clk" "clk"
            PIN "valid" "XLXN_198"
            PIN "trial(63:0)" "XLXN_182(63:0)"
            PIN "ptext(63:0)" "ptext(63:0)"
            PIN "match" "XLXN_186"
        END BLOCK
        BEGIN BLOCK "XLXI_17" "keygen"
            PIN "nextkey" "XLXN_199"
            PIN "clk" "clk"
            PIN "write" "XLXN_192"
            PIN "data(39:0)" "data(39:0)"
            PIN "set" "XLXN_201"
            PIN "count(71:0)" "trial_key(71:0)"
        END BLOCK
        BEGIN BLOCK "XLXI_18" "rc5_decrypt_top"
            PIN "clk" "clk"
            PIN "run" "XLXN_180"
            PIN "ctext(63:0)" "ctext(63:0)"
            PIN "trial_key(71:0)" "trial_key(71:0)"
            PIN "ptext(63:0)" "XLXN_182(63:0)"
            PIN "ptext_valid" "XLXN_198"
            PIN "next_key" "XLXN_199"
            PIN "iv(63:0)" "iv(63:0)"
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE "cmd_decode" 416 1344 R0
        END INSTANCE
        IOMARKER 160 480 "clk" R180 28
        BEGIN BRANCH "clk"
            WIRE 160 480 320 480
        END BRANCH
        BEGIN BRANCH "clk"
            WIRE 336 1184 416 1184
            BEGIN DISPLAY 336 1184 ATTR "Name"
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "cmd(1:0)"
            WIRE 320 992 416 992
        END BRANCH
        BEGIN BRANCH "addr(3:0)"
            WIRE 144 1056 416 1056
        END BRANCH
        BEGIN BRANCH "id(3:0)"
            WIRE 128 1120 416 1120
        END BRANCH
        IOMARKER 128 1120 "id(3:0)" R180 28
        IOMARKER 144 1056 "addr(3:0)" R180 28
        BEGIN BRANCH "status(2:0)"
            WIRE 3136 144 3328 144
        END BRANCH
        BEGIN INSTANCE "comparator" 2848 1328 R0
        END INSTANCE
        BEGIN BRANCH "XLXN_170"
            WIRE 880 1184 1504 1184
            WIRE 1504 864 1504 1184
            WIRE 1504 864 2112 864
        END BRANCH
        BEGIN INSTANCE "XLXI_12" 2032 1968 R0
        END INSTANCE
        BEGIN BRANCH "XLXN_168"
            WIRE 880 1056 896 1056
            WIRE 896 1056 896 1808
            WIRE 896 1808 2032 1808
        END BRANCH
        BEGIN BRANCH "clk"
            WIRE 1952 1872 2032 1872
            BEGIN DISPLAY 1952 1872 ATTR "Name"
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "clk"
            WIRE 1088 1360 1152 1360
            BEGIN DISPLAY 1088 1360 ATTR "Name"
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "clk"
            WIRE 1936 1216 1936 1232
            WIRE 1936 1232 1968 1232
            BEGIN DISPLAY 1936 1216 ATTR "Name"
                ALIGNMENT SOFT-VLEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "XLXN_182(63:0)"
            WIRE 2560 1232 2848 1232
        END BRANCH
        BEGIN BRANCH "ptext(63:0)"
            WIRE 2736 1296 2848 1296
        END BRANCH
        IOMARKER 2736 1296 "ptext(63:0)" R180 28
        BEGIN BRANCH "clk"
            WIRE 2752 1152 2752 1168
            WIRE 2752 1168 2848 1168
            BEGIN DISPLAY 2752 1152 ATTR "Name"
                ALIGNMENT SOFT-VLEFT
            END DISPLAY
        END BRANCH
        IOMARKER 3328 144 "status(2:0)" R0 28
        BEGIN INSTANCE "status_reg" 2672 304 R0
        END INSTANCE
        BEGIN BRANCH "XLXN_167"
            WIRE 880 992 896 992
            WIRE 896 208 2672 208
            WIRE 896 208 896 992
        END BRANCH
        BEGIN BRANCH "XLXN_189"
            WIRE 2656 16 2656 272
            WIRE 2656 272 2672 272
            WIRE 2656 16 3200 16
            WIRE 3200 16 3200 800
            WIRE 2672 800 3200 800
        END BRANCH
        BEGIN BRANCH "XLXN_190"
            WIRE 2656 336 2672 336
            WIRE 2656 336 2656 448
            WIRE 2656 448 2736 448
            WIRE 2736 448 2736 736
            WIRE 2672 736 2736 736
        END BRANCH
        BEGIN BRANCH "clk"
            WIRE 2592 128 2592 144
            WIRE 2592 144 2672 144
            BEGIN DISPLAY 2592 128 ATTR "Name"
                ALIGNMENT SOFT-VLEFT
            END DISPLAY
        END BRANCH
        IOMARKER 320 992 "cmd(1:0)" R180 28
        IOMARKER 2608 1600 "data(63:0)" R0 28
        BEGIN BRANCH "data(63:0)"
            WIRE 1392 1600 2560 1600
            WIRE 2560 1600 2560 1808
            WIRE 2560 1600 2608 1600
            WIRE 2496 1808 2560 1808
        END BRANCH
        BUSTAP 1392 1600 1296 1600
        BEGIN BRANCH "data(39:0)"
            WIRE 1136 1488 1152 1488
            WIRE 1136 1488 1136 1600
            WIRE 1136 1600 1200 1600
            WIRE 1200 1600 1296 1600
            BEGIN DISPLAY 1200 1600 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "XLXN_180"
            WIRE 1952 1056 1952 1296
            WIRE 1952 1296 1968 1296
            WIRE 1952 1056 2752 1056
            WIRE 2672 672 2752 672
            WIRE 2752 672 2752 1056
        END BRANCH
        BEGIN BRANCH "trial_key(71:0)"
            WIRE 1648 1488 1840 1488
            WIRE 1840 1488 1840 1680
            WIRE 1840 1680 1840 1936
            WIRE 1840 1936 2032 1936
            WIRE 1840 1424 1840 1488
            WIRE 1840 1424 1968 1424
            BEGIN DISPLAY 1840 1680 ATTR "Name"
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE "XLXI_17" 1152 1520 R0
        END INSTANCE
        BEGIN BRANCH "ctext(63:0)"
            WIRE 1872 1360 1968 1360
        END BRANCH
        BEGIN INSTANCE "XLXI_18" 1968 1456 R0
        END INSTANCE
        BEGIN BRANCH "XLXN_198"
            WIRE 2560 1424 2704 1424
            WIRE 2704 1360 2704 1424
            WIRE 2704 1360 2848 1360
        END BRANCH
        BEGIN BRANCH "XLXN_199"
            WIRE 1088 1072 1088 1296
            WIRE 1088 1296 1152 1296
            WIRE 1088 1072 2784 1072
            WIRE 2784 1072 2784 1328
            WIRE 2560 1328 2784 1328
        END BRANCH
        BEGIN BRANCH "iv(63:0)"
            WIRE 1952 1488 1968 1488
            WIRE 1952 1488 1952 1568
            WIRE 1952 1568 2096 1568
        END BRANCH
        IOMARKER 2096 1568 "iv(63:0)" R0 28
        IOMARKER 1872 1360 "ctext(63:0)" R180 28
        BEGIN INSTANCE "XLXI_16" 2112 832 R0
        END INSTANCE
        BEGIN BRANCH "XLXN_192"
            WIRE 880 1120 1008 1120
            WIRE 1008 1120 1008 1424
            WIRE 1008 1424 1152 1424
            WIRE 1008 736 2112 736
            WIRE 1008 736 1008 1120
        END BRANCH
        BEGIN BRANCH "XLXN_186"
            WIRE 2096 512 2096 800
            WIRE 2096 800 2112 800
            WIRE 2096 512 3296 512
            WIRE 3296 512 3296 1168
            WIRE 3280 1168 3296 1168
        END BRANCH
        BEGIN BRANCH "XLXN_201"
            WIRE 1648 1296 1664 1296
            WIRE 1664 928 2112 928
            WIRE 1664 928 1664 1296
        END BRANCH
        BEGIN BRANCH "clk"
            WIRE 2032 672 2112 672
        END BRANCH
    END SHEET
END SCHEMATIC
