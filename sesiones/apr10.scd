
~z[0] = {(
RLPF.ar(
   WhiteNoise.ar * Dust.kr(~tempo.kr*16),
   [53,57,51,62,38].midicps * LFPulse.ar(~tempo.kr/8,0,1/[8,3,16],1,[2,1/3,1/2]),
   1/1000
) * 1).tanh / 2 ! 2
};

~z[1] = {
(
   RLPF.ar(
   WhiteNoise.ar * Impulse.kr(~tempo.kr/[2,3],[0,3,5,7,11,13]/16),
   ([53,57,51,62,38]-12).midicps * LFPulse.ar(~tempo.kr/8,0,1/[8,6],1,[2,1/2]),
   1/200
)
*20 ).tanh / 8 ! 2
};

~z[2] = {
(
   RLPF.ar(
   WhiteNoise.ar * Decay2.kr(Impulse.kr(~tempo.kr/[2,8,12],[0,3,5,7,11,13]/16),1,[1/3,3,4]),
   ([53,57,51,62,38]+[0,19,24]).midicps * LFPulse.ar(~tempo.kr/8,0,1/[8,6],1,[2,1/4]),
   1/200
)
*20 ).tanh / 8 ! 2
};


~z[0]=0
~z[1]=0

~z[3] = \filter -> {|in| FreeVerb.ar( in, 1,1 )+ in/2}

)
~z.fadeTime=0


~btk[0] = {
   CaosKick.robot(
      t: ~tempo.kr*2
   ) ! 2
}

~btk[1] = {
   CaosKick.robot(
      t: ~tempo.kr/[2,3],
      tp:1/2
   ) ! 2 / 8
}

~btk[4] = {
   CaosKick.robot(
      t: ~tempo.kr*[2,3],
      tp:1/2
   ) ! 2 / 8
}

~btk[2] = {
   CaosHats.robot(
      t: ~tempo.kr/[2,3],
      tp: [0,4,5,6,8,12,14,15]/16
   ) ! 2 / 3
};

~btk[3] = {
   CaosSnare.robot(
      t: ~tempo.kr/[1,2,3],
      tp: 1/2
   ) ! 2
}
~btk[0] = {
   (SinOsc.ar(60) + WhiteNoise.ar(1/8)
   * Decay2.kr(Impulse.kr(~tempo.kr/LFPulse.kr(~tempo.kr/3,0,1/8,0.25,2)),0.01,0.18)*1.1).tanh
};
~btk[1] = {
(   SinOsc.ar(([53,57,51,62,38]+12).midicps * LFPulse.ar(~tempo.kr/8,0,1/[8,6],1,[2,1/2]),) + WhiteNoise.ar(1/8)
   * Decay2.kr(Impulse.kr(~tempo.kr/2, [0,2,5,8,9]/16),0.001,0.08)
*155).tanh/36};

~btk[2] = {
   (SinOsc.ar(Array.exprand(11,300,8500)) + WhiteNoise.ar(1/8)
   * Decay2.kr(Impulse.kr(~tempo.kr/2, [0,3,5,8,9]/16),0.01,0.18) ! 1 *88444).tanh / 778
};


~btk = ~btk[0]
~btk[5] = \filter -> {|in| ((in*130).tanh * 0.36 ) + in + FreeVerb.ar(in,1/2,1/3) }


~mix = ~btk
~mix = ~btk + ~z
~mix = ~z

~mix.fadeTime=20

~mix = 0
