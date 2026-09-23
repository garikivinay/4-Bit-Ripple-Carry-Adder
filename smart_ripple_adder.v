module full_adder_core (
    input wire bit_in1,
    input wire bit_in2,
    input wire carry_in,
    output wire bit_sum,
    output wire carry_out
);
    assign bit_sum   = bit_in1 ^ bit_in2 ^ carry_in;
    assign carry_out = (bit_in1 & bit_in2) | (carry_in & (bit_in1 ^ bit_in2));
endmodule

module smart_ripple_adder (
    input wire [3:0] A,          
    input wire [3:0] B,          
    input wire Cin,              
    input wire EN,               
    output wire [3:0] Sum,       
    output wire Cout,            
    output wire OVR              
);

    wire [4:0] internal_carry_bus;
    wire [3:0] computation_sum;
    wire [3:0] conditioned_bus_A;
    wire [3:0] conditioned_bus_B;

    assign conditioned_bus_A = A & {4{EN}};
    assign conditioned_bus_B = B & {4{EN}};
    assign internal_carry_bus[0] = Cin & EN;

    full_adder_core fa_stage_0 (
        .bit_in1(conditioned_bus_A[0]), .bit_in2(conditioned_bus_B[0]), .carry_in(internal_carry_bus[0]),
        .bit_sum(computation_sum[0]),   .carry_out(internal_carry_bus[1])
    );

    full_adder_core fa_stage_1 (
        .bit_in1(conditioned_bus_A[1]), .bit_in2(conditioned_bus_B[1]), .carry_in(internal_carry_bus[1]),
        .bit_sum(computation_sum[1]),   .carry_out(internal_carry_bus[2])
    );

    full_adder_core fa_stage_2 (
        .bit_in1(conditioned_bus_A[2]), .bit_in2(conditioned_bus_B[2]), .carry_in(internal_carry_bus[2]),
        .bit_sum(computation_sum[2]),   .carry_out(internal_carry_bus[3])
    );

    full_adder_core fa_stage_3 (
        .bit_in1(conditioned_bus_A[3]), .bit_in2(conditioned_bus_B[3]), .carry_in(internal_carry_bus[3]),
        .bit_sum(computation_sum[3]),   .carry_out(internal_carry_bus[4])
    );

    assign Sum  = {4{EN}} & computation_sum;
    assign Cout = EN & internal_carry_bus[4];
    assign OVR  = EN & internal_carry_bus[4];

endmodule
