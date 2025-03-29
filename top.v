module top(
    input [15:0] sw,
    input btnC,
    output [15:0] led
);


       
     memory_system part2(
        .dataIn(sw[15:8]),
        .addr(sw[7:6]),
        .store(btnC),
        .memory(led)
    );

    
        D_Latch latch(
        .D(sw[0]),
        .Enable(btnC), 
        .Q(led[0]),
        .NotQ(led[1])
    );

endmodule
