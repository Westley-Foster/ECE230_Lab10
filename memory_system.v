module memory_system(
    input [7:0] dataIn,
    input store,
    input [1:0] addr,
    output [7:0] memory
);
    wire [7:0] demuxOut[3:0];
    wire [7:0] dRegisterOut[3:0];
    wire demuxSelectOut[3:0];
    wire muxSelectOut[3:0];

    demultiplexer dataDeMux(
        .data(dataIn),
        .sel(addr),
        .A(demuxOut[0]), 
        .B(demuxOut[1]),
        .C(demuxOut[2]), 
        .D(demuxOut[3])
        );    
        
    demultiplexer storeDeMux(
        .sel(store),
        .A(demuxSelectOut[0]), 
        .B(demuxSelectOut[1]),
        .C(demuxSelectOut[2]), 
        .D(demuxSelectOut[3])
        );    
        
    genvar i; 
    
    
    generate            
        for (i = 0; i < 4; i = i + 1) begin 
            byte_memory byte_blocks( 
                .data(demuxOut[i]),
                .store(demuxSelectOut[i]), 
                .Q(dRegisterOut[i])
                
            );
        end
        

    endgenerate
    
        multiplexer storeMux(
        .sel(dRegisterOut),
        .A(muxSelectOut[0]), 
        .B(muxSelectOut[1]),
        .C(muxSelectOut[2]), 
        .D(muxSelectOut[3])
        );  
    reg [3:0] byte_memory [3:0];
    
endmodule
