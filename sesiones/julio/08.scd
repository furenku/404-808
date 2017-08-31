(
   b=Pbind(
   \dur, Pseq([1,2],inf)*3,
   \degree, Pseq([2,9,\rest,4,\rest,\rest,9],inf),
   \octave, 2
   )
   )


(
   ~z[0] = {|freq|
      (Ringz.ar(
         Impulse.ar(~tempo.kr),
         freq * [1,2] * ~pulse.kr,
         16
      )*32).tanh / 3
      !2
   };
)

~pulse = { LFPulse.kr(~tempo.kr*SinOsc.kr(~tempo.kr/32,0,20,30),0,1/16,[2,1/3,7],[2,3,5,7]) }

(
   ~z[0] = {|freq|
      (Ringz.ar(
         Impulse.ar(~tempo.kr),
         freq * [1,2] * ~pulse.kr,
         1
      )*2).tanh / 3
      !2
   };
)

~z.fadeTime=4
~z.quant=4


~mix = ~z


~z[1] = \set -> b;




~mix = ~z + ~btk
//~btk.quant_(4)
(
   ~btk[0] = {
   CaosKick.robot(t:~tempo.kr/16,rel:3)
};
~btk[1] = {
   (CaosKick.robot(t:~tempo.kr/[1,1.5,2],rel:1/4) * [4,1,2]/2).tanh
!2};
~btk[2] = {
   CaosHats.robot(t:~tempo.kr/8,tp:[0,3,5,8,9,11,14,15]/16,rel:1/4) ! 2
};
)

(
   ~btk[0]=0;
   ~btk[2]=0;
)

~mix = ~btk + ~z
~mix =  ~z

~btk[3] = \filter -> {|in| (RLPF.ar(FreeVerb.ar(in,2/3,2/3),[300,330] * ~pulse.kr,0.1) + in ) / 1.5}
~btk[3] = \filter -> {|in| (in*10).tanh }
~btk[3] = 0;
~btk.fadeTime=6

~z[3] = \filter -> {|in| (RLPF.ar(FreeVerb.ar(in,1,1),[300,330] * ~pulse.kr,0.1) ).tanh / 2 }


~mix.fadeTime = 30
~mix = 0
