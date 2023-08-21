`include "project_mem.v"
module ram_test();
reg [9 : 0] address;
wire [7 : 0] data_out;
reg [7 : 0] data_in;
reg write, select;
integer k, myseed;
ram ram_t(address, data_in, data_out, write, select);
initial
begin
    for( k = 0; k <= 1023; k = k + 1)
    begin
        data_in = ( k + k ) % 256;
         write = 1; select = 1;
        #2 address = k; write = 0; select = 0;
    end 
    repeat(20)
    begin
        #2 address = $random(myseed) % 1024;
        write = 0; select = 1;
        $display(" address : %5d , data : %4d",address ,data_out);
    end
end
initial myseed = 35;
endmodule