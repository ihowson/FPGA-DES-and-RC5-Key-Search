VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtexe"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL "ramdin(31:0)"
        SIGNAL "b(31:0)"
        SIGNAL "apb(31:0)"
        SIGNAL "key(71:0)"
        SIGNAL "ramaddr(7)"
        SIGNAL "ramwe"
        SIGNAL "XLXN_18"
        SIGNAL "sab(31:0)"
        SIGNAL "apb_regval(31:0)"
        SIGNAL "ramdout(31:0)"
        SIGNAL "XLXN_24(31:0)"
        SIGNAL "l_regval(31:0)"
        SIGNAL "apb_regval(4:0)"
        SIGNAL "XLXN_28(4:0)"
        SIGNAL "XLXN_29(31:0)"
        SIGNAL "ramaddr(7:0)"
        SIGNAL "ramaddr(6)"
        SIGNAL "ramaddr(5)"
        SIGNAL "XLXN_35(4:0)"
        SIGNAL "ramaddr(4:0)"
        PORT Output "ramdin(31:0)"
        PORT Input "key(71:0)"
        PORT Output "ramaddr(7)"
        PORT Output "ramwe"
        PORT Input "ramdout(31:0)"
        PORT Output "ramaddr(7:0)"
        BEGIN BLOCKDEF "reg32"
            TIMESTAMP 2003 9 13 2 38 14
            RECTANGLE N 64 -256 320 -64 
            LINE N 64 -96 0 -96 
            LINE N 64 -160 0 -160 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -236 64 -212 
            LINE N 384 -224 320 -224 
            RECTANGLE N 320 -236 384 -212 
        END BLOCKDEF
        BEGIN BLOCKDEF "add32"
            TIMESTAMP 2003 9 13 2 18 55
            RECTANGLE N 64 -128 336 0 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 336 -96 400 -96 
            RECTANGLE N 336 -108 400 -84 
        END BLOCKDEF
        BEGIN BLOCKDEF "rol_v_32"
            TIMESTAMP 2003 9 25 0 11 29
            LINE N 64 144 0 144 
            LINE N 64 224 0 224 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -16 0 -16 
            RECTANGLE N 0 -28 64 -4 
            LINE N 0 64 64 64 
            RECTANGLE N 0 52 64 76 
            RECTANGLE N 64 -128 336 256 
        END BLOCKDEF
        BEGIN BLOCKDEF "rol_3_32"
            TIMESTAMP 2003 9 13 1 16 50
            RECTANGLE N 64 -64 336 0 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 336 -32 400 -32 
            RECTANGLE N 336 -44 400 -20 
        END BLOCKDEF
        BEGIN BLOCKDEF "reg5"
            TIMESTAMP 2003 9 25 0 29 51
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -160 384 -160 
            RECTANGLE N 320 -172 384 -148 
        END BLOCKDEF
        BEGIN BLOCKDEF "gnd"
            TIMESTAMP 2001 2 2 12 24 11
            LINE N 64 -64 64 -96 
            LINE N 76 -48 52 -48 
            LINE N 68 -32 60 -32 
            LINE N 88 -64 40 -64 
            LINE N 64 -64 64 -80 
            LINE N 64 -128 64 -96 
        END BLOCKDEF
        BEGIN BLOCK "a_reg" "reg32"
            PIN "en"
            PIN "clk"
            PIN "d(31:0)"
            PIN "q(31:0)" "ramdin(31:0)"
        END BLOCK
        BEGIN BLOCK "b_reg" "reg32"
            PIN "en"
            PIN "clk"
            PIN "d(31:0)"
            PIN "q(31:0)" "b(31:0)"
        END BLOCK
        BEGIN BLOCK "apb_reg" "reg32"
            PIN "en"
            PIN "clk"
            PIN "d(31:0)" "apb(31:0)"
            PIN "q(31:0)" "apb_regval(31:0)"
        END BLOCK
        BEGIN BLOCK "apb" "add32"
            PIN "a(31:0)" "ramdin(31:0)"
            PIN "b(31:0)" "b(31:0)"
            PIN "x(31:0)" "apb(31:0)"
        END BLOCK
        BEGIN BLOCK "XLXI_5" "rol_v_32"
            PIN "x(31:0)" "XLXN_29(31:0)"
            PIN "amt(4:0)" "apb_regval(4:0)"
            PIN "y(31:0)"
            PIN "clk"
            PIN "run"
        END BLOCK
        BEGIN BLOCK "l" "reg32"
            PIN "en"
            PIN "clk"
            PIN "d(31:0)"
            PIN "q(31:0)" "l_regval(31:0)"
        END BLOCK
        BEGIN BLOCK "sab" "add32"
            PIN "a(31:0)" "ramdout(31:0)"
            PIN "b(31:0)" "apb_regval(31:0)"
            PIN "x(31:0)" "sab(31:0)"
        END BLOCK
        BEGIN BLOCK "rotsab" "rol_3_32"
            PIN "x(31:0)" "sab(31:0)"
            PIN "y(31:0)"
        END BLOCK
        BEGIN BLOCK "lab" "add32"
            PIN "a(31:0)" "apb_regval(31:0)"
            PIN "b(31:0)" "l_regval(31:0)"
            PIN "x(31:0)" "XLXN_29(31:0)"
        END BLOCK
        BEGIN BLOCK "i_reg" "reg5"
            PIN "clk"
            PIN "en"
            PIN "d(4:0)"
            PIN "q(4:0)" "ramaddr(4:0)"
        END BLOCK
        BEGIN BLOCK "XLXI_11" "gnd"
            PIN "G" "ramaddr(6)"
        END BLOCK
        BEGIN BLOCK "XLXI_12" "gnd"
            PIN "G" "ramaddr(5)"
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE "apb" 1248 1296 R0
        END INSTANCE
        BEGIN BRANCH "ramdin(31:0)"
            WIRE 912 1200 1024 1200
            WIRE 1024 1200 1152 1200
            WIRE 1152 1200 1248 1200
            WIRE 1152 976 1152 1200
            WIRE 1152 976 1296 976
            BEGIN DISPLAY 1024 1200 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "b(31:0)"
            WIRE 912 1504 1232 1504
            WIRE 1232 1264 1248 1264
            WIRE 1232 1264 1232 1456
            WIRE 1232 1456 1232 1504
            BEGIN DISPLAY 1232 1456 ATTR "Name"
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "apb(31:0)"
            WIRE 1648 1200 1696 1200
            WIRE 1696 1200 1872 1200
            BEGIN DISPLAY 1696 1200 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE "a_reg" 528 1424 R0
        END INSTANCE
        BEGIN INSTANCE "b_reg" 528 1728 R0
        END INSTANCE
        BEGIN INSTANCE "apb_reg" 1872 1424 R0
        END INSTANCE
        BEGIN BRANCH "key(71:0)"
            WIRE 512 2064 576 2064
            WIRE 576 2064 896 2064
            BEGIN DISPLAY 576 2064 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 512 2064 "key(71:0)" R180 28
        BEGIN BRANCH "ramaddr(7)"
            WIRE 1808 2448 2032 2448
            WIRE 2032 2448 2144 2448
            WIRE 2144 2448 2272 2448
            WIRE 2144 2368 2144 2448
            WIRE 2144 2368 2592 2368
            WIRE 2592 2128 2592 2368
            WIRE 2592 2128 2880 2128
            BEGIN DISPLAY 2032 2448 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "ramwe"
            WIRE 1808 2544 2016 2544
            WIRE 2016 2544 2288 2544
            BEGIN DISPLAY 2016 2544 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 2272 2448 "ramaddr(7)" R0 28
        IOMARKER 2288 2544 "ramwe" R0 28
        BEGIN INSTANCE "sab" 2480 1232 R0
        END INSTANCE
        BEGIN INSTANCE "rotsab" 3024 1168 R0
        END INSTANCE
        BEGIN BRANCH "sab(31:0)"
            WIRE 2880 1136 2928 1136
            WIRE 2928 1136 3024 1136
            BEGIN DISPLAY 2928 1136 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH "ramdout(31:0)"
            WIRE 2400 1136 2480 1136
        END BRANCH
        IOMARKER 2400 1136 "ramdout(31:0)" R180 28
        BEGIN INSTANCE "lab" 2480 1616 R0
        END INSTANCE
        BEGIN BRANCH "l_regval(31:0)"
            WIRE 2240 1584 2416 1584
            WIRE 2416 1584 2480 1584
            BEGIN DISPLAY 2416 1584 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE "l" 1856 1808 R0
        END INSTANCE
        BEGIN BRANCH "apb_regval(31:0)"
            WIRE 2256 1200 2384 1200
            WIRE 2384 1200 2384 1520
            WIRE 2384 1520 2480 1520
            WIRE 2384 1200 2432 1200
            WIRE 2432 1200 2480 1200
            WIRE 2432 976 2432 1200
            BEGIN DISPLAY 2384 1200 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2432 976 2432 880
        BEGIN BRANCH "apb_regval(4:0)"
            WIRE 2432 624 3040 624
            WIRE 2432 624 2432 800
            WIRE 2432 800 2432 880
            BEGIN DISPLAY 2432 800 ATTR "Name"
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE "XLXI_5" 3040 640 R0
        END INSTANCE
        BEGIN BRANCH "XLXN_29(31:0)"
            WIRE 2880 1520 2960 1520
            WIRE 2960 544 2960 1520
            WIRE 2960 544 3040 544
        END BRANCH
        IOMARKER 1296 976 "ramdin(31:0)" R0 28
        IOMARKER 2976 2400 "ramaddr(7:0)" R90 28
        BEGIN BRANCH "ramaddr(7:0)"
            WIRE 2976 1968 2976 2032
            WIRE 2976 2032 2976 2128
            WIRE 2976 2128 2976 2224
            WIRE 2976 2224 2976 2304
            WIRE 2976 2304 2976 2400
            BEGIN DISPLAY 2976 1968 ATTR "Name"
                ALIGNMENT SOFT-VLEFT
            END DISPLAY
        END BRANCH
        BUSTAP 2976 2032 2880 2032
        BUSTAP 2976 2128 2880 2128
        BUSTAP 2976 2224 2880 2224
        BUSTAP 2976 2304 2880 2304
        INSTANCE "XLXI_11" 2768 2528 R0
        BEGIN BRANCH "ramaddr(6)"
            WIRE 2832 2304 2880 2304
            WIRE 2832 2304 2832 2400
            BEGIN DISPLAY 2832 2304 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE "XLXI_12" 2656 2528 R0
        BEGIN BRANCH "ramaddr(5)"
            WIRE 2720 2224 2880 2224
            WIRE 2720 2224 2720 2400
            BEGIN DISPLAY 2720 2224 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE "i_reg" 1776 2192 R0
        END INSTANCE
        BEGIN BRANCH "ramaddr(4:0)"
            WIRE 2160 2032 2528 2032
            WIRE 2528 2032 2880 2032
            BEGIN DISPLAY 2528 2032 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
    END SHEET
END SCHEMATIC
