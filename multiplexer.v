module multiplexer(
    input [7:0] in0, in1, in2, in3,
    input Enable,
    input [1:0] Sel,
    output reg [7:0] MuxOut
);
    always @(*) begin
        if (Enable) begin
            case(Sel)
                2'b00: MuxOut = in0; 
                2'b01: MuxOut = in1; 
                2'b10: MuxOut = in2; 
                2'b11: MuxOut = in3;
                default: MuxOut = 8'b00000000;
            endcase
        end else begin
            MuxOut = 8'b00000000;
        end
    end
endmodule
