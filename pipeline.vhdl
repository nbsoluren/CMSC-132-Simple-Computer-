LIBRARY ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use STD.textio.all;

ENTITY pipeline IS 
END pipeline;

ARCHITECTURE behavioral of pipeline IS
	signal bin_value : std_logic_vector(3 downto 0):="0000";
BEGIN
	process 
      file file_pointer : text;
        variable line_content : string(1 to 4);
      variable line_num : line;
        variable j : integer := 0;
        variable char : character:='0'; 
    begin

      file_open(file_pointer,"input.txt",READ_MODE);    
      while not endfile(file_pointer) loop 
      readline (file_pointer,line_num); 
      
      READ (line_num,line_content); 
     
      report line_content;
        for j in 1 to 4 loop        
            char := line_content(j);
            if(char = '0') then
                bin_value(4-j) <= '0';
            else
                bin_value(4-j) <= '1';
            end if; 
        end loop;   
        wait for 10 ns; 
      end loop;
      file_close(file_pointer);
        wait;
    end process;
end ARCHITECTURE;