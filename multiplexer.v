module multiplexer(
    input [7:0] in0, in1, in2, in3, in4, in5, in6, in7,
    input Enable,
    input [1:0] Sel,
    output [7:0] MuxOut
);
    assign MuxOut = 
    Enable ?
    ((Sel == 2'b00) ? in1 : 
    (Sel == 2'b01) ? in2 : 
    (Sel == 2'b10) ? in3 : in4 ) : 0;
     
endmodule