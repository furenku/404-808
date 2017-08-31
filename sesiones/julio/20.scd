~z.fadeTime=1;
(
   ~faktor=1/2;
~z[0] = {|notes=#[0,3,7,10]| SinOsc.ar(LFPulse.kr(Impulse.kr(~tempo.kr/4),1/8,2/16,1,2)*([60,48,55]+notes).midicps,0,SinOsc.kr(~tempo.kr/4,0,6+6.1)).tanh / 4 !2 };
~z[1] = {|notes=#[0,3,7,10]| SinOsc.ar(LFPulse.kr(Impulse.kr(~tempo.kr/4),1/8,6/16,1,3)*([60,48,55]+notes).midicps,0,SinOsc.kr(~tempo.kr/6,0,9+9.1)).tanh / 4 !2 };
~z[2] = {|notes=#[0,3,7,10]| SinOsc.ar(LFPulse.kr(Impulse.kr(~tempo.kr/4),1/8,10/16,1,4)*([60,48,55]+notes).midicps,0,SinOsc.kr(~tempo.kr/8,0,12+12.1)).tanh / 4 !2 };
)

~z[3] = \filter -> {|in| (in*330).tanh/2 }
~faktor=1/4;
~z[3] = \filter -> {|in| FreeVerb.ar(in,1,1) }
~z[3] = 0;

~mix = ~z + ~btk;

~mix = 0;

~btk.quant_(4);
~faktor = {
   1/Stepper.kr(Impulse.kr(~tempo.kr/8),0,1,6,1)*[2,3];
};

~mix = ~z
~faktor=2;
~btk.fadeTime=0;
~btk[5]=0;

~btk[0] = { CaosKick.robot(t:~faktor*~tempo.kr/[6,8],rel:[2,3]).tanh};
~btk[1] = { CaosHats.robot(t:~faktor*~tempo.kr/[6,8],rel:2*[2,3]).tanh / 3};

~btk[2] = { (CaosKick.robot(t:~faktor*~tempo.kr/[2,3],tp:[0,3,5]/8,rel:1/[2,3])*4).tanh!2};
~btk[3] = { CaosHats.robot(t:~faktor*~tempo.kr/[2,4],tp:[0,2,4,6,8,10]/16,rel:1/[2,3]).tanh!2};
~btk[4] = { CaosSnare.robot(t:~faktor*~tempo.kr/[6,8],tp:[8,13]/16,rel:1/[2,3]).tanh!2};
~btk[5] = \filter -> {|in| FreeVerb.ar(RLPF.ar(in,100+(LFNoise2.kr(~tempo.kr/16)*3000),0.2),1,1) }
~btk.fadeTime = 10;
~mix.fadeTime = 20;

~mix = ~z + ~btk

(
   ~mix = ~btk
   c=[
   [0,3,7,10],
   [2,5,9,12],
   [7,10,14,17],
   ];
   Tdef(\prog,{
   inf.do{
      ~z.setn(\notes,c.choose);
      [2,4,6].choose.wait;
   }
}).play;
)
