VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtexe"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL "ain(31:0)"
        SIGNAL "bin(31:0)"
        SIGNAL "lin(31:0)"
        SIGNAL "XLXN_23(31:0)"
        SIGNAL "sin(31:0)"
        SIGNAL "XLXN_29(31:0)"
        SIGNAL "aout(31:0)"
        SIGNAL "bout(31:0)"
        SIGNAL "XLXN_33(31:0)"
        SIGNAL "XLXN_34(31:0)"
        SIGNAL "XLXN_35(4:0)"
        SIGNAL "XLXN_36(31:0)"
        SIGNAL "XLXN_37(31:0)"
        SIGNAL "XLXN_38(31:0)"
        SIGNAL "XLXN_39(31:0)"
        SIGNAL "XLXN_40(31:0)"
        SIGNAL "XLXN_41(31:0)"
        SIGNAL "XLXN_42(31:0)"
        SIGNAL "XLXN_43(31:0)"
        SIGNAL "XLXN_44(31:0)"
        SIGNAL "XLXN_45(31:0)"
        SIGNAL "XLXN_46(31:0)"
        SIGNAL "XLXN_47(31:0)"
        SIGNAL "XLXN_48"
        SIGNAL "XLXN_49(31:0)"
        SIGNAL "XLXN_50(4:0)"
        SIGNAL "XLXN_51(31:0)"
        SIGNAL "XLXN_52(31:0)"
        SIGNAL "XLXN_53(31:0)"
        SIGNAL "clk"
        SIGNAL "run"
        PORT Input "ain(31:0)"
        PORT Input "bin(31:0)"
        PORT Input "lin(31:0)"
        PORT Input "sin(31:0)"
        PORT Output "aout(31:0)"
        PORT Output "bout(31:0)"
        PORT Input "clk"
        PORT Input "run"
        BEGIN BLOCKDEF "add_3_32"
            TIMESTAMP 2003 9 12 8 25 29
            RECTANGLE N 64 -192 336 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 336 -160 400 -160 
            RECTANGLE N 336 -172 400 -148 
        END BLOCKDEF
        BEGIN BLOCKDEF "rol_3_32"
            TIMESTAMP 2003 9 13 1 16 50
            RECTANGLE N 64 -64 336 0 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 336 -32 400 -32 
            RECTANGLE N 336 -44 400 -20 
        END BLOCKDEF
        BEGIN BLOCKDEF "rol_v_32"
            TIMESTAMP 2003 9 13 2 16 36
            RECTANGLE N 64 -128 336 0 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 336 -96 400 -96 
            RECTANGLE N 336 -108 400 -84 
        END BLOCKDEF
        BEGIN BLOCKDEF "add32_5out"
            TIMESTAMP 2003 9 13 2 26 52
            RECTANGLE N 64 -128 320 0 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -108 384 -84 
        END BLOCKDEF
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
        BEGIN BLOCK "XLXI_1" "add_3_32"
            PIN "a(31:0)" "ain(31:0)"
            PIN "b(31:0)" "bin(31:0)"
            PIN "c(31:0)" "lin(31:0)"
            PIN "x(31:0)" "XLXN_23(31:0)"
        END BLOCK
        BEGIN BLOCK "XLXI_2" "rol_3_32"
            PIN "x(31:0)" "XLXN_23(31:0)"
            PIN "y(31:0)" "aout(31:0)"
        END BLOCK
        BEGIN BLOCK "XLXI_3" "add_3_32"
            PIN "a(31:0)" "aout(31:0)"
            PIN "b(31:0)" "bin(31:0)"
            PIN "c(31:0)" "sin(31:0)"
            PIN "x(31:0)" "XLXN_29(31:0)"
        END BLOCK
        BEGIN BLOCK "XLXI_6" "rol_v_32"
            PIN "x(31:0)" "XLXN_29(31:0)"
            PIN "amt(4:0)" "XLXN_35(4:0)"
            PIN "y(31:0)" "XLXN_53(31:0)"
        END BLOCK
        BEGIN BLOCK "XLXI_8" "add32_5out"
            PIN "a(31:0)" "aout(31:0)"
            PIN "b(31:0)" "bin(31:0)"
            PIN "x(4:0)" "XLXN_35(4:0)"
        END BLOCK
        BEGIN BLOCK "XLXI_9" "reg32"
            PIN "en" "run"
            PIN "clk" "clk"
            PIN "d(31:0)" "XLXN_53(31:0)"
            PIN "q(31:0)" "bout(31:0)"
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH "ain(31:0)"
            WIRE 272 1072 496 1072
        END BRANCH
        BEGIN BRANCH "bin(31:0)"
            WIRE 272 1136 448 1136
            WIRE 448 1136 448 1296
            WIRE 448 1296 1264 1296
            WIRE 1264 1296 1264 1504
            WIRE 1264 1504 1568 1504
            WIRE 448 1136 496 1136
            WIRE 1264 1136 1552 1136
            WIRE 1264 1136 1264 1296
        END BRANCH
        BEGIN BRANCH "lin(31:0)"
            WIRE 272 1200 496 1200
        END BRANCH
        BEGIN BRANCH "XLXN_23(31:0)"
            WIRE 896 1072 992 1072
        END BRANCH
        BEGIN BRANCH "sin(31:0)"
            WIRE 272 1264 1024 1264
            WIRE 1024 1200 1552 1200
            WIRE 1024 1200 1024 1264
        END BRANCH
        BEGIN BRANCH "aout(31:0)"
            WIRE 1392 1072 1440 1072
            WIRE 1440 1072 1472 1072
            WIRE 1472 1072 1552 1072
            WIRE 1440 1072 1440 1440
            WIRE 1440 1440 1568 1440
            WIRE 1472 928 3264 928
            WIRE 1472 928 1472 1072
        END BRANCH
        BEGIN BRANCH "XLXN_29(31:0)"
            WIRE 1952 1072 2032 1072
        END BRANCH
        BEGIN BRANCH "bout(31:0)"
            WIRE 3008 1072 3184 1072
            WIRE 3184 1072 3264 1072
            BEGIN DISPLAY 3184 1072 ATTR "Name"
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 3264 1072 "bout(31:0)" R0 28
        IOMARKER 3264 928 "aout(31:0)" R0 28
        BEGIN BRANCH "XLXN_35(4:0)"
            WIRE 1952 1440 2016 1440
            WIRE 2016 1136 2032 1136
            WIRE 2016 1136 2016 1440
        END BRANCH
        IOMARKER 272 1072 "ain(31:0)" R180 28
        IOMARKER 272 1136 "bin(31:0)" R180 28
        IOMARKER 272 1200 "lin(31:0)" R180 28
        IOMARKER 272 1264 "sin(31:0)" R180 28
        BEGIN INSTANCE "XLXI_1" 496 1232 R0
        END INSTANCE
        BEGIN INSTANCE "XLXI_2" 992 1104 R0
        END INSTANCE
        BEGIN INSTANCE "XLXI_3" 1552 1232 R0
        END INSTANCE
        BEGIN INSTANCE "XLXI_6" 2032 1168 R0
        END INSTANCE
        BEGIN INSTANCE "XLXI_8" 1568 1536 R0
        END INSTANCE
        BEGIN INSTANCE "XLXI_9" 2624 1296 R0
        END INSTANCE
        BEGIN BRANCH "XLXN_53(31:0)"
            WIRE 2432 1072 2624 1072
        END BRANCH
        BEGIN BRANCH "clk"
            WIRE 2576 1136 2624 1136
        END BRANCH
        BEGIN BRANCH "run"
            WIRE 2576 1200 2624 1200
        END BRANCH
        IOMARKER 2576 1136 "clk" R180 28
        IOMARKER 2576 1200 "run" R180 28
    END SHEET
END SCHEMATIC
