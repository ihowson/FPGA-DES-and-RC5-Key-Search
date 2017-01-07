VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtexe"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL "reset"
        SIGNAL "addr(13:0)"
        SIGNAL "din(63:0)"
        SIGNAL "dout(63:0)"
        SIGNAL "write"
        SIGNAL "clk"
        SIGNAL "data(63:0)"
        SIGNAL "intaddr(2:0)"
        SIGNAL "XLXN_126"
        SIGNAL "coreaddr(3:0)"
        SIGNAL "cmd(1:0)"
        SIGNAL "status(2:0)"
        SIGNAL "clkdiv"
        SIGNAL "dmask(63:0)"
        SIGNAL "extin(25:0)"
        SIGNAL "extout(25:0)"
        SIGNAL "extctrl(25:0)"
        SIGNAL "XLXN_162"
        SIGNAL "read"
        SIGNAL "XLXN_178"
        SIGNAL "XLXN_182"
        SIGNAL "XLXN_183"
        SIGNAL "XLXN_185(63:0)"
        SIGNAL "XLXN_186(63:0)"
        SIGNAL "XLXN_187(63:0)"
        PORT Input "reset"
        PORT Input "addr(13:0)"
        PORT Input "din(63:0)"
        PORT Output "dout(63:0)"
        PORT Input "write"
        PORT Input "clk"
        PORT Input "clkdiv"
        PORT Input "dmask(63:0)"
        PORT Input "extin(25:0)"
        PORT Output "extout(25:0)"
        PORT Output "extctrl(25:0)"
        PORT Input "read"
        BEGIN BLOCKDEF "keybuffer"
            TIMESTAMP 2003 9 17 5 33 24
            LINE N 64 -224 0 -224 
            LINE N 400 32 464 32 
            LINE N 400 -80 464 -80 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 400 -352 464 -352 
            RECTANGLE N 400 -364 464 -340 
            RECTANGLE N 64 -384 400 64 
        END BLOCKDEF
        BEGIN BLOCKDEF "status_reg"
            TIMESTAMP 2003 9 17 5 34 50
            LINE N 64 288 0 288 
            LINE N 64 160 0 160 
            LINE N 64 96 0 96 
            RECTANGLE N 0 84 64 108 
            LINE N 64 32 0 32 
            LINE N 64 -480 0 -480 
            LINE N 64 -416 0 -416 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            RECTANGLE N 64 -512 400 320 
        END BLOCKDEF
        BEGIN BLOCKDEF "core_controller"
            TIMESTAMP 2003 9 17 5 33 20
            LINE N 496 480 560 480 
            RECTANGLE N 496 468 560 492 
            LINE N 496 352 560 352 
            RECTANGLE N 496 340 560 364 
            LINE N 496 416 560 416 
            RECTANGLE N 496 404 560 428 
            LINE N 64 288 0 288 
            LINE N 496 288 560 288 
            LINE N 496 224 560 224 
            LINE N 64 96 0 96 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 496 -352 560 -352 
            LINE N 496 -192 560 -192 
            RECTANGLE N 496 -204 560 -180 
            LINE N 496 -112 560 -112 
            RECTANGLE N 496 -124 560 -100 
            LINE N 496 -32 560 -32 
            RECTANGLE N 496 -44 560 -20 
            RECTANGLE N 64 -384 496 512 
        END BLOCKDEF
        BEGIN BLOCKDEF "addr_terminate"
            TIMESTAMP 2003 9 17 5 33 15
            LINE N 320 -32 384 -32 
            RECTANGLE N 320 -44 384 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            RECTANGLE N 64 -64 320 0 
        END BLOCKDEF
        BEGIN BLOCKDEF "unused_terminate"
            TIMESTAMP 2003 9 17 5 34 55
            LINE N 64 32 0 32 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 496 -160 560 -160 
            RECTANGLE N 496 -172 560 -148 
            LINE N 496 -32 560 -32 
            RECTANGLE N 496 -44 560 -20 
            RECTANGLE N 64 -192 496 64 
        END BLOCKDEF
        BEGIN BLOCKDEF "search_units"
            TIMESTAMP 2003 9 17 5 33 28
            LINE N 64 224 0 224 
            RECTANGLE N 0 212 64 236 
            LINE N 64 96 0 96 
            RECTANGLE N 0 84 64 108 
            LINE N 64 160 0 160 
            RECTANGLE N 0 148 64 172 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 0 -32 64 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 0 32 64 32 
            RECTANGLE N 0 20 64 44 
            RECTANGLE N 64 -256 432 256 
        END BLOCKDEF
        BEGIN BLOCKDEF "status_pulldown"
            TIMESTAMP 2003 9 17 5 34 46
            RECTANGLE N 64 -64 320 0 
            LINE N 320 -32 384 -32 
            RECTANGLE N 320 -44 384 -20 
        END BLOCKDEF
        BEGIN BLOCK "statusreg" "status_reg"
            PIN "read" "read"
            PIN "write" "write"
            PIN "clk" "clk"
            PIN "buf_full" "XLXN_162"
            PIN "latch" "XLXN_182"
            PIN "dvalid" "XLXN_126"
            PIN "buf_empty" "XLXN_178"
            PIN "din(63:0)" "din(63:0)"
            PIN "addr(2:0)" "intaddr(2:0)"
            PIN "corestatus(2:0)" "status(2:0)"
            PIN "dout(63:0)" "dout(63:0)"
        END BLOCK
        BEGIN BLOCK "keybuf" "keybuffer"
            PIN "read" "read"
            PIN "clk" "clk"
            PIN "latch" "XLXN_183"
            PIN "write" "write"
            PIN "addr(2:0)" "intaddr(2:0)"
            PIN "data(63:0)" "data(63:0)"
            PIN "full" "XLXN_162"
            PIN "empty" "XLXN_178"
            PIN "dout(63:0)" "dout(63:0)"
        END BLOCK
        BEGIN BLOCK "corecon" "core_controller"
            PIN "read" "read"
            PIN "write" "write"
            PIN "clk" "clk"
            PIN "buf_full" "XLXN_162"
            PIN "din(63:0)" "din(63:0)"
            PIN "addr(2:0)" "intaddr(2:0)"
            PIN "status(2:0)" "status(2:0)"
            PIN "data(63:0)" "data(63:0)"
            PIN "dvalid" "XLXN_126"
            PIN "status_write" "XLXN_182"
            PIN "buf_write" "XLXN_183"
            PIN "dout(63:0)" "dout(63:0)"
            PIN "coreaddr(3:0)" "coreaddr(3:0)"
            PIN "cmd(1:0)" "cmd(1:0)"
            PIN "ctext(63:0)" "XLXN_185(63:0)"
            PIN "ptext(63:0)" "XLXN_186(63:0)"
            PIN "iv(63:0)" "XLXN_187(63:0)"
        END BLOCK
        BEGIN BLOCK "addrterminate" "addr_terminate"
            PIN "addr(13:0)" "addr(13:0)"
            PIN "addr_out(2:0)" "intaddr(2:0)"
        END BLOCK
        BEGIN BLOCK "XLXI_14" "unused_terminate"
            PIN "clkdiv" "clkdiv"
            PIN "reset" "reset"
            PIN "dmask(63:0)" "dmask(63:0)"
            PIN "extin(25:0)" "extin(25:0)"
            PIN "extout(25:0)" "extout(25:0)"
            PIN "extctrl(25:0)" "extctrl(25:0)"
        END BLOCK
        BEGIN BLOCK "XLXI_18" "search_units"
            BEGIN ATTR KEEP_HIERARCHY TRUE
                VERILOG all:0 wsynth:1
                VHDL all:0 wa:1 wd:1
                VALUETYPE Boolean
            END ATTR
            PIN "clk" "clk"
            PIN "addr(3:0)" "coreaddr(3:0)"
            PIN "cmd(1:0)" "cmd(1:0)"
            PIN "ctext(63:0)" "XLXN_185(63:0)"
            PIN "ptext(63:0)" "XLXN_186(63:0)"
            PIN "data(63:0)" "data(63:0)"
            PIN "status(2:0)" "status(2:0)"
            PIN "iv(63:0)" "XLXN_187(63:0)"
        END BLOCK
        BEGIN BLOCK "XLXI_19" "status_pulldown"
            PIN "status(2:0)" "status(2:0)"
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 5440 3520
        BEGIN BRANCH "addr(13:0)"
            WIRE 800 160 800 400
        END BRANCH
        IOMARKER 160 160 "clk" R270 28
        IOMARKER 480 160 "read" R270 28
        IOMARKER 640 160 "write" R270 28
        IOMARKER 800 160 "addr(13:0)" R270 28
        IOMARKER 960 160 "din(63:0)" R270 28
        IOMARKER 1120 160 "dout(63:0)" R270 28
        BEGIN BRANCH "clk"
            WIRE 160 160 160 240
        END BRANCH
        BEGIN INSTANCE "keybuf" 1280 1792 R0
        END INSTANCE
        BEGIN BRANCH "clk"
            WIRE 1232 1504 1280 1504
            BEGIN DISPLAY 1232 1504 ATTR "Name"
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "clk"
            WIRE 1216 2480 1280 2480
            BEGIN DISPLAY 1216 2480 ATTR "Name"
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE "corecon" 1280 2384 R0
        END INSTANCE
        BEGIN INSTANCE "addrterminate" 768 400 R90
        END INSTANCE
        BEGIN BRANCH "clkdiv"
            WIRE 2640 112 2640 208
            WIRE 2640 208 2720 208
            WIRE 2720 208 2720 384
            WIRE 2720 384 2736 384
            BEGIN DISPLAY 2720 208 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "dmask(63:0)"
            WIRE 2704 224 2704 448
            WIRE 2704 448 2736 448
            WIRE 2704 224 2880 224
            WIRE 2880 160 2880 208
            WIRE 2880 208 2880 224
            BEGIN DISPLAY 2880 208 ATTR "Name"
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "extin(25:0)"
            WIRE 2624 240 2624 512
            WIRE 2624 512 2736 512
            WIRE 2624 240 3040 240
            WIRE 3040 160 3040 224
            WIRE 3040 224 3040 240
            BEGIN DISPLAY 3040 224 ATTR "Name"
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "extout(25:0)"
            WIRE 3200 160 3200 240
            WIRE 3200 240 3200 256
            WIRE 3200 256 3312 256
            WIRE 3312 256 3312 384
            WIRE 3296 384 3312 384
            BEGIN DISPLAY 3200 240 ATTR "Name"
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "extctrl(25:0)"
            WIRE 3296 512 3360 512
            WIRE 3360 160 3360 224
            WIRE 3360 224 3360 512
            BEGIN DISPLAY 3360 224 ATTR "Name"
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 2880 160 "dmask(63:0)" R270 28
        IOMARKER 3040 160 "extin(25:0)" R270 28
        IOMARKER 3200 160 "extout(25:0)" R270 28
        IOMARKER 3360 160 "extctrl(25:0)" R270 28
        IOMARKER 2640 112 "clkdiv" R270 28
        BEGIN INSTANCE "XLXI_14" 2736 544 R0
        END INSTANCE
        IOMARKER 2528 112 "reset" R270 28
        BEGIN BRANCH "reset"
            WIRE 2528 112 2528 576
            WIRE 2528 576 2736 576
        END BRANCH
        BEGIN BRANCH "XLXN_162"
            WIRE 1264 960 1264 1184
            WIRE 1264 1184 1824 1184
            WIRE 1824 1184 1824 1824
            WIRE 1824 1824 1824 1872
            WIRE 1264 960 1280 960
            WIRE 1264 1872 1264 2672
            WIRE 1264 2672 1280 2672
            WIRE 1264 1872 1824 1872
            WIRE 1744 1824 1824 1824
        END BRANCH
        BEGIN BRANCH "XLXN_126"
            WIRE 1232 512 1280 512
            WIRE 1232 512 1232 1136
            WIRE 1232 1136 1888 1136
            WIRE 1888 1136 1888 2032
            WIRE 1840 2032 1888 2032
        END BRANCH
        BEGIN BRANCH "clk"
            WIRE 1248 832 1280 832
            BEGIN DISPLAY 1248 832 ATTR "Name"
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE "statusreg" 1280 800 R0
        END INSTANCE
        BEGIN BRANCH "XLXN_178"
            WIRE 1280 1088 1280 1296
            WIRE 1280 1296 1808 1296
            WIRE 1808 1296 1808 1712
            WIRE 1744 1712 1808 1712
        END BRANCH
        BEGIN BRANCH "read"
            WIRE 480 160 480 320
            WIRE 480 320 1280 320
            WIRE 480 320 480 1440
            WIRE 480 1440 1280 1440
            WIRE 480 1440 480 2032
            WIRE 480 2032 1280 2032
        END BRANCH
        BEGIN BRANCH "XLXN_182"
            WIRE 1232 160 1232 448
            WIRE 1232 448 1280 448
            WIRE 1232 160 1904 160
            WIRE 1904 160 1904 2608
            WIRE 1840 2608 1904 2608
        END BRANCH
        BEGIN BRANCH "XLXN_183"
            WIRE 1200 1264 1200 1568
            WIRE 1200 1568 1280 1568
            WIRE 1200 1264 1872 1264
            WIRE 1872 1264 1872 2672
            WIRE 1840 2672 1872 2672
        END BRANCH
        BEGIN INSTANCE "XLXI_18" 2608 1632 R0
            BEGIN DISPLAY -100 -376 ATTR "KEEP_HIERARCHY"
                FONT 28 "Arial"
                DISPLAYFORMAT NAMEEQUALSVALUE
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH "status(2:0)"
            WIRE 1200 1856 1200 2352
            WIRE 1200 2352 1280 2352
            WIRE 1200 1856 2160 1856
            WIRE 1216 896 1280 896
            WIRE 1216 896 1216 1168
            WIRE 1216 1168 2160 1168
            WIRE 2160 1168 2160 1600
            WIRE 2160 1600 2160 1856
            WIRE 2160 1600 2608 1600
        END BRANCH
        BEGIN BRANCH "coreaddr(3:0)"
            WIRE 1840 2192 2240 2192
            WIRE 2240 1472 2608 1472
            WIRE 2240 1472 2240 1488
            WIRE 2240 1488 2240 2192
            BEGIN DISPLAY 2240 1488 ATTR "Name"
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "cmd(1:0)"
            WIRE 1840 2272 2320 2272
            WIRE 2320 1536 2320 2272
            WIRE 2320 1536 2336 1536
            WIRE 2336 1536 2608 1536
            BEGIN DISPLAY 2336 1536 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "data(63:0)"
            WIRE 1232 1760 1280 1760
            WIRE 1232 1760 1232 1840
            WIRE 1232 1840 2080 1840
            WIRE 2080 1840 2080 2352
            WIRE 1840 2352 2080 2352
            WIRE 2080 1664 2080 1840
            WIRE 2080 1664 2608 1664
        END BRANCH
        BEGIN BRANCH "clk"
            WIRE 2400 1408 2416 1408
            WIRE 2416 1408 2608 1408
            BEGIN DISPLAY 2416 1408 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "dout(63:0)"
            WIRE 1120 160 1120 640
            WIRE 1120 640 1280 640
            WIRE 1120 640 1120 1280
            WIRE 1120 1280 1760 1280
            WIRE 1760 1280 1760 1440
            WIRE 1120 1280 1120 2224
            WIRE 1120 2224 1280 2224
            WIRE 1744 1440 1760 1440
        END BRANCH
        BEGIN BRANCH "din(63:0)"
            WIRE 960 160 960 576
            WIRE 960 576 1280 576
            WIRE 960 576 960 2160
            WIRE 960 2160 1280 2160
        END BRANCH
        BEGIN BRANCH "intaddr(2:0)"
            WIRE 800 704 1280 704
            WIRE 800 704 800 784
            WIRE 800 784 800 864
            WIRE 800 864 800 1696
            WIRE 800 1696 1280 1696
            WIRE 800 1696 800 2288
            WIRE 800 2288 1280 2288
            BEGIN DISPLAY 800 864 ATTR "Name"
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "write"
            WIRE 640 160 640 384
            WIRE 640 384 1280 384
            WIRE 640 384 640 1632
            WIRE 640 1632 1280 1632
            WIRE 640 1632 640 2096
            WIRE 640 2096 1280 2096
        END BRANCH
        BEGIN BRANCH "XLXN_185(63:0)"
            WIRE 1840 2736 2224 2736
            WIRE 2224 1728 2224 2736
            WIRE 2224 1728 2608 1728
        END BRANCH
        BEGIN BRANCH "XLXN_186(63:0)"
            WIRE 1840 2800 2208 2800
            WIRE 2208 1792 2208 2800
            WIRE 2208 1792 2608 1792
        END BRANCH
        BEGIN INSTANCE "XLXI_19" 2192 2240 R270
        END INSTANCE
        BEGIN BRANCH "XLXN_187(63:0)"
            WIRE 1840 2864 2256 2864
            WIRE 2256 1856 2256 2864
            WIRE 2256 1856 2608 1856
        END BRANCH
    END SHEET
END SCHEMATIC
