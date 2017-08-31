p=LFPulse;
o=SinOsc;
~multosc = 8;
~z[0] = { (LFPulse.ar(LFPulse.kr(~tempo.kr/8,1/8,1/16,7,0)+36.midicps,SinOsc.kr(~tempo.kr/(4*~multosc),0,4/5,1/2),SinOsc.kr(~tempo.kr/(6*~multosc),0,4/5,1/2))*300).tanh };
~z[1] = { (LFPulse.ar(LFPulse.kr(~tempo.kr/8,3/8,1/16,12,0)+24.midicps,SinOsc.kr(~tempo.kr/(4*~multosc),0,4/5,1/2),SinOsc.kr(~tempo.kr/(6*~multosc),0,4/5,1/2))*300).tanh };

~z[2] = { (LFPulse.ar(LFPulse.kr(~tempo.kr/8,5/8,1/16,24,0)+(36+12+[3,6,8,15]).midicps,SinOsc.kr(~tempo.kr/(4*~multosc),0,4/5,1/2),SinOsc.kr(~tempo.kr/(3*~multosc),0,4/5,1/2))*30).tanh / 2  ! 1 };
~z[3] = { (LFPulse.ar(LFPulse.kr(~tempo.kr*8,7/8,3/16,5,0)+(43+12+[3,6,8,15]).midicps,SinOsc.kr(~tempo.kr/(4*~multosc),0,4/5,1/2),SinOsc.kr(~tempo.kr/(3*~multosc),0,4/5,1/2))*3330).tanh  ! 1 }
~z[0] = 0;
~z[1] = 0;
~z[2] = 0;

~z[4] = \filter -> {|in| FreeVerb.ar(in, SinOsc.kr(~tempo.kr/16,0,4/5,1/2))}

~z[5] = \filter -> {|in| (in*30).tanh}
~z.fadeTime = 30;

~mix = ~z;
~mix = ~z + ~btk;

~btk[0] = { CaosKick.robot(t:~tempo.kr/([8,12]/2), rel: 2, modFreq:[1/2,1/4]) * 3 ! 1 };
~btk[1] = { CaosHats.robot(t:~tempo.kr/([8,12]/2), tp: [0,3,4,6,7,9,10,12,13]/16,rel: 2, modFreq:[1/2,1/4]) * 3 ! 1 };
~btk[2] = { CaosSnare.robot(t:~tempo.kr/([8,12]/2), tp: [1/2,12/16],rel: 2, modFreq:[1/2,1/4]) * 3 ! 1 };

~btk.fadeTime= 3;
~btk[3] = \filter -> {|in| (in * 300).tanh }
~btk[3] = \filter -> {|in| (RLPF.ar((in * 300).tanh,[300,350,455,999]*SinOsc.kr(~tempo.kr/(4*~multosc),0,4/5,1/2),SinOsc.kr(~tempo.kr/(6*~multosc*0.05),0,4/5,1/2),1/100)*300).tanh }
~btk[3] = 0;
(


   ~mix = ~z + ~btk;
~z[0] = { (LFPulse.ar(LFPulse.kr(~tempo.kr/8,1/8,1/16,7,0)+36.midicps,SinOsc.kr(~tempo.kr/(4*~multosc),0,4/5,1/2),SinOsc.kr(~tempo.kr/(6*~multosc),0,4/5,1/2))*300).tanh };
~z[1] = { (LFPulse.ar(LFPulse.kr(~tempo.kr/8,3/8,1/16,12,0)+24.midicps,SinOsc.kr(~tempo.kr/(4*~multosc),0,4/5,1/2),SinOsc.kr(~tempo.kr/(6*~multosc),0,4/5,1/2))*300).tanh };
~z[2] = { (LFPulse.ar(LFPulse.kr(~tempo.kr/8,5/8,1/16,24,0)+(36+12+[3,6,8,15]).midicps,SinOsc.kr(~tempo.kr/(4*~multosc),0,4/5,1/2),SinOsc.kr(~tempo.kr/(3*~multosc),0,4/5,1/2))*30).tanh / 2  ! 1 };
~z[3] = 0;
~btk[0] = { CaosKick.robot(t:~tempo.kr/[1,2], rel: 0.3, modFreq:[1/2,1/4]) * 3 ! 1 };
~btk[1] = { CaosHats.robot(t:~tempo.kr/[1,2], tp: [0,3,4,6,7,9,10,12,13]/16,rel: 0.2, modFreq:[1/2,1/4]) * 3 ! 1 };
~btk[2] = { CaosSnare.robot(t:~tempo.kr/[2,3], tp: [1/2,12/16],rel: 0.2, modFreq:[1/2,1/4]) * 3 ! 1 };
)
~btk[5] = \filter -> {|in|( FreeVerb.ar(in, SinOsc.kr(~tempo.kr/16,0,4/5,1/2)+0.2)*3).tanh}

~mix = ~z + ~btk;
~mix = ~z;
~btk[3] = 0;
~mix = ~btk;

~mix = ~z
~z[6] = \filter -> {|in| FreeVerb.ar(in, in, in )}
Tdef(\multosc,{
   inf.do{|i|
      /*~multosc = ((i%6)+1)*1;*/
      ~multosc = ((i%6)+1);
      (166/60).reciprocal.wait;
   }
   }).play;
