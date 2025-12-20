`timescale 1ns/1ns
module piso_tb;
reg clk;
reg reset;
reg load;
reg [3:0]pin;
wire sout;
piso dut(clk, reset, load, pin, sout);
initial begin
    clk = 0;
    reset = 0;
    forever #5 clk = ~clk;
end
initial begin
    repeat (5) begin
        pin = $urandom_range(4'h1,4'hf);
        load = 1; #10;
        load =0; #40;
    end
    reset = 1; #25;
    reset = 0;
    repeat (5) begin
        pin = $urandom_range(4'h1,4'hf);
        load = 1; #10;
        load =0; #40;
    end
    $finish;
end
initial begin
    $printtimescale;
    $monitor($time,"clk=%b reset=%b load=%b pin3=%b pin2=%b pin1=%b pin0=%b sout=%b", clk, reset, load, pin[3], pin[2], pin[1], pin[0], sout);
    $dumpfile("piso.vcd");
    $dumpvars(0,piso_tb);
end
endmodule



/*
* OUTPUT WAVEFORM LINK
* https://drive.google.com/file/d/1otFBIYAkacLaSeV_2Kl2RdfUpAffjceL/view?usp=sharing
*
* OUTPUT
Time scale of (piso_tb) is 1ns / 1ns
VCD info: dumpfile piso.vcd opened for output.
                   0clk=0 reset=0 load=1 pin3=1 pin2=0 pin1=0 pin0=1 sout=x
                   5clk=1 reset=0 load=1 pin3=1 pin2=0 pin1=0 pin0=1 sout=1
                  10clk=0 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=1 sout=1
                  15clk=1 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=1 sout=1
                  20clk=0 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=1 sout=1
                  25clk=1 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=1 sout=0
                  30clk=0 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=1 sout=0
                  35clk=1 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=1 sout=0
                  40clk=0 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=1 sout=0
                  45clk=1 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=1 sout=1
                  50clk=0 reset=0 load=1 pin3=0 pin2=1 pin1=0 pin0=0 sout=1
                  55clk=1 reset=0 load=1 pin3=0 pin2=1 pin1=0 pin0=0 sout=0
                  60clk=0 reset=0 load=0 pin3=0 pin2=1 pin1=0 pin0=0 sout=0
                  65clk=1 reset=0 load=0 pin3=0 pin2=1 pin1=0 pin0=0 sout=0
                  70clk=0 reset=0 load=0 pin3=0 pin2=1 pin1=0 pin0=0 sout=0
                  75clk=1 reset=0 load=0 pin3=0 pin2=1 pin1=0 pin0=0 sout=0
                  80clk=0 reset=0 load=0 pin3=0 pin2=1 pin1=0 pin0=0 sout=0
                  85clk=1 reset=0 load=0 pin3=0 pin2=1 pin1=0 pin0=0 sout=1
                  90clk=0 reset=0 load=0 pin3=0 pin2=1 pin1=0 pin0=0 sout=1
                  95clk=1 reset=0 load=0 pin3=0 pin2=1 pin1=0 pin0=0 sout=0
                 100clk=0 reset=0 load=1 pin3=0 pin2=0 pin1=0 pin0=1 sout=0
                 105clk=1 reset=0 load=1 pin3=0 pin2=0 pin1=0 pin0=1 sout=1
                 110clk=0 reset=0 load=0 pin3=0 pin2=0 pin1=0 pin0=1 sout=1
                 115clk=1 reset=0 load=0 pin3=0 pin2=0 pin1=0 pin0=1 sout=1
                 120clk=0 reset=0 load=0 pin3=0 pin2=0 pin1=0 pin0=1 sout=1
                 125clk=1 reset=0 load=0 pin3=0 pin2=0 pin1=0 pin0=1 sout=0
                 130clk=0 reset=0 load=0 pin3=0 pin2=0 pin1=0 pin0=1 sout=0
                 135clk=1 reset=0 load=0 pin3=0 pin2=0 pin1=0 pin0=1 sout=0
                 140clk=0 reset=0 load=0 pin3=0 pin2=0 pin1=0 pin0=1 sout=0
                 145clk=1 reset=0 load=0 pin3=0 pin2=0 pin1=0 pin0=1 sout=0
                 150clk=0 reset=0 load=1 pin3=0 pin2=0 pin1=1 pin0=1 sout=0
                 155clk=1 reset=0 load=1 pin3=0 pin2=0 pin1=1 pin0=1 sout=1
                 160clk=0 reset=0 load=0 pin3=0 pin2=0 pin1=1 pin0=1 sout=1
                 165clk=1 reset=0 load=0 pin3=0 pin2=0 pin1=1 pin0=1 sout=1
                 170clk=0 reset=0 load=0 pin3=0 pin2=0 pin1=1 pin0=1 sout=1
                 175clk=1 reset=0 load=0 pin3=0 pin2=0 pin1=1 pin0=1 sout=1
                 180clk=0 reset=0 load=0 pin3=0 pin2=0 pin1=1 pin0=1 sout=1
                 185clk=1 reset=0 load=0 pin3=0 pin2=0 pin1=1 pin0=1 sout=0
                 190clk=0 reset=0 load=0 pin3=0 pin2=0 pin1=1 pin0=1 sout=0
                 195clk=1 reset=0 load=0 pin3=0 pin2=0 pin1=1 pin0=1 sout=0
                 200clk=0 reset=0 load=1 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 205clk=1 reset=0 load=1 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 210clk=0 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 215clk=1 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 220clk=0 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 225clk=1 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 230clk=0 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 235clk=1 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 240clk=0 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 245clk=1 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=1
                 250clk=0 reset=1 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=1
                 255clk=1 reset=1 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 260clk=0 reset=1 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 265clk=1 reset=1 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 270clk=0 reset=1 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 275clk=1 reset=0 load=1 pin3=1 pin2=1 pin1=0 pin0=0 sout=0
                 280clk=0 reset=0 load=1 pin3=1 pin2=1 pin1=0 pin0=0 sout=0
                 285clk=1 reset=0 load=0 pin3=1 pin2=1 pin1=0 pin0=0 sout=0
                 290clk=0 reset=0 load=0 pin3=1 pin2=1 pin1=0 pin0=0 sout=0
                 295clk=1 reset=0 load=0 pin3=1 pin2=1 pin1=0 pin0=0 sout=0
                 300clk=0 reset=0 load=0 pin3=1 pin2=1 pin1=0 pin0=0 sout=0
                 305clk=1 reset=0 load=0 pin3=1 pin2=1 pin1=0 pin0=0 sout=1
                 310clk=0 reset=0 load=0 pin3=1 pin2=1 pin1=0 pin0=0 sout=1
                 315clk=1 reset=0 load=0 pin3=1 pin2=1 pin1=0 pin0=0 sout=1
                 320clk=0 reset=0 load=0 pin3=1 pin2=1 pin1=0 pin0=0 sout=1
                 325clk=1 reset=0 load=1 pin3=0 pin2=0 pin1=1 pin0=1 sout=1
                 330clk=0 reset=0 load=1 pin3=0 pin2=0 pin1=1 pin0=1 sout=1
                 335clk=1 reset=0 load=0 pin3=0 pin2=0 pin1=1 pin0=1 sout=1
                 340clk=0 reset=0 load=0 pin3=0 pin2=0 pin1=1 pin0=1 sout=1
                 345clk=1 reset=0 load=0 pin3=0 pin2=0 pin1=1 pin0=1 sout=1
                 350clk=0 reset=0 load=0 pin3=0 pin2=0 pin1=1 pin0=1 sout=1
                 355clk=1 reset=0 load=0 pin3=0 pin2=0 pin1=1 pin0=1 sout=0
                 360clk=0 reset=0 load=0 pin3=0 pin2=0 pin1=1 pin0=1 sout=0
                 365clk=1 reset=0 load=0 pin3=0 pin2=0 pin1=1 pin0=1 sout=0
                 370clk=0 reset=0 load=0 pin3=0 pin2=0 pin1=1 pin0=1 sout=0
                 375clk=1 reset=0 load=1 pin3=0 pin2=0 pin1=0 pin0=1 sout=1
                 380clk=0 reset=0 load=1 pin3=0 pin2=0 pin1=0 pin0=1 sout=1
                 385clk=1 reset=0 load=0 pin3=0 pin2=0 pin1=0 pin0=1 sout=1
                 390clk=0 reset=0 load=0 pin3=0 pin2=0 pin1=0 pin0=1 sout=1
                 395clk=1 reset=0 load=0 pin3=0 pin2=0 pin1=0 pin0=1 sout=0
                 400clk=0 reset=0 load=0 pin3=0 pin2=0 pin1=0 pin0=1 sout=0
                 405clk=1 reset=0 load=0 pin3=0 pin2=0 pin1=0 pin0=1 sout=0
                 410clk=0 reset=0 load=0 pin3=0 pin2=0 pin1=0 pin0=1 sout=0
                 415clk=1 reset=0 load=0 pin3=0 pin2=0 pin1=0 pin0=1 sout=0
                 420clk=0 reset=0 load=0 pin3=0 pin2=0 pin1=0 pin0=1 sout=0
                 425clk=1 reset=0 load=1 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 430clk=0 reset=0 load=1 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 435clk=1 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 440clk=0 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 445clk=1 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 450clk=0 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 455clk=1 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 460clk=0 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 465clk=1 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=1
                 470clk=0 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=1
                 475clk=1 reset=0 load=1 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 480clk=0 reset=0 load=1 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 485clk=1 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 490clk=0 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 495clk=1 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 500clk=0 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 505clk=1 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 510clk=0 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=0
                 515clk=1 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=1
                 520clk=0 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=1
piso_tb.v:27: $finish called at 525 (1ns)
                 525clk=1 reset=0 load=0 pin3=1 pin2=0 pin1=0 pin0=0 sout=0

* 
*/
