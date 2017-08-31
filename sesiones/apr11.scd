(

~rhythm1={Impulse.kr(
   ~tempo.kr * LFPulse.kr( ~tempo.kr/[2,3,5], [0,2,6] / 8, [3,2,1] / 8, [1,2,1.5], [0,3,1]/6 )
)};

~rhythm2={Impulse.kr(
   ~tempo.kr * LFPulse.kr( ~tempo.kr/[2,3,4], [0,2,6,7] / 8, [5,3,2,1] / 8, [1,2,4], [0,2,3,7]/4 )
)};

~z[0] = {
   RLPF.ar(
      WhiteNoise.ar,
      ([0,3,6,9,12,15,14]+52).midicps,
      1/200
   )
   *
   Decay2.kr(
      ~rhythm1.kr,
      0.5,
      0.6
   ) ! 2
};

~z[1] = \filter -> {|in| ((in*125).tanh / 8) + in };
)

(
~btk[0] = {
   (   SinOsc.ar([60,Array.exprand(7,300,1400),Array.exprand(7,3200,8400)],0,[1,1/2,1/8])
   +
   WhiteNoise.ar/8
   *
   Decay2.kr(
      ~rhythm1.kr + Impulse.kr(~tempo.kr*LFPulse.kr(~tempo.kr/4,0,1/4,2,1)),
      0.02,
      [0.15,3/4]
   ) * [1,1/4] * 12 ! 2 ).tanh / 8
};
)

~btk = ~btk[0]

//~btk[0] = 0
~btk[1] = { CaosKick.robot(t:~tempo.kr / 2 , tp: [0,1,2,5,9]/16, lowcutfreq: 80, dur: 1/10)   ! 2 }
~btk[2] = { CaosSnare.robot(t:~tempo.kr, tp: [0,6,8]/16) * 2  ! 2 }
~btk[3] = { CaosHats.robot(t:~tempo.kr*4, tp: [0,6,8]/16)   ! 2 }
~btk[4] = \filter -> {|in| FreeVerb.ar(in,2/3,3/4)/3 + in };
~btk[5] = \filter -> {|in| (((in*1225).tanh / 3) + in*3/4 + FreeVerb.ar(in,2/3,3/4)/4 ).tanh * 2 };


//~btk[1] = \filter -> {|in| ((in*5225).tanh / 1.5) + in + FreeVerb.ar(in,2/3,3/4) };

)

(

   ~btk[6] = {
   Resonz.ar(
      (   SinOsc.ar([60,Array.exprand(7,300,1400),Array.exprand(7,3200,8400)],0,[1,1/2,1/8])
      +
      WhiteNoise.ar/8
      *
      Decay2.kr(
         ~rhythm1.kr + Impulse.kr(~tempo.kr*LFPulse.kr(~tempo.kr/4,0,1/4,2,1)),
         0.02,
         [0.15,3/4]
      ) * [1,1/4] * 2226 ! 2 ).tanh / 8
      ,
      ([0,3,6,9,12,15,14]+76).midicps,
      1/8

   )
   };

)



~btk.fadeTime = 0
~mix = ~z
~mix = ~z + ~btk
~mix = ~btk
