~mix = ~z;
(
~z = {
(   RLPF.ar(WhiteNoise.ar,
      72+[0,3,7,8].midicps,
      1/20)
      * 20).tanh
      * 1
   * SinOsc.kr( ~tempo.kr/[6,8,12,15], 0, 0.3,0.6)
       ! 2
}
)
(
~z = {
((   Resonz.ar(WhiteNoise.ar,
      (72+[0,3,7,8]).midicps,
      1/20)
      * 2).tanh

   * LFPulse.kr(~tempo.kr/4,1/[16,24,32,8],[0,3,6,8]/16)
   * SinOsc.kr( ~tempo.kr/[6,8,12,15], 0, 0.3,0.6))
       ! 2
}
)

~z.fadeTime = 1



~mix = ~z + ~btk

~btk[0] = { CaosKick.robot(t:~tempo.kr/4,att:3,rel:4)};
~btk[0] = 0
~btk[1] = { CaosKick.robot(t:~tempo.kr,tp:[0,3,6,8]/12, rel: 0.1) ! 2 * 4 };
~btk[2] = { CaosHats.robot(t:~tempo.kr / 4, tp: [1,3,5,7,9,11,12,15]/16) / 2 ! 2}
~btk[3] = { CaosKick.robot(t:~tempo.kr*2)} * 3;
~btk[4] = { CaosSnare.robot(t:~tempo.kr/2, tp: 1/2)};

~mix = ~btk;
~mix = ~z;
p.makeTempoClock( 40 / 60 );

~btk[5] = \filter -> {|in| FreeVerb.ar(in, 1/2, 2/3 ) + in };
~btk[5] = 0//\filter -> {|in| FreeVerb.ar(in, 1/2, 2/3 ) + in };
