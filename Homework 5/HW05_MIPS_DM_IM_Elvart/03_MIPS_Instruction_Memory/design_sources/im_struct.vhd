LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;


ENTITY IM IS
   PORT( 
      ReadAddress : IN     std_logic_vector (31 DOWNTO 0) := "00000000000000000000000000000000";
      rst         : IN     std_logic;
      Instruction : OUT    std_logic_vector (31 DOWNTO 0)
   );
END IM ;


ARCHITECTURE struct_4byte_wide OF IM IS

   -- Architecture declarations
   constant my_program_size : natural := 39; -- Number of instructions
         
   type mem_type is array(0 to my_program_size-1) of std_logic_vector(31 downto 0);
   constant nop : std_logic_vector(31 downto 0) := (others => '0');
      
   constant my_program : mem_type :=   
(
"00111100000000010001000000000001",
"00110100001100000000000000000000",
"00111100000000010001000000000001",
"00110100001101010000000001001100",
"10001110101101010000000000000000",
"00100100000100100000000000000001",
"10101110000100100000000000000000",
"10101110000100100000000000000100",
"00100010101100011111111111111110",
"10001110000100110000000000000000",
"10001110000101000000000000000100",
"00000010011101001001000000100000",
"10101110000100100000000000001000",
"00100010000100000000000000000100",
"00100010001100011111111111111111",
"00011110001000001111111111111001",
"00111100000000010001000000000001",
"00110100001001000000000000000000",
"00000000000101010010100000100000",
"00001100000100000000000000010110",
"00100100000000100000000000001010",
"00000000000000000000000000001100",
"00000000000001000100000000100000",
"00000000000001010100100000100000",
"00111100000000010001000000000001",
"00110100001001000000000010001001",
"00100100000000100000000000000100",
"00000000000000000000000000001100",
"10001101000001000000000000000000",
"00100100000000100000000000000001",
"00000000000000000000000000001100",
"00111100000000010001000000000001",
"00110100001001000000000010000111",
"00100100000000100000000000000100",
"00000000000000000000000000001100",
"00100001000010000000000000000100",
"00100001001010011111111111111111",
"00011101001000001111111111110110",
"00000011111000000000000000001000"
);

   -- Internal signal declarations
   SIGNAL mem : mem_type;

BEGIN
   -- insert your design here --
   
    Operation: Process(rst)
    
    Begin
    if (rst = '1') Then
        mem <= (others => nop);
    else
        mem <= my_program;
    End If;
    End Process;
    
    Instruction <= mem(CONV_INTEGER(ReadAddress));
   -----------------------------
   
END struct_4byte_wide;
