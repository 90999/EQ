// -------------------------------------------------------------
//
// Module: highpass_filter
// Generated by MATLAB(R) 8.1 and the Filter Design HDL Coder 2.9.3.
// Generated on: 2013-12-24 19:42:25
// -------------------------------------------------------------

// -------------------------------------------------------------
// HDL Code Generation Options:
//
// FIRAdderStyle: tree
// ClockEnableInputPort: clkena_i
// ClockInputPort: clk_i
// ResetInputPort: nrst_i
// TargetDirectory: /home/egor
// AddPipelineRegisters: on
// Name: highpass_filter
// TargetLanguage: Verilog
// TestBenchName: highpass_filter_tb
// TestBenchStimulus: impulse step ramp chirp noise 

// -------------------------------------------------------------
// HDL Implementation    : Fully parallel
// Multipliers           : 33
// Folding Factor        : 1
// -------------------------------------------------------------
// Filter Settings:
//
// Discrete-Time FIR Filter (real)
// -------------------------------
// Filter Structure  : Direct-Form FIR
// Filter Length     : 33
// Stable            : Yes
// Linear Phase      : No
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module highpass_filter
               (
                clk_i,
                clkena_i,
                nrst_i,
                filter_i,
                filter_o
                );

  input   clk_i; 
  input   clkena_i; 
  input   nrst_i; 
  input   [63:0] filter_i; //double
  output  [63:0] filter_o; //double

