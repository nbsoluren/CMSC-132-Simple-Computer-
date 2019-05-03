library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use STD.textio.all;
use ieee.std_logic_textio.all;

entity Simple_ComputerTb is

end Simple_ComputerTb;

architecture behavior of Simple_ComputerTb is
  ----------------------------------------------------------
  -- Testbench Internal Signals
  -- Declarative Region of VHDL
  ----------------------------------------------------------
  file file_VECTORS : text;

  constant c_WIDTH : natural := 8;
  --disregard the signals for now :(
  signal s_TERM1 : std_logic_vector(c_WIDTH-1 downto 0) := (others => '0');
  signal s_TERM2 : std_logic_vector(c_WIDTH-1 downto 0) := (others => '0');
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
    variable TERM4: string(1 to c_WIDTH);
    variable v_SPACE     : character;

  begin
    file_open(file_VECTORS, "input_vectors.txt",  READ_MODE);

    while not endfile(file_VECTORS) loop
      readline(file_VECTORS, v_ILINE);
      read(v_ILINE, TERM1);
      read(v_ILINE, v_SPACE);
      read(v_ILINE, TERM2);
      read(v_ILINE, v_SPACE);
      read(v_ILINE, TERM3);
      read(v_ILINE, v_SPACE);
      read(v_ILINE, TERM4);

      report("TERM 1: " & TERM1 & " " & "TERM 2: " & TERM2);
      report("TERM 3: " & TERM3 & " " & "TERM 4: " & TERM4);


    end loop;
    file_close(file_VECTORS);

    wait;

  end process;

end behavior;
