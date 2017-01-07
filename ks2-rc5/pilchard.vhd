library ieee;
use ieee.std_logic_1164.all;

library UNISIM;
use UNISIM.VComponents.all;


entity pilchard is
port (
	PADS_exchecker_reset: in std_logic;
	PADS_dimm_ck: in std_logic;
	PADS_dimm_cke: in std_logic_vector(1 downto 0);
	PADS_dimm_ras: in std_logic;
	PADS_dimm_cas: in std_logic;
	PADS_dimm_we: in std_logic;
	PADS_dimm_s: std_logic_vector(3 downto 0);
	PADS_dimm_a: in std_logic_vector(13 downto 0);
	PADS_dimm_ba: in std_logic_vector(1 downto 0);
	PADS_dimm_rege: in std_logic;
	PADS_dimm_d: inout std_logic_vector(63 downto 0);
	PADS_dimm_cb: inout std_logic_vector(7 downto 0);
	PADS_dimm_dqmb: in std_logic_vector(7 downto 0);
	PADS_dimm_scl: in std_logic;
	PADS_dimm_sda: inout std_logic;
	PADS_dimm_sa: in std_logic_vector(2 downto 0);
	PADS_dimm_wp: in std_logic;
	PADS_io_conn: inout std_logic_vector(27 downto 0) );
end pilchard;

architecture syn of pilchard is
	component dll_standard
    port (CLKIN : in  std_logic;
          CLK2X : out std_logic);
	end component;


	component BUF
	port (
		I: in std_logic;
		O: out std_logic );
	end component;

	component BUFG
	port (
		I: in std_logic;
		O: out std_logic );
	end component;

	component CLKDLLHF is
	port (
		CLKIN: in std_logic;
		CLKFB: in std_logic;
		RST: in std_logic;
		CLK0: out std_logic;
		CLK180: out std_logic;
		CLKDV: out std_logic;
		LOCKED: out std_logic );
	end component;

	component FDC is
	port (
		C: in std_logic;
		CLR: in std_logic;
		D: in std_logic;
		Q: out std_logic );
	end component;

	component IBUF
	port (
		I: in std_logic;
		O: out std_logic );
	end component;

	component IBUFG
	port (
		I: in std_logic;
		O: out std_logic );
	end component;

	component IOB_FDC is
	port (
		C: in std_logic;
		CLR: in std_logic;
		D: in std_logic;
		Q: out std_logic );
	end component;

	component IOBUF
	port (
		I: in std_logic;
		O: out std_logic;
		T: in std_logic;
		IO: inout std_logic );
	end component;

	component OBUF
	port (
		I: in std_logic;
		O: out std_logic );
	end component;

	component STARTUP_VIRTEX
	port (
		GSR: in std_logic;
		GTS: in std_logic;
		CLK: in std_logic );
	end component;

	component pcore
	port (
		clk: in std_logic;
		clkdiv: in std_logic;
		clk133: in std_logic;
		reset: in std_logic;
		read: in std_logic;
		write: in std_logic;
		-- control start
--		s : in std_logic;
--		ras : in std_logic;
--		cas : in std_logic;
--		we : in std_logic;
		-- end 
		addr: in std_logic_vector(13 downto 0);
		din: in std_logic_vector(63 downto 0);
		dout: out std_logic_vector(63 downto 0);
		dmask: in std_logic_vector(63 downto 0);
		extin: in std_logic_vector(25 downto 0);
		extout: out std_logic_vector(25 downto 0);
		extctrl: out std_logic_vector(25 downto 0) );
	end component;

	signal clkdllhf_clk0: std_logic;
	signal clkdllhf_clkdiv: std_logic;
	signal dimm_ck_bufg: std_logic;
	signal dimm_s_ibuf: std_logic;
	signal dimm_ras_ibuf: std_logic;
	signal dimm_cas_ibuf: std_logic;
	signal dimm_we_ibuf: std_logic;
	signal dimm_s_ibuf_d: std_logic;
	signal dimm_ras_ibuf_d: std_logic;
	signal dimm_cas_ibuf_d: std_logic;
	signal dimm_we_ibuf_d: std_logic;
	signal dimm_d_iobuf_i: std_logic_vector(63 downto 0);
	signal dimm_d_iobuf_o: std_logic_vector(63 downto 0);
	signal dimm_d_iobuf_t: std_logic_vector(63 downto 0);
	signal dimm_a_ibuf: std_logic_vector(14 downto 0);
	signal dimm_dqmb_ibuf: std_logic_vector(7 downto 0);
	signal io_conn_iobuf_i: std_logic_vector(27 downto 0);
	signal io_conn_iobuf_o: std_logic_vector(27 downto 0);
	signal io_conn_iobuf_t: std_logic_vector(27 downto 0);

	signal s,ras,cas,we : std_logic;

	signal VDD: std_logic;
	signal GND: std_logic;

	signal CLK: std_logic;
	signal CLKDIV: std_logic;
	signal CLK133: std_logic;
	signal RESET: std_logic;
	signal READ: std_logic;
	signal WRITE: std_logic;
	signal READ_p: std_logic;
	signal WRITE_p: std_logic;
	signal READ_n: std_logic;
	signal READ_buf: std_logic;
	signal WRITE_buf: std_logic;
	signal READ_d: std_logic;
	signal WRITE_d: std_logic;
	signal READ_d_n: std_logic;
	signal READ_d_n_buf: std_logic;

	signal pcore_addr: std_logic_vector(13 downto 0);
	signal pcore_din: std_logic_vector(63 downto 0);
	signal pcore_dout: std_logic_vector(63 downto 0);
	signal pcore_dmask: std_logic_vector(63 downto 0);
	signal pcore_extin: std_logic_vector(25 downto 0);
	signal pcore_extout: std_logic_vector(25 downto 0);
	signal pcore_extctrl: std_logic_vector(25 downto 0);
	signal pcore_dqmb: std_logic_vector(7 downto 0);

	-- added by Ian 16 Aug 03
	attribute box_type : string;
	attribute box_type of iob_fdc : component is "black_box";
	attribute box_type of iobuf : component is "black_box";
	attribute box_type of ibuf : component is "black_box";
	attribute box_type of startup_virtex : component is "black_box";
	attribute box_type of clkdllhf : component is "black_box";
	attribute box_type of ibufg : component is "black_box";
	attribute box_type of obuf : component is "black_box";
	attribute box_type of fdc : component is "black_box";
	attribute box_type of buf : component is "black_box";
	-- end addition

