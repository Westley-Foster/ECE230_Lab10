module D_Latch(
    input D,
    input Enable,
    output reg Q,
    output NotQ
);

    always @(D, Enable) begin 
        if (Enable)
            Q <= D;
    end

    assign NotQ = ~Q; 

endmodule
