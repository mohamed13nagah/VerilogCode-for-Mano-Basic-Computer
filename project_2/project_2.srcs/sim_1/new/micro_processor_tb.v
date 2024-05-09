`timescale 1ns / 1ps

module tb_micro_processor;

  reg clk;
  wire [15:0] IR, TR, DR, AC, data_from_memory;
  wire I, E, S;
  wire [11:0] PC, AR;
  wire [3:0] timeCount;
  wire [15:0] data_to_memory;

  micro_processor uut (
    .clk(clk),
    .IR(IR),
    .TR(TR),
    .DR(DR),
    .AC(AC),
    .PC(PC),
    .AR(AR),
    .I(I),
    .E(E),
    .S(S),
    .timeCount(timeCount),
    .data_to_memory(data_to_memory),
    .data_from_memory(data_from_memory)
  );

  // Clock generation
  initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
  end

  // Initial memory content (replace with your actual content)
//  reg [15:0] memory[0:255];
//  initial begin
//    memory[0] = 16'h8010; // Load immediate (AC = 16'h10)
//    memory[1] = 16'h0125; // Data for Load immediate
//    // Add more instructions and data here
//  end

//  // Connect memory to processor outputs
//  assign data_from_memory = memory[AR];
//  always @(posedge clk) begin
//    if (uut.R_W_MEM == 1'b0) begin
//      memory[uut.AR] <= uut.data_to_memory;
//    end
//  end

//  // Monitor signals for debugging (replace with your assertions)
//  initial begin
//    $monitor("time = %0d, clk = %b, IR = %h, PC = %d, AC = %h", $time, clk, IR, PC, AC);
//  end

endmodule
