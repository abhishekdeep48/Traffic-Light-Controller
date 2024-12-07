module traffic_project(clk, red, yellow, green);
input clk;
output reg red, yellow, green;

parameter rd = 2'b00,rd_yell = 2'b01,grn = 2'b10,grn_yell = 2'b11;


reg [1:0] state;
reg [4:0] count;
reg [4:0] rd_count=25;
reg [1:0] rd_yell_count=1;
reg [3:0] grn_count=15;
reg [1:0] grn_yell_count=1;

 
  always @(posedge clk) begin
    case (state)

      rd : begin
       if (count == 0) 
	begin
            state <= rd_yell;
            count <= rd_yell_count;
        end
       else
	begin
	  red = 1;
          yellow = 0;
          green = 0;
            count <= count - 1;
	end
        	end

      rd_yell : begin
       if (count == 0) 
	begin
            state <= grn;
            count <= grn_count;
        end
       else
	begin
	  red = 1;
          yellow = 1;
          green = 0;
            count <= count - 1;
	end
        	end

      grn : begin
        if (count == 0)
	 begin
            state <= grn_yell;
            count <= grn_yell_count;
         end
        else
	 begin
	   red = 0;
           yellow = 0;
           green = 1;
            count <= count - 1;
         end
		end

      grn_yell : begin
        if (count == 0)
	 begin
            state <= rd;
            count <= rd_count ;
         end
        else
	 begin
	   red = 0;           
           yellow = 1;
           green = 1;
            count <= count - 1;
         end
		end

      default:
        begin
          red = 1;
          yellow = 0;
          green = 0;
          count = rd_count;
          state <= rd;
        end
    endcase
  end
endmodule

