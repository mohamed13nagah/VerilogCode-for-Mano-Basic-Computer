`timescale 1ns / 1ps



module MEMORY(
//input CLK_mem,
input R_W_MEM,
input [7:0] MEM_address,
output reg [15:0] MEM_data_out,
input [15:0] MEM_data_in
);
reg[15:0] MEM_data_array[255:0];






initial begin $readmemh ("C:/Users/alnaser/Desktop/memory_input.txt", MEM_data_array);

end


always @ (*)
 begin 
 if(!R_W_MEM) 
 begin MEM_data_array[MEM_address]=MEM_data_in; end 
else if(R_W_MEM)
begin  MEM_data_out = MEM_data_array[MEM_address]; end

else if (R_W_MEM==1'bx )
begin MEM_data_out = 16'hzzzz; end

else if (R_W_MEM==1'bz )
begin MEM_data_out = 16'hzzzz; end
end
endmodule 