begin

	VDD <= '1';
	GND <= '0';

	U_ck_bufg: IBUFG port map (
		I => PADS_dimm_ck,
		O => dimm_ck_bufg );

	U_reset_ibuf: IBUF port map (
		I => PADS_exchecker_reset,
		O => RESET );

	U_clkdllhf: CLKDLLHF port map (
		CLKIN => dimm_ck_bufg,
		CLKFB => CLK,
		RST => RESET,
		CLK0 => clkdllhf_clk0,													 
		CLK180 => open,
		CLKDV => clkdllhf_clkdiv,
		LOCKED => open );

	U_clkdllhf_clk0_bufg: BUFG port map (
		I => clkdllhf_clk0,
		O => CLK );

	U_clkdllhf_clkdiv_bufg: BUFG port map (
		I => clkdllhf_clkdiv,
		O => CLKDIV );

	U_startup: STARTUP_VIRTEX port map (
		GSR => RESET,
		GTS => GND,
		CLK => CLK );

	U_dimm_s_ibuf: IBUF port map (
		I => PADS_dimm_s(0),
		O => dimm_s_ibuf );

	U_dimm_ras_ibuf: IBUF port map (
		I => PADS_dimm_ras,
		O => dimm_ras_ibuf );

	U_dimm_cas_ibuf: IBUF port map (
		I => PADS_dimm_cas,
		O => dimm_cas_ibuf );

	U_dimm_we_ibuf: IBUF port map (
		I => PADS_dimm_we,
		O => dimm_we_ibuf );

	G_dimm_d: for i in integer range 0 to 63 generate

		U_dimm_d_iobuf: IOBUF port map (
			I => dimm_d_iobuf_i(i),
			O => dimm_d_iobuf_o(i),
			T => dimm_d_iobuf_t(i),
			IO => PADS_dimm_d(i) );

		U_dimm_d_iobuf_o: IOB_FDC port map (
			C => CLK,
			CLR => RESET,
			D => dimm_d_iobuf_o(i),
			Q => pcore_din(i) );

		U_dimm_d_iobuf_i: IOB_FDC port map (
			C => CLK,
			CLR => RESET,
			D => pcore_dout(i),
			Q => dimm_d_iobuf_i(i) );

		U_dimm_d_iobuf_t: IOB_FDC port map (
			C => CLK,
			CLR => RESET,
			D => READ_d_n_buf,
			Q => dimm_d_iobuf_t(i) );

	end generate;

	G_dimm_a: for i in integer range 0 to 13 generate

		U_dimm_a_ibuf: IBUF port map (
			I => PADS_dimm_a(i),
			O => dimm_a_ibuf(i) );

		U_dimm_a_ibuf_o: IOB_FDC port map (
			C => CLK,
			CLR => RESET,
			D => dimm_a_ibuf(i),
			Q => pcore_addr(i) );

	end generate;

	G_dimm_dqmb: for i in integer range 0 to 7 generate

		U_dimm_dqmb_ibuf: IBUF port map (
			I => PADS_dimm_dqmb(i),
			O => dimm_dqmb_ibuf(i) );

		U_dimm_dqmb_ibuf_o: IOB_FDC port map (
			C => CLK,
			CLR => RESET,
			D => dimm_dqmb_ibuf(i),
			Q => pcore_dqmb(i) );

	end generate;

	pcore_dmask(7 downto 0) <= (others => (not pcore_dqmb(0)));
	pcore_dmask(15 downto 8) <= (others => (not pcore_dqmb(1)));
	pcore_dmask(23 downto 16) <= (others => (not pcore_dqmb(2)));
	pcore_dmask(31 downto 24) <= (others => (not pcore_dqmb(3)));
	pcore_dmask(39 downto 32) <= (others => (not pcore_dqmb(4)));
	pcore_dmask(47 downto 40) <= (others => (not pcore_dqmb(5)));
	pcore_dmask(55 downto 48) <= (others => (not pcore_dqmb(6)));
	pcore_dmask(63 downto 56) <= (others => (not pcore_dqmb(7)));

	G_io_conn: for i in integer range 2 to 27 generate

		U_io_conn_iobuf: IOBUF port map (
			I => io_conn_iobuf_i(i),
			O => io_conn_iobuf_o(i),
			T => io_conn_iobuf_t(i),
			IO => PADS_io_conn(i) );

		U_io_conn_iobuf_o: IOB_FDC port map (
			C => CLK,
			CLR => RESET,
			D => io_conn_iobuf_o(i),
			Q => pcore_extin(i - 2) );

		U_io_conn_iobuf_i: IOB_FDC port map (
			C => CLK,
			CLR => RESET,
			D => pcore_extout(i - 2),
			Q => io_conn_iobuf_i(i) );

		U_io_conn_iobuf_t: IOB_FDC port map (
			C => CLK,
			CLR => RESET,
			D => pcore_extctrl(i - 2),
			Q => io_conn_iobuf_t(i) );

	end generate;

	U_io_conn_0_obuf: OBUF port map (
		I => dimm_ck_bufg,
		O => PADS_io_conn(0) );

	U_io_conn_1_iobuf: IOBUF port map (
		I => GND,
		O => open,
		T => VDD,
		IO => PADS_io_conn(1) );

	READ_p <=
		(not dimm_s_ibuf) and
		(dimm_ras_ibuf) and
		(not dimm_cas_ibuf) and
		(dimm_we_ibuf);

	U_read: FDC port map (
		C => CLK,
		CLR => RESET,
		D => READ_p,
		Q => READ );

	U_buf_read: BUF port map (
		I => READ,
		O => READ_buf );

	U_read_d: FDC port map (
		C => CLK,
		CLR => RESET,
		D => READ,
		Q => READ_d );

	WRITE_p <=
		(not dimm_s_ibuf) and
		(dimm_ras_ibuf) and
		(not dimm_cas_ibuf) and
		(not dimm_we_ibuf);

	U_write: FDC port map (
		C => CLK,
		CLR => RESET,
		D => WRITE_p,
		Q => WRITE );

	U_buf_write: BUF port map (
		I => WRITE,
		O => WRITE_buf );

	U_write_d: FDC port map (
		C => CLK,
		CLR => RESET,
		D => WRITE,
		Q => WRITE_d );

	READ_n <= not READ;

	U_read_d_n: FDC port map (
		C => CLK,
		CLR => RESET,
		D => READ_n,
		Q => READ_d_n );

	U_buf_read_d_n: BUF port map (
		I => READ_d_n,
		O => READ_d_n_buf );



	U_pcore: pcore port map (
		clk => CLK,
		clkdiv => CLKDIV,
		clk133 => clk133,
		reset => RESET,
		read => READ_buf,
		write => WRITE_buf,
		-- control signal for ram start
--		s => dimm_s_ibuf,
--		ras => dimm_ras_ibuf,
--		cas => dimm_cas_ibuf,
--		we => dimm_we_ibuf,
		-- end 
		addr => pcore_addr,
		din => pcore_din,
		dout => pcore_dout,
		dmask => pcore_dmask,
		extin => pcore_extin,
		extout => pcore_extout,
		extctrl => pcore_extctrl );

   dll133 : dll_standard
   	port map (clkin=>clkdllhf_clkdiv, clk2x=>clk133);


end syn;
