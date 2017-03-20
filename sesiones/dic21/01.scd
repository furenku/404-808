(
~z[0] = { Mix.ar(( Formant.ar(
( Demand.kr( Impulse.kr(~tempo.kr/4),Impulse.kr(~tempo.kr/16), Dxrand(Dseq([0,2,5,7,15]))) + 24 + [0,3,7,12,15] ).midicps * LFPulse.kr( ~tempo.kr / 8 ,
[0,3]/6, 1/[4,3], [2,2.5], 1 ),
SinOsc.kr( ~tempo.kr/4,0,[60,300,2000, 3000,2000] * [1,1.5,3],[ 160, 3000, 2200, 5000 ])  )
*
 SinOsc.kr( ~tempo.kr/4,0,1/2,1/4 ) * 12 ).tanh ! 2 )
 }
)


 ~z[1] = \filter -> {|in| FreeVerb.ar( in* Decay2.ar( CoinGate.ar(SinOsc.kr(~tempo.kr/[6,8],0,1/4,1/2),Impulse.ar(~tempo.kr*[2,3])),1/100,1/3 ), 3/4,3/4 )  + RLPF.ar(in/16,[24.midicps, SinOsc.kr(~tempo.kr/[6,8],0,1000,1223) ],0.1)}
// WhiteNoise.ar(1/4)
~z[2] = \filter -> {|in| in }



~amp = 1/4




~btk[0] = { CaosKick.robot( t: ~tempo.kr/[3,2,1.5,0.5], rel: [4,8,4,2]/16) ! 2 }
~btk[1] = { CaosSnare.robot( t: ~tempo.kr/[1,2], tp: ~tempo.kr/[2,3])*4 }
~btk[2] = { CaosHats.robot( t: ~tempo.kr*[3,2,6]) ! 2 }

~btk[3] = \filter -> {|in| (in/6)+(  (FreeVerb.ar( in, 3/4,1/4 ) / 2 ) * (in ) * 30 ).tanh / 12  }

~mix = ~z + ~btk


~mix.fadeTime = 10;
~mix = 0;


~mix.fadeTime = 0;
~mix = ~z + ~btk


~out.play
