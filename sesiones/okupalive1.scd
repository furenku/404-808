






(
~z = {
   RLPF.ar(
      WhiteNoise.ar/2,
      /*[300,330],*/
      Stepper.kr( Impulse.kr(~tempo.kr/4),0,1,5,1.5)*
      ([36,48]+[0,3,5,7,8]).midicps,
      1/50
   )
   *
   LFPulse.kr(~tempo.kr/[4,6,8], [0,3,5]/8, [0,3,5,7,9,11]/16, [0.5,3,1,2,2.5], 1)
   * 1/ 2
   ! 2

}
)

~z[1]= {|in| FreeVerb.ar(in)}

~mix = ~z + ~btk;
~mix = ~z;
~mix = ~btk


~btk[0] = { CaosKick.robot(t:~tempo.kr/[1/4,1,2,3]) *[2,1,2] };
~btk[7] = { CaosKick.robot(t:~tempo.kr/[1/8,1,2,3]) *[3,1,2] };
~btk[5] = { CaosKick.robot(t:~tempo.kr/[1/2,2,1,2,3], rel: 1/10) *[3,1,2] };
~btk[1] = { CaosHats.robot(t:~tempo.kr/[2],tp:[1,3,5,7,9,10,11,13]/16) * 5 ! 2 };
~btk[2] = { CaosSnare.robot(t:~tempo.kr/[2,6],tp:[1/2,3/4])  ! 2 };
~btk[3] = { (CaosKick.robot(t:~tempo.kr/[16], att:5, rel:4) * 2).tanh   };
~btk[4] = \filter -> { |in| ((in * 2100).tanh / 2) + (in / 4) + FreeVerb.ar(in,2/3,2/3)/2 }
~btk[6] = { CaosKick.robot(t:~tempo.kr/4,tp:[0,3,5,7,9,11]/16) *[1/3,1,2] ! 2 };

~btk[4] = \filter -> { |in|  FreeVerb.ar(in,1/4,1/2) + ((in *3).tanh / 2 ) + in   }
~btk[4] = \filter -> { |in| FreeVerb.ar(in) }
~
~btk[0] = 0;
~btk[1] = 0;
~btk[2] = 0;
~btk[3] = 0;
~btk[4] = 0;
~btk[5] = 0;
~btk[6] = 0;
~btk[7] = 0;

~mix[1] = 0
~mix = ~bass + ~btk;
~mix[1] = \filter -> {|in| RLPF.ar( in, MouseX.kr(60,15000),1/2 ) }

~mix = ~z + ~btk
~mix = ~btk + ~bass + ~z
~mix = ~btk + ~bass
~mix = {~btk.ar + ~z.ar / 2}
~mix.fadeTime = 3

~mix = 0
~mix = ~bass + ~z

~mix.fadeTime = 30

p.makeTempoClock( 20 / 60 );

(
   ~bass = {
(SinOsc.ar((36+[0,3,7,9]).midicps
*
LFPulse.kr(~tempo.kr/4, 1/32, [0,3,5,7,9,11]/16, [0.5,3,1,2,2.5], 1))

* 14).tanh / 12
*
LFPulse.kr(~tempo.kr/8, 1/32, [0,3,5,7,9,11]/16, [0.5,3,1,2,2.5], 1)
/2
}! 2
)
















~z.fadeTime = 30
