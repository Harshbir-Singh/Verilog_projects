module OpAmp(Out,INin,NINin,Vp,Vn);
  
  input wire  INin,NINin,Vp,Vn;
  output reg  Out;
  
  
  parameter Gain = 100000;
  integer  tempout;
  always@(*)
    begin
      
      tempout = Gain*(INin-NINin);
      if(tempout>Vp)
        Out = Vp;
      else if(tempout<Vn)
        Out = Vn;

      else
        Out = tempout;
    end


endmodule
