library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use STD.textio.all;


entity Simple_ComputerTb is

end Simple_ComputerTb;

architecture behavior of Simple_ComputerTb is
  ----------------------------------------------------------
  -- Testbench Internal Signals
  -- Declarative Region of VHDL
  ----------------------------------------------------------
  file file_VECTORS : text;

  constant c_WIDTH : natural := 4;
  --disregard the signals for now :(
  signal s_TERM1 : std_logic_vector(c_WIDTH-1 downto 0) := (others => '0');
  signal s_TERM2 : std_logic_vector(c_WIDTH-1 downto 0) := (others => '0');
  type instruction is array (0 to 10) of string(1 to c_WIDTH);
  type destination is array (0 to 10) of string(1 to c_WIDTH);
  type source is array (0 to 10) of string(1 to c_WIDTH);

  begin

  process is
    ----------------------------------------------------------
    --Declare variables here
    ----------------------------------------------------------
    variable v_ILINE     : line;
    -- variable TERM1 : std_logic_vector(c_WIDTH-1 downto 0);
    -- variable TERM2 : std_logic_vector(c_WIDTH-1 downto 0);
    variable TERM1: string(1 to c_WIDTH);
    variable TERM2: string(1 to c_WIDTH);
    variable TERM3: string(1 to c_WIDTH);
    --variable TERM4: string(1 to c_WIDTH);
    variable v_SPACE     : character;

    variable j : integer := 0; -- index for instruction
    variable inst : instruction;
    variable dest : destination;
    variable src : source;




  begin
    file_open(file_VECTORS, "input_vectors.txt",  READ_MODE);

    while not endfile(file_VECTORS) loop
      readline(file_VECTORS, v_ILINE);
      read(v_ILINE, TERM1);
      read(v_ILINE, v_SPACE);
      read(v_ILINE, TERM2);
      read(v_ILINE, v_SPACE);
      read(v_ILINE, TERM3);
      --read(v_ILINE, v_SPACE);
      --read(v_ILINE, TERM4);

      inst(j) := TERM1; --stores it in instruction array
      dest(j) := TERM2;
      src(j) := TERM3;

      j := j+1; --increments instruction array index for next storage

      --report("TERM 1: " & TERM1 & " " & "TERM 2: " & TERM2);
      --report("TERM 3: " & TERM3 & " " & "TERM 4: " & TERM4);


    end loop;
    file_close(file_VECTORS);

    for I in 0 to j-1 loop
      report("inst: " & inst(I) & " " & "dest: " & dest(I) & " " & "src: " & src(I));

      if (inst(I) = "0000") then
        report("load: ");
        a <= 
      elsif (inst(I) = "0001") then
        report("add: ");
      elsif (inst(I) = "1000") then
        report("sub: ");
      elsif (inst(I) = "0010") then
        report("mul: ");
      elsif (inst(I) = "0100") then
        report("div: ");
      elsif (inst(I) = "0011") then
        report("mod: ");
        
      end if ;

      --report inst(I);
    end loop;


    wait;

  end process;

end behavior;
