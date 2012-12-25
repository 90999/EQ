`timescale 1ns/100ps

module testbench;

parameter T = 10;

reg spdif_data, rst_n, clk, enable;
wire decoded_data, decoded_clk;
wire blivet, window;

decoder dcdr1(spdif_data, rst_n, clk, enable, decoded_data, decoded_clk, blivet, window);

initial
begin
	clk = 0;
	enable = 0;
	rst_n = 0;
	spdif_data = 0;
end
	
always 
	#(T/2) clk = ~clk;

initial
begin
	#1 rst_n = 1'b0;
	#1 rst_n = 1'b1;
	#2 enable = 1'b1;
end

initial
begin
	#(2.5*T) spdif_data = 1'b1;
	#(3*T) spdif_data = 1'b0;
	#(3*T) spdif_data = 1'b1;
	#(6*T) spdif_data = 1'b0;
	#(6*T) spdif_data = 1'b1;
	#(3*T) spdif_data = 1'b0;
	#(3*T) spdif_data = 1'b1;
	#(3*T) spdif_data = 1'b0;
	#(3*T) spdif_data = 1'b1;
	#(6*T) spdif_data = 1'b0;
	#(6*T) spdif_data = 1'b1;
end

initial
begin
   $display("\t\ttime,\tclk,\treset,\tspdif,\td_out,\tclk_out");
   $monitor("%d,\t%b,\t%b,\t%b,\t%b,\t%b", $time, clk, ~rst_n, spdif_data, decoded_data, decoded_clk); 
end 

/* always @(posedge clk)
begin
	//spdif_data = ~spdif_data;
 	//$display("d_out ", decoded_data, ", clk_out ", decoded_clk);
end */

endmodule