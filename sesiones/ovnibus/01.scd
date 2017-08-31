(
   ~z = {
   (Resonz.ar(
      WhiteNoise.ar(),
      (LFPulse.kr(~tempo.kr/32,0,1/3,-7,0) +LFPulse.kr(~tempo.kr/4,0,1/8,7,0)+60+[0,3,7,11,15,17]).midicps,
      0.01
   ) * 30).tanh / 2
};
   ~z[1] = {
   (Resonz.ar(
      WhiteNoise.ar(),
      (LFPulse.kr(~tempo.kr/32,0,1/3,-7,0) +LFPulse.kr(~tempo.kr/8,0,1/16,7,0)+36+[0,3,7,11,15,17]).midicps,
      0.01
   ) * 330).tanh / 3
};
   ~z[2] = {
   (Resonz.ar(
      WhiteNoise.ar(),
      (LFPulse.kr(~tempo.kr/32,0,1/3,-7,0) +LFPulse.kr(~tempo.kr/16,0,1/8,7,0)+48+LFPulse.kr(~tempo.kr/16,0,1/8,3,0)+[0,3,7,11,15,17]).midicps,
      0.001
   ) * 3300).tanh / 6
};


)


~z[4] = \filter -> {|in|
   ((2)* (in * Decay2.kr(Impulse.kr(~tempo.kr /  [1,2,3,6, 8 ], [0,4,5,7] / 8), 0.2, 0.5)).tanh ! 2)
}

p.makeTempoClock( ((11.111) / 4 )/ 60 );
~z.fadeTime = 0;

//p.makeTempoClock( (166.666/4) / 60 );
~btk=0;

~btk[0] = { CaosHats.robot(t: ~tempo.kr/8, tp: [0,3,5,7,9,11,14,15]/ 16) ! 2 };
~btk[1] = { CaosKick.robot(t: ~tempo.kr/3, tp: [0,3,5,7,9,11,14,15]/ 16, dur: 0.2) ! 2 };
~btk[2] = { ((CaosKick.robot(t: ~tempo.kr/2, tp: [0,3,5,7,9,11,14,15]/ 16, dur: 0.1 ) ! 2 ) * 30 ).tanh / 8};
~btk[3] = { ((CaosKick.robot(t: ~tempo.kr/16, tp: 3/16, dur: 4 ) ! 2 ) * 300 ).tanh};
~btk[4] = { ((CaosKick.robot(t: ~tempo.kr/16, tp: 3/16, dur: 4 ) ! 2 ) * 300 ).tanh / 2};
~btk[4] = { ((CaosKick.robot(t: ~tempo.kr , dur: 1/10 ) ! 2 ) * 2 ).tanh / 1 };
~btk[5] = { ((CaosSnare.robot(t: ~tempo.kr/4, tp: [8,13]/16 ) ! 2 ) ).tanh  };
~btk[6] = { ((CaosKick.robot(t: ~tempo.kr*2, tp: [8,13]/16, dur: 0.6 ) ! 2 ) ).tanh  };

(
~btk = 0

~btk[7] = 0
~btk[7] = \filter -> {|in|RLPF.ar( FreeVerb.ar( (in* 1 ).tanh , 1, 1 ) * 4, 330, 0.01 ) / 4  + in/2  };

~z = 0
~z.fadeTime = 30;
~btk.fadeTime = 0;


)
~mix = ~z
~mix = ~z + ~btk
~mix = ~btk

~mix =
