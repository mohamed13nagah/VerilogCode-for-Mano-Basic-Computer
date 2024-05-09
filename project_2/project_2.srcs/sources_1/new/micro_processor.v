`timescale 1ns / 1ps

module micro_processor(

input wire clk,
output reg [15:0] IR,
output reg [15:0] TR,
output reg [15:0] DR,
output reg [15:0] AC,
output reg [11:0] PC,
output reg [11:0] AR,

output reg I,
output reg E,
output reg S,
output
reg [3:0] timeCount ,

output reg [15:0]data_to_memory,
input  [15:0]data_from_memory


//IR,TR,DR,AC,PC,AR,I,E,S,clk,timeCount
);

reg R_W_MEM;

MEMORY mem_to_c(
//.CLK_mem(clk),
.R_W_MEM(R_W_MEM),
.MEM_address(AR[7:0]),
.MEM_data_in(data_to_memory),
.MEM_data_out(data_from_memory)

);


initial
begin
timeCount = 0;
IR <= 16'hx;
TR <= 16'hx;
DR <= 16'h0125;
AC = 0;
//AC = 16'h1234;
PC <= 0;
AR =16'h0000;
I<=0;
E<=0;
S <= 1; 


end


always @(posedge clk)


begin 
	
R_W_MEM=1;
	
	if (timeCount == 0) begin	
		AR <= PC;
		timeCount <= timeCount + 1; end
	
	else if (timeCount == 1) begin
	R_W_MEM=1;
	
		IR = data_from_memory; 
		PC <= PC + 1;		
		timeCount <= timeCount + 1; end
	
	else if (timeCount == 2) begin
		AR <= IR[11:0];
		I <= IR[15];
		timeCount <= timeCount +1; end
	
	
	else 
	
	begin
        
        
            if (IR[14:12] == 3'b111)
             begin
                //if(I == 1) // (I/O)
                   
                
                if(I == 0) begin// Register-reference 
                
                case(IR[11:0])
                
                12'h800  :  
                                       begin AC <= 0;  timeCount <= 0; end
                12'h400  :  
                                      begin  E <= 0;timeCount <= 0;end 
                12'h200  :  
                                       begin AC <= ~AC; timeCount <= 0; end
                12'h100  :  
                                       begin E <= ~E; timeCount <= 0; end                       
                12'h080  :  
                                       begin   {E,AC} = { AC[0],E, AC[15:1]};  timeCount <= 0;  end                                 
                 12'h040  :  
                                       begin {E, AC} = { AC[15], AC[14:0],E}; timeCount <= 0; end                                     
                  12'h020  :  
                                        begin AC <= AC + 1; timeCount <= 0; end        
                  12'h010  :  
                                        begin if ( AC [15] == 0)  begin PC <= PC +1; timeCount <= 0; end    end                                     
                  12'h008  :  
                                        begin if ( AC [15] == 1)  begin PC <= PC +1;      end                     end                              
                  12'h004 :  
                                      begin if ( AC == 0) begin PC <= PC +1;   end             end                             
                  12'h002  :  
                                      begin if ( E == 0) begin   PC <= PC +1; end      end                     
                 12'h001  :  
                                      begin S <= 0; timeCount <= 0; end                                      
                                                                                 
                endcase
                end
end //if D7



else // !D7 memory refrence instractions 
     begin
	 if  (IR[15]==1)  
	 
	 begin  
	 R_W_MEM=1;
	 AR <= data_from_memory; 
					timeCount <= timeCount + 1; end
					
	 else  
	 begin timeCount <= timeCount + 1;	end
	  
	  
if(timeCount == 4) begin	
  
case (IR[14:12])


//AND 
3'b000 : begin
R_W_MEM=1;
 DR <= data_from_memory; 
			   timeCount <= timeCount + 1;
               AC <= (AC & DR);
               timeCount <= 0;  end
//ADD
3'b001 : begin {E,AC} <= AC + DR; 
               timeCount <= 0; end
//LDA
3'b010 : begin AC <= DR; 
               timeCount <= 0; end
//STA
3'b011 : begin 
R_W_MEM=0;
data_to_memory <= AC ;
               timeCount <= 0; end
//BUN
3'b100 : begin PC <= AR; 
               timeCount <= 0; end
//BSA
3'b101 : begin 
R_W_MEM=0;
data_to_memory <= PC;

  AR <= AR + 1;
               timeCount <= timeCount + 1;
               PC <= AR; 
               timeCount <= 0;	end
//ISZ
3'b110 : begin
R_W_MEM=1;
 DR <= data_from_memory; 
               timeCount <= timeCount + 1; 
			   DR <= DR +1;
			   timeCount <= timeCount + 1;
			   R_W_MEM=0;
			   data_to_memory <= DR;
			   if(DR==0) begin PC <= PC +1;end
			   timeCount <= 0;	end
			 
endcase 	 
	 
 end   //?sc=4 


         
	 
	end  




end



end //alaways

endmodule






