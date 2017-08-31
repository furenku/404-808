~out.play


~mix = ~bazz
(

~bazz = {
   Ringz.ar(
      WhiteNoise.ar,
      ([36,60]+[3,4,15,7,8,12,14,35]).midicps,
      SinOsc.kr(~tempo.kr/16,0,0.2,0.3)
   ) / 2
   *
   (
      Impulse.kr(~tempo.kr/[2,3],[0,3,7]/16)
      +
      Decay2.kr(
         CoinGate.kr(1/[2,3],Impulse.kr(~tempo.kr/[2,3]))
         )/4
   )
   / 16
!2

}
)

~bazz[1] = \filter -> {|in| (in*210).tanh / 2 + in }

~bataka = 0


~bataka[0] = {
   CaosKick.robot(t:( LFPulse.kr(~tempo.kr/8,1/16,0,16,1)*~tempo.kr)/3,dur:3)
   * LFPulse.kr(~tempo.kr/8,1/3)
};

~bataka[1] = {
   CaosKick.robot(t:4*( LFPulse.kr(~tempo.kr/8,1/16,0,16,1)*~tempo.kr)/3,dur:3)
   * LFPulse.kr(~tempo.kr/2,1/8) * 2
};

~bataka[2] = {
   CaosSnare.robot(t:[~tempo.kr/4,0.1*( LFPulse.kr(~tempo.kr/8,1/16,1/2,16,1)*~tempo.kr)],tp:[0,3,5,7]/8)
   * LFPulse.kr(~tempo.kr/2,[6,1]/8) * 0.5 ! 2
};
~bataka[3] = {
   CaosKick.robot(t:~tempo.kr*1)
   +
   CaosHats.robot(t:~tempo.kr/2,tp:[0,3,5,6,8,11]/16)!2
};


~bataka[4] = \filter -> {|in| ((in*3).tanh / 2) + in + FreeVerb.ar(~bataka.ar,2/3,2/3) }
p.makeTempoClock( 160 / 60 );

~mix[1] = \filter -> {|in|RLPF.ar( FreeVerb.ar(in,1/8,1/8), MouseX.kr(60,11111),0.5)}
~mix[2] = \filter -> {|in|(in * 23333).tanh }

~mix = ~bazz + ~bataka
~mix = ~bazz
~mix = ~bataka
~mix = 0

~mix.fadeTime=0
