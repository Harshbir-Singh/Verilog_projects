module inverter(out,in);
  input in;
  output out;
  supply1 vdd;
  supply0 gnd;

  pmos P(out,vdd,in);
  nmos n(out,gnd,in);
endmodule


module testbench;
  reg in;
  wire out;
  supply1 vdd;  
  supply0 gnd;

  inverter test(out,in);

  initial in = 0;

  initial
    begin
      
      $monitor("At input = %d, Output = %d",in,out);
      #2 in = 0;
      #2 in = 1;
      
      #2 $finish;
    end

endmodule