////////////////////////////////////////////////////////////////
//Module Architecture: highpass_filter
////////////////////////////////////////////////////////////////
  // Local Functions
  // Type Definitions
  // Constants
  parameter coeff1 = 3.9236412691450367E-02; //double
  parameter coeff2 = -1.3854523536648100E-01; //double
  parameter coeff3 = 2.0330966897569305E-01; //double
  parameter coeff4 = -1.5933653459935188E-01; //double
  parameter coeff5 = 1.2354305103180022E-01; //double
  parameter coeff6 = -1.7420884138328827E-01; //double
  parameter coeff7 = 1.6957614047386269E-01; //double
  parameter coeff8 = -7.3282722671121597E-02; //double
  parameter coeff9 = 4.5998146597914541E-02; //double
  parameter coeff10 = -5.3984675728879702E-02; //double
  parameter coeff11 = -3.8949431346007472E-02; //double
  parameter coeff12 = 9.7748486954346334E-02; //double
  parameter coeff13 = -3.4348189197921021E-02; //double
  parameter coeff14 = 4.2890674005290043E-02; //double
  parameter coeff15 = -1.0200877681411763E-01; //double
  parameter coeff16 = 4.9560040523447188E-03; //double
  parameter coeff17 = 8.7652853655255936E-02; //double
  parameter coeff18 = -8.3808749867472047E-03; //double
  parameter coeff19 = 1.7306920985884690E-02; //double
  parameter coeff20 = -1.4614979999645086E-01; //double
  parameter coeff21 = 5.7317629677062200E-02; //double
  parameter coeff22 = 1.1747033304791929E-01; //double
  parameter coeff23 = -2.7029386297573853E-02; //double
  parameter coeff24 = -4.1957725232406956E-02; //double
  parameter coeff25 = -1.8793874111410730E-01; //double
  parameter coeff26 = 2.4055699523805518E-01; //double
  parameter coeff27 = 1.4635288981846445E-01; //double
  parameter coeff28 = -3.8946379492028199E-01; //double
  parameter coeff29 = 1.2916824960135370E-01; //double
  parameter coeff30 = 1.9419784979190088E-01; //double
  parameter coeff31 = -2.0416770600637729E-01; //double
  parameter coeff32 = 6.7066334658624605E-02; //double
  parameter coeff33 = -3.0057759105257850E-03; //double

  // Signals
  real delay_pipeline [0:32] ; // double
  real product33; // double
  real product32; // double
  real product31; // double
  real product30; // double
  real product29; // double
  real product28; // double
  real product27; // double
  real product26; // double
  real product25; // double
  real product24; // double
  real product23; // double
  real product22; // double
  real product21; // double
  real product20; // double
  real product19; // double
  real product18; // double
  real product17; // double
  real product16; // double
  real product15; // double
  real product14; // double
  real product13; // double
  real product12; // double
  real product11; // double
  real product10; // double
  real product9; // double
  real product8; // double
  real product7; // double
  real product6; // double
  real product5; // double
  real product4; // double
  real product3; // double
  real product2; // double
  real product1; // double
  real sum_final; // double
  real sum1_1; // double
  real sumpipe1_1; // double
  real sum1_2; // double
  real sumpipe1_2; // double
  real sum1_3; // double
  real sumpipe1_3; // double
  real sum1_4; // double
  real sumpipe1_4; // double
  real sum1_5; // double
  real sumpipe1_5; // double
  real sum1_6; // double
  real sumpipe1_6; // double
  real sum1_7; // double
  real sumpipe1_7; // double
  real sum1_8; // double
  real sumpipe1_8; // double
  real sum1_9; // double
  real sumpipe1_9; // double
  real sum1_10; // double
  real sumpipe1_10; // double
  real sum1_11; // double
  real sumpipe1_11; // double
  real sum1_12; // double
  real sumpipe1_12; // double
  real sum1_13; // double
  real sumpipe1_13; // double
  real sum1_14; // double
  real sumpipe1_14; // double
  real sum1_15; // double
  real sumpipe1_15; // double
  real sum1_16; // double
  real sumpipe1_16; // double
  real sumpipe1_17; // double
  real sum2_1; // double
  real sumpipe2_1; // double
  real sum2_2; // double
  real sumpipe2_2; // double
  real sum2_3; // double
  real sumpipe2_3; // double
  real sum2_4; // double
  real sumpipe2_4; // double
  real sum2_5; // double
  real sumpipe2_5; // double
  real sum2_6; // double
  real sumpipe2_6; // double
  real sum2_7; // double
  real sumpipe2_7; // double
  real sum2_8; // double
  real sumpipe2_8; // double
  real sumpipe2_9; // double
  real sum3_1; // double
  real sumpipe3_1; // double
  real sum3_2; // double
  real sumpipe3_2; // double
  real sum3_3; // double
  real sumpipe3_3; // double
  real sum3_4; // double
  real sumpipe3_4; // double
  real sumpipe3_5; // double
  real sum4_1; // double
  real sumpipe4_1; // double
  real sum4_2; // double
  real sumpipe4_2; // double
  real sumpipe4_3; // double
  real sum5_1; // double
  real sumpipe5_1; // double
  real sumpipe5_2; // double
  real sum6_1; // double
  real sumpipe6_1; // double
  real output_typeconvert; // double
  real output_register; // double

  // Block Statements
  always @( posedge clk_i or negedge nrst_i)
    begin: Delay_Pipeline_process
      if (nrst_i == 1'b1) begin
        delay_pipeline[0] <= 0.0000000000000000E+00;
        delay_pipeline[1] <= 0.0000000000000000E+00;
        delay_pipeline[2] <= 0.0000000000000000E+00;
        delay_pipeline[3] <= 0.0000000000000000E+00;
        delay_pipeline[4] <= 0.0000000000000000E+00;
        delay_pipeline[5] <= 0.0000000000000000E+00;
        delay_pipeline[6] <= 0.0000000000000000E+00;
        delay_pipeline[7] <= 0.0000000000000000E+00;
        delay_pipeline[8] <= 0.0000000000000000E+00;
        delay_pipeline[9] <= 0.0000000000000000E+00;
        delay_pipeline[10] <= 0.0000000000000000E+00;
        delay_pipeline[11] <= 0.0000000000000000E+00;
        delay_pipeline[12] <= 0.0000000000000000E+00;
        delay_pipeline[13] <= 0.0000000000000000E+00;
        delay_pipeline[14] <= 0.0000000000000000E+00;
        delay_pipeline[15] <= 0.0000000000000000E+00;
        delay_pipeline[16] <= 0.0000000000000000E+00;
        delay_pipeline[17] <= 0.0000000000000000E+00;
        delay_pipeline[18] <= 0.0000000000000000E+00;
        delay_pipeline[19] <= 0.0000000000000000E+00;
        delay_pipeline[20] <= 0.0000000000000000E+00;
        delay_pipeline[21] <= 0.0000000000000000E+00;
        delay_pipeline[22] <= 0.0000000000000000E+00;
        delay_pipeline[23] <= 0.0000000000000000E+00;
        delay_pipeline[24] <= 0.0000000000000000E+00;
        delay_pipeline[25] <= 0.0000000000000000E+00;
        delay_pipeline[26] <= 0.0000000000000000E+00;
        delay_pipeline[27] <= 0.0000000000000000E+00;
        delay_pipeline[28] <= 0.0000000000000000E+00;
        delay_pipeline[29] <= 0.0000000000000000E+00;
        delay_pipeline[30] <= 0.0000000000000000E+00;
        delay_pipeline[31] <= 0.0000000000000000E+00;
        delay_pipeline[32] <= 0.0000000000000000E+00;
      end
      else begin
        if (clkena_i == 1'b1) begin
          delay_pipeline[0] <= $bitstoreal(filter_i);
          delay_pipeline[1] <= delay_pipeline[0];
          delay_pipeline[2] <= delay_pipeline[1];
          delay_pipeline[3] <= delay_pipeline[2];
          delay_pipeline[4] <= delay_pipeline[3];
          delay_pipeline[5] <= delay_pipeline[4];
          delay_pipeline[6] <= delay_pipeline[5];
          delay_pipeline[7] <= delay_pipeline[6];
          delay_pipeline[8] <= delay_pipeline[7];
          delay_pipeline[9] <= delay_pipeline[8];
          delay_pipeline[10] <= delay_pipeline[9];
          delay_pipeline[11] <= delay_pipeline[10];
          delay_pipeline[12] <= delay_pipeline[11];
          delay_pipeline[13] <= delay_pipeline[12];
          delay_pipeline[14] <= delay_pipeline[13];
          delay_pipeline[15] <= delay_pipeline[14];
          delay_pipeline[16] <= delay_pipeline[15];
          delay_pipeline[17] <= delay_pipeline[16];
          delay_pipeline[18] <= delay_pipeline[17];
          delay_pipeline[19] <= delay_pipeline[18];
          delay_pipeline[20] <= delay_pipeline[19];
          delay_pipeline[21] <= delay_pipeline[20];
          delay_pipeline[22] <= delay_pipeline[21];
          delay_pipeline[23] <= delay_pipeline[22];
          delay_pipeline[24] <= delay_pipeline[23];
          delay_pipeline[25] <= delay_pipeline[24];
          delay_pipeline[26] <= delay_pipeline[25];
          delay_pipeline[27] <= delay_pipeline[26];
          delay_pipeline[28] <= delay_pipeline[27];
          delay_pipeline[29] <= delay_pipeline[28];
          delay_pipeline[30] <= delay_pipeline[29];
          delay_pipeline[31] <= delay_pipeline[30];
          delay_pipeline[32] <= delay_pipeline[31];
        end
      end
    end // Delay_Pipeline_process


  always @* product33 <= delay_pipeline[32] * coeff33;

  always @* product32 <= delay_pipeline[31] * coeff32;

  always @* product31 <= delay_pipeline[30] * coeff31;

  always @* product30 <= delay_pipeline[29] * coeff30;

  always @* product29 <= delay_pipeline[28] * coeff29;

  always @* product28 <= delay_pipeline[27] * coeff28;

  always @* product27 <= delay_pipeline[26] * coeff27;

  always @* product26 <= delay_pipeline[25] * coeff26;

  always @* product25 <= delay_pipeline[24] * coeff25;

  always @* product24 <= delay_pipeline[23] * coeff24;

  always @* product23 <= delay_pipeline[22] * coeff23;

  always @* product22 <= delay_pipeline[21] * coeff22;

  always @* product21 <= delay_pipeline[20] * coeff21;

  always @* product20 <= delay_pipeline[19] * coeff20;

  always @* product19 <= delay_pipeline[18] * coeff19;

  always @* product18 <= delay_pipeline[17] * coeff18;

  always @* product17 <= delay_pipeline[16] * coeff17;

  always @* product16 <= delay_pipeline[15] * coeff16;

  always @* product15 <= delay_pipeline[14] * coeff15;

  always @* product14 <= delay_pipeline[13] * coeff14;

  always @* product13 <= delay_pipeline[12] * coeff13;

  always @* product12 <= delay_pipeline[11] * coeff12;

  always @* product11 <= delay_pipeline[10] * coeff11;

  always @* product10 <= delay_pipeline[9] * coeff10;

  always @* product9 <= delay_pipeline[8] * coeff9;

  always @* product8 <= delay_pipeline[7] * coeff8;

  always @* product7 <= delay_pipeline[6] * coeff7;

  always @* product6 <= delay_pipeline[5] * coeff6;

  always @* product5 <= delay_pipeline[4] * coeff5;

  always @* product4 <= delay_pipeline[3] * coeff4;

  always @* product3 <= delay_pipeline[2] * coeff3;

  always @* product2 <= delay_pipeline[1] * coeff2;

  always @* product1 <= delay_pipeline[0] * coeff1;

  always @* sum1_1 <= product33 + product32;

  always @* sum1_2 <= product31 + product30;

  always @* sum1_3 <= product29 + product28;

  always @* sum1_4 <= product27 + product26;

  always @* sum1_5 <= product25 + product24;

  always @* sum1_6 <= product23 + product22;

  always @* sum1_7 <= product21 + product20;

  always @* sum1_8 <= product19 + product18;

  always @* sum1_9 <= product17 + product16;

  always @* sum1_10 <= product15 + product14;

  always @* sum1_11 <= product13 + product12;

  always @* sum1_12 <= product11 + product10;

  always @* sum1_13 <= product9 + product8;

  always @* sum1_14 <= product7 + product6;

  always @* sum1_15 <= product5 + product4;

  always @* sum1_16 <= product3 + product2;

  always @ (posedge clk_i or negedge nrst_i)
    begin: temp_process1
      if (nrst_i == 1'b1) begin
        sumpipe1_1 <= 0.0000000000000000E+00;
        sumpipe1_2 <= 0.0000000000000000E+00;
        sumpipe1_3 <= 0.0000000000000000E+00;
        sumpipe1_4 <= 0.0000000000000000E+00;
        sumpipe1_5 <= 0.0000000000000000E+00;
        sumpipe1_6 <= 0.0000000000000000E+00;
        sumpipe1_7 <= 0.0000000000000000E+00;
        sumpipe1_8 <= 0.0000000000000000E+00;
        sumpipe1_9 <= 0.0000000000000000E+00;
        sumpipe1_10 <= 0.0000000000000000E+00;
        sumpipe1_11 <= 0.0000000000000000E+00;
        sumpipe1_12 <= 0.0000000000000000E+00;
        sumpipe1_13 <= 0.0000000000000000E+00;
        sumpipe1_14 <= 0.0000000000000000E+00;
        sumpipe1_15 <= 0.0000000000000000E+00;
        sumpipe1_16 <= 0.0000000000000000E+00;
        sumpipe1_17 <= 0.0000000000000000E+00;
      end
      else begin
        if (clkena_i == 1'b1) begin
          sumpipe1_1 <= sum1_1;
          sumpipe1_2 <= sum1_2;
          sumpipe1_3 <= sum1_3;
          sumpipe1_4 <= sum1_4;
          sumpipe1_5 <= sum1_5;
          sumpipe1_6 <= sum1_6;
          sumpipe1_7 <= sum1_7;
          sumpipe1_8 <= sum1_8;
          sumpipe1_9 <= sum1_9;
          sumpipe1_10 <= sum1_10;
          sumpipe1_11 <= sum1_11;
          sumpipe1_12 <= sum1_12;
          sumpipe1_13 <= sum1_13;
          sumpipe1_14 <= sum1_14;
          sumpipe1_15 <= sum1_15;
          sumpipe1_16 <= sum1_16;
          sumpipe1_17 <= product1;
        end
      end
    end // temp_process1

  always @* sum2_1 <= sumpipe1_1 + sumpipe1_2;

  always @* sum2_2 <= sumpipe1_3 + sumpipe1_4;

  always @* sum2_3 <= sumpipe1_5 + sumpipe1_6;

  always @* sum2_4 <= sumpipe1_7 + sumpipe1_8;

  always @* sum2_5 <= sumpipe1_9 + sumpipe1_10;

  always @* sum2_6 <= sumpipe1_11 + sumpipe1_12;

  always @* sum2_7 <= sumpipe1_13 + sumpipe1_14;

  always @* sum2_8 <= sumpipe1_15 + sumpipe1_16;

  always @ (posedge clk_i or negedge nrst_i)
    begin: temp_process2
      if (nrst_i == 1'b1) begin
        sumpipe2_1 <= 0.0000000000000000E+00;
        sumpipe2_2 <= 0.0000000000000000E+00;
        sumpipe2_3 <= 0.0000000000000000E+00;
        sumpipe2_4 <= 0.0000000000000000E+00;
        sumpipe2_5 <= 0.0000000000000000E+00;
        sumpipe2_6 <= 0.0000000000000000E+00;
        sumpipe2_7 <= 0.0000000000000000E+00;
        sumpipe2_8 <= 0.0000000000000000E+00;
        sumpipe2_9 <= 0.0000000000000000E+00;
      end
      else begin
        if (clkena_i == 1'b1) begin
          sumpipe2_1 <= sum2_1;
          sumpipe2_2 <= sum2_2;
          sumpipe2_3 <= sum2_3;
          sumpipe2_4 <= sum2_4;
          sumpipe2_5 <= sum2_5;
          sumpipe2_6 <= sum2_6;
          sumpipe2_7 <= sum2_7;
          sumpipe2_8 <= sum2_8;
          sumpipe2_9 <= sumpipe1_17;
        end
      end
    end // temp_process2

  always @* sum3_1 <= sumpipe2_1 + sumpipe2_2;

  always @* sum3_2 <= sumpipe2_3 + sumpipe2_4;

  always @* sum3_3 <= sumpipe2_5 + sumpipe2_6;

  always @* sum3_4 <= sumpipe2_7 + sumpipe2_8;

  always @ (posedge clk_i or negedge nrst_i)
    begin: temp_process3
      if (nrst_i == 1'b1) begin
        sumpipe3_1 <= 0.0000000000000000E+00;
        sumpipe3_2 <= 0.0000000000000000E+00;
        sumpipe3_3 <= 0.0000000000000000E+00;
        sumpipe3_4 <= 0.0000000000000000E+00;
        sumpipe3_5 <= 0.0000000000000000E+00;
      end
      else begin
        if (clkena_i == 1'b1) begin
          sumpipe3_1 <= sum3_1;
          sumpipe3_2 <= sum3_2;
          sumpipe3_3 <= sum3_3;
          sumpipe3_4 <= sum3_4;
          sumpipe3_5 <= sumpipe2_9;
        end
      end
    end // temp_process3

  always @* sum4_1 <= sumpipe3_1 + sumpipe3_2;

  always @* sum4_2 <= sumpipe3_3 + sumpipe3_4;

  always @ (posedge clk_i or negedge nrst_i)
    begin: temp_process4
      if (nrst_i == 1'b1) begin
        sumpipe4_1 <= 0.0000000000000000E+00;
        sumpipe4_2 <= 0.0000000000000000E+00;
        sumpipe4_3 <= 0.0000000000000000E+00;
      end
      else begin
        if (clkena_i == 1'b1) begin
          sumpipe4_1 <= sum4_1;
          sumpipe4_2 <= sum4_2;
          sumpipe4_3 <= sumpipe3_5;
        end
      end
    end // temp_process4

  always @* sum5_1 <= sumpipe4_1 + sumpipe4_2;

  always @ (posedge clk_i or negedge nrst_i)
    begin: temp_process5
      if (nrst_i == 1'b1) begin
        sumpipe5_1 <= 0.0000000000000000E+00;
        sumpipe5_2 <= 0.0000000000000000E+00;
      end
      else begin
        if (clkena_i == 1'b1) begin
          sumpipe5_1 <= sum5_1;
          sumpipe5_2 <= sumpipe4_3;
        end
      end
    end // temp_process5

  always @* sum6_1 <= sumpipe5_1 + sumpipe5_2;

  always @ (posedge clk_i or negedge nrst_i)
    begin: temp_process6
      if (nrst_i == 1'b1) begin
        sumpipe6_1 <= 0.0000000000000000E+00;
      end
      else begin
        if (clkena_i == 1'b1) begin
          sumpipe6_1 <= sum6_1;
        end
      end
    end // temp_process6

  always @* sum_final <= sumpipe6_1;


  always @* output_typeconvert <= sum_final;


  always @ (posedge clk_i or negedge nrst_i)
    begin: Output_Register_process
      if (nrst_i == 1'b1) begin
        output_register <= 0.0000000000000000E+00;
      end
      else begin
        if (clkena_i == 1'b1) begin
          output_register <= output_typeconvert;
        end
      end
    end // Output_Register_process

  // Assignment Statements
  assign filter_o = $realtobits(output_register);
endmodule  // highpass_filter
