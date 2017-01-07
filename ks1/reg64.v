/*******************************************************************************
*     This file is owned and controlled by Xilinx and must be used             *
*     solely for design, simulation, implementation and creation of            *
*     design files limited to Xilinx devices or technologies. Use              *
*     with non-Xilinx devices or technologies is expressly prohibited          *
*     and immediately terminates your license.                                 *
*                                                                              *
*     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"            *
*     SOLELY FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR                  *
*     XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION          *
*     AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE, APPLICATION              *
*     OR STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS                *
*     IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,                  *
*     AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE         *
*     FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY                 *
*     WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE                  *
*     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR           *
*     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF          *
*     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS          *
*     FOR A PARTICULAR PURPOSE.                                                *
*                                                                              *
*     Xilinx products are not intended for use in life support                 *
*     appliances, devices, or systems. Use in such applications are            *
*     expressly prohibited.                                                    *
*                                                                              *
*     (c) Copyright 1995-2002 Xilinx, Inc.                                     *
*     All rights reserved.                                                     *
*******************************************************************************/
// The synopsys directives "translate_off/translate_on" specified
// below are supported by XST, FPGA Express, Exemplar and Synplicity
// synthesis tools. Ensure they are correct for your synthesis tool(s).

// You must compile the wrapper file reg64.v when simulating
// the core, reg64. When compiling the wrapper file, be sure to
// reference the XilinxCoreLib Verilog simulation library. For detailed
// instructions, please refer to the "Coregen Users Guide".

module reg64 (
	D,
	Q,
	G,
	GE);    // synthesis black_box

input [63 : 0] D;
output [63 : 0] Q;
input G;
input GE;

// synopsys translate_off

	C_REG_LD_V6_0 #(
		"0000000000000000000000000000000000000000000000000000000000000000",	// c_ainit_val
		1,	// c_enable_rlocs
		0,	// c_has_aclr
		0,	// c_has_ainit
		0,	// c_has_aset
		1,	// c_has_ge
		0,	// c_has_sclr
		0,	// c_has_sinit
		0,	// c_has_sset
		"0000000000000000000000000000000000000000000000000000000000000000",	// c_sinit_val
		0,	// c_sync_enable
		1,	// c_sync_priority
		64)	// c_width
	inst (
		.D(D),
		.Q(Q),
		.G(G),
		.GE(GE),
		.ASET(),
		.SSET(),
		.ACLR(),
		.SCLR(),
		.AINIT(),
		.SINIT());


// synopsys translate_on

// FPGA Express black box declaration
// synopsys attribute fpga_dont_touch "true"
// synthesis attribute fpga_dont_touch of reg64 is "true"

// XST black box declaration
// box_type "black_box"
// synthesis attribute box_type of reg64 is "black_box"

endmodule
