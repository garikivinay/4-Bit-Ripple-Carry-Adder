`timescale 1ns / 1ps

module tb_smart_ripple_adder;

    reg [3:0] stim_A;
    reg [3:0] stim_B;
    reg stim_Cin;
    reg sys_EN;

    wire [3:0] out_Sum;
    wire out_Cout;
    wire out_OVR;

    smart_ripple_adder uut (
        .A(stim_A), 
        .B(stim_B), 
        .Cin(stim_Cin), 
        .EN(sys_EN),
        .Sum(out_Sum), 
        .Cout(out_Cout), 
        .OVR(out_OVR)
    );

    initial begin
        sys_EN = 0; stim_A = 4'd9; stim_B = 4'd6; stim_Cin = 1'b0; #15;
        sys_EN = 1; stim_A = 4'd5; stim_B = 4'd3; stim_Cin = 1'b0; #15;
        stim_A = 4'd7; stim_B = 4'd1; stim_Cin = 1'b1; #15;
        stim_A = 4'd14; stim_B = 4'd4; stim_Cin = 1'b0; #15;
        stim_A = 4'd0; stim_B = 4'd0; stim_Cin = 1'b0; #15;
        $finish;
    end

endmodule
