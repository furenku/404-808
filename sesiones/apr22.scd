(
   ~z[0] = {
      var e = SinOsc.kr(~tempo.kr/8,0,1/6,1/2);
   RLPF.ar(
      WhiteNoise.ar,
      [330,375],
      1-e
   )
   *
   e
};
   ~z[1] = {
      var e = SinOsc.kr(~tempo.kr/3,0,1/6,1/2);
   RLPF.ar(
      WhiteNoise.ar,
      [330,375]*1.5,
      1-e
   )
   *
   e
};
   ~z[2] = {
      var e = SinOsc.kr(~tempo.kr/3,0,1/6,1/2);
   RLPF.ar(
      WhiteNoise.ar,
      [330,375]*LFPulse.kr(~tempo.kr/8,1/[6,8],[0,3,5,7]/16, (2..5), 1),
      1-e
   )
   *
   e
};

)


~btk[0] = {

   ~z.ar
   *
   Decay2.kr(CoinGate.kr(
      [3/4,1/8],
      Impulse.kr(~tempo.kr*[2,4])
      ),1/20,1/8)
}

~btk = 0

~btk[1] = {

   CaosKick.robot(t:~tempo.kr/[2,3],tp:1/[1,2]) ! 2
};

~btk[1] = {

   CaosKick.robot(t:~tempo.kr*[2,3],tp:1/[1,2]) ! 2
};
~btk[2] = {

   CaosHats.robot(t:~tempo.kr/2,tp:[0,3,5,7]/16) / 3 ! 2
};
~btk[3] = {

   CaosSnare.robot(t:~tempo.kr/3,tp:[8,12]/16) /  3! 2
};

~btk[6] = \filter -> {|in| (in*12).tanh / 4 }

~bass = {
   MoogFF.ar(~z.ar,
   ([36,48] + [0,3,7,12,13]).midicps
   *
   LFPulse.kr(~tempo.kr/8,1/32,[0,3,4,7,12]/16)
   ,
   3.9)
   ! 2
}
~bass[0] = 0
~bass[1] = 0
~bass[1] = {
   RLPF.ar(
      WhiteNoise.ar,
   ([36,48] + [0,3,7,12,19]).midicps
   ,
   1/100)
   *
   LFPulse.kr(~tempo.kr/8,1/32,[0,3,4,7,12]/16)

   / 2
   ! 2
}
~bass[2] = {
   ((SinOsc.ar(([36,48] + [0,3,5,7,12,19]).midicps)
   *
   LFPulse.kr(~tempo.kr/[2,4,6,8],1/32,[0,3,4,7,12]/16)

   / 2
   ! 2)*300).tanh / 5
}


~bass.fadeTime = 20


~z.fadeTime = 30;

~out.play

~zz = {
(   Resonz.ar(
      FreeVerb.ar(~z.ar * Impulse.kr(~tempo.kr*8) * 45, 1/2,2/3).tanh / 2
      +
      FreeVerb.ar(~z.ar * Dust.kr(~tempo.kr*8) * 45, 1/2,2/3).tanh / 2,
   ([12,19]+[36,48] + [0,3,7,12,13]).midicps,
   1/50
   ) * 45).tanh
}

~mix = {~z.ar / 3 + (~btk.ar*23).tanh / 2 }
~mix = {~z.ar / 3 +( (~btk.ar*23).tanh / 2)  + (~bass.ar / 8) }
~mix = ~bass + ~btk
~mix = ~bass + ~btk + ~btk2
~mix = ~bass + ~zz
~mix = ~zz
~mix = ~zz + ~btk + ~btk2
~mix = ~btk2

~btk[7] = \filter -> {|in| (in*166).tanh / 2 + in / 2 }



~btk2 = {
   CaosKick.robot(t:~tempo.kr*[4,6],att:1/[10,0.2],rel:1/[8,0.2]) * 2
}
~btk2 = {
   CaosKick.robot(t:~tempo.kr*[4,6],att:1/[10,0.2],rel:1/[8,0.2]) * 2
}





p.makeTempoClock( 160 / 60 );

~mix = ~btk


~mix.fadeTime = 30
~mix = 0
