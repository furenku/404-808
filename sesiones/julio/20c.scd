~mix = ~drmzzzz
~out.play
k=CaosKick;
h=CaosHats;
s=CaosSnare;

~drmzzzz.quant_(4);

~lfo1 = { SinOsc.kr(~tempo.kr/8,0,(~lfo2.kr*3)*(1/2),(~lfo2.kr*3)*(0.5)) * 0.1}
~lfo2 = { SinOsc.kr(~tempo.kr/16,0,1/2,1/2)*0.1 }

~faktor=1/4
~faktorr=1/[4,16]
~drmzzzz.quant_(4);
~drmzzzz[2] = { (k.robot(t:~faktor*~tempo.kr*[1,2,4], rel:~faktorr.reciprocal*1/[3,9],att:[0.01,1/4,0.06])*1/[33,1,3]).tanh / 2 ! 2 };
~drmzzzz[2] = { (h.robot(t:~faktor*~tempo.kr*[1,2,4], tp:[0,2,4]/8, rel:~faktorr.reciprocal*1/10,att:0.01)*[13,1,0.6]).tanh ! 2 };
~drmzzzz[4] = 0;//{ (s.robot(t:~faktorr*~tempo.kr/[1,2], tp:[3,7]/8, rel:~faktorr.reciprocal*1/3,att:0.01)*(1/[13,2,0.8,4])).tanh ! 2 };
~drmzzzz[0] = 0;
~drmzzzz[1] = 0;
Tdef(\cambiarbtk).stop
(

   Tdef(\cambiarbtk,{inf.do{|i|
      ~drmzzzz[0] = { [k,h,s].choose.robot(t:~tempo.kr*[1,2], rel:1/6) ! 2 };
      ~drmzzzz[1] = { [k,h,s].choose.robot(t:~tempo.kr/[2,4],tp:[3,5]/8, rel:1/6) ! 2 };
      /*~drmzz = 0;//{ ([k,h,s].choose.robot(t:~tempo.kr/6, tp: [0,7]/16, rel: ~lfo1.kr )*((~lfo2.kr+3)*3)).tanh ! 2 };*/
      /*~drmzz[1] = { ([k,h,s].choose.robot(t:~tempo.kr/8, tp: [1,3,5,6,7]/8, rel: ~lfo1.kr )*((~lfo2.kr+3)*3)).tanh ! 2 };*/
      /*~drmzz[2] = { ([k,h,s].choose.robot(t:~tempo.kr/2, tp: [7,11]/16, rel: ~lfo1.kr )*((~lfo2.kr+3)*3)).tanh ! 2 };*/
      /*
      ~drmzz[0] = { [k,h,s].choose.robot(t:1/[4,6]*LFPulse.kr(~tempo.kr/4,1/8,2/16,1,[1,2]), tp: [2,3]/16) ! 2 };
      ~drmzz[1] = { [k,h,s].choose.robot(t:1/[4,6]*LFPulse.kr(~tempo.kr/6,1/8,4/16,1,[1,4]), tp: [4,6]/16) ! 2 };
      ~drmzz[2] = { [k,h,s].choose.robot(t:1/[4,6]*LFPulse.kr(~tempo.kr/8,1/8,6/16,1,[1,6]), tp: [6,9]/16) ! 2 };
      ~drmzz[3] = { [k,h,s].choose.robot(t:1/[4,6]*LFPulse.kr(~tempo.kr/10,1/8,8/16,1,[1,8]), tp: [8,12]/16) ! 2 };
      ~drmzz[4] = { k.robot(t:1/[2,3], tp: [8,12]/16) ! 2 };
      ~drmzz[7] = { k.robot(t:1/[2,3], tp: [8,12]/16) ! 2 };*/
      /*~drmzz[4] = { (k.robot(t:1/[2,3], tp: [8,12]/16) *3 ).wrap ! 2 };*/
      "do".postln;
      2.wait;
   }}).play;
)
