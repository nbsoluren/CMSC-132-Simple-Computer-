library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity simple_tb is
end entity simple_tb;

architecture testbench of simple_tb is
  signal i0, i1, o0 : std_logic;

  component simple is
    port(A,B: in std_logic; C: out std_logic);
  end component simple;

begin
  uut : simple port map(i0,i1,o0);
  process
    -- initialize variables
    variable error_count : integer := 0;
  begin
    -- first case: both inputs are zero
    i0 <= '0';
    i1 <= '0';

    -- let the process run for some time
    wait for 10 ns;

    -- check if output is correct
    assert o0='0' report "0 AND 0 [ERROR] Expected output: 0; Actual " & 
                          std_logic'image(o0) severity ERROR;
    if o0/='0' then error_count := error_count+1; end if;

    --second test case: 0 AND 1
    i0 <= '0';
    i1 <= '1';
    wait for 10 ns;
    assert o0='1' report "0 AND 1 [ERROR] Expected output: 1; Actual " & 
                          std_logic'image(o0) severity ERROR;
    if o0/='1' then error_count := error_count+1; end if;

    --third test case: 1 AND 0
    i0 <= '1';
    i1 <= '0';
    wait for 10 ns;
    assert o0='1' report "1 AND 0 [ERROR] Expected output: 1; Actual " & 
                          std_logic'image(o0) severity ERROR;
    if o0/='1' then error_count := error_count+1; end if;

    --fourth test case: 1 AND 1
    i0 <= '1';
    i1 <= '1';
    wait for 10 ns;
    assert o0='1' report "1 AND 1 [ERROR] Expected output: 1; Actual " & 
                          std_logic'image(o0) severity ERROR;
    if o0/='1' then error_count := error_count+1; end if;

    -- last notice
    report "Done with the test. There were " & integer'image(error_count) &
           " errors found." severity NOTE;
    wait;
  end process;
end architecture testbench;



