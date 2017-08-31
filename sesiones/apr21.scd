(
   ~z = 0
(

~z = {

(

   RLPF.ar(
      WhiteNoise.ar,
      /*[300,330] * LFPulse.kr(~tempo.kr/16,0,[1/2,1/4],[1/2,1],[1/2,1]),*/
      [300,330] * [1,3,1/2] * LFPulse.kr(~tempo.kr/16,0,[1/2,1/4],[1/2,1],[1/2,1/[4,8]]),
      0.01
   )
   * [1,1/6,1/3]

* 2

! 2

).tanh / 16


}
)
~z.fadeTime = 2

~z[1] = \filter -> { |in| FreeVerb.ar(in,1/2,1/2)/2 + in/2 }

~mix = ~btk


~btk[0] = {
   ~z.ar
   *
   Decay2.kr(CoinGate.kr([1/4,3/4],Impulse.kr([~tempo.kr,~tempo.kr/2])))
}


~btk[1] = {
   ~z.ar
   *
   Decay2.kr(CoinGate.kr([1/8,1/2],Impulse.kr([~tempo.kr*3,~tempo.kr*2])),
   0.01,0.5
   )
}


~btk[1] = {
   ~z.ar
   *
   Decay2.kr(CoinGate.kr([1/8,1/2],Impulse.kr([~tempo.kr*3,~tempo.kr*2])),
   0.01,0.2
   )

}




~btk[2] = {
(
   Resonz.ar(
      ~z.ar
   *
   Decay2.kr(CoinGate.kr([1/8,1/2],Impulse.kr([~tempo.kr/3,~tempo.kr/4])),
   2,2
   ),
   [150,60],
   1/100
   ) * 100 ).tanh / 3
}


(
~btk2[0] = {
   (CaosKick.robot( t: ~tempo.kr/[2,6], rel: 0.2 ) * 10 ).tanh * 2
};


~btk2[1] = {
   (CaosHats.robot( t: ~tempo.kr*[2,3], rel: 0.2 ) * [10,2] ).tanh / 2
};
/*
~btk2[1] = {
   (CaosHats.robot( t: ~tempo.kr*[2,3], rel: 0.2 ) * [10,2] ).tanh / 2
};*/

~btk2[2] = {
   (CaosSnare.robot( t: ~tempo.kr/[2], tp: [1/2,3/4], rel: 0.2 ) * [10,2] ).tanh / 2
};

~btk2[3] = \filter -> { |in| FreeVerb.ar(in,1/2,1/2)/2 + (in*4).tanh };
)
~btk3 = {
   RLPF.ar( ~btk.ar + ~btk2.ar * 3, [160,180],0.1 ).tanh / 2
};


~btk2[0] = 0
~btk2[2] = 0

~btk4[1] = {
   (CaosKick.robot( t: ~tempo.kr * 1 , tp: [0,3/4], rel: [0.3,3] ) * [1,30] ).tanh * [3,1/4]
};

~btk4[0] = {
   (CaosKick.robot( t: ~tempo.kr * 1 , rel: 0.3 ) * 1 ).tanh * 3
};

(
~btk4[2] = {
   RLPF.ar((CaosSnare.robot( t: ~tempo.kr/[2,3], tp: [1/2,3/4], rel: 0.2 ) * [10,2] ).tanh / 2
   , 2 *
   (72+[0,3,7,9,11]).midicps * LFPulse.kr(~tempo.kr*8,[0,3,5,7]/8,[1,2,3,4]/16),[1,2,3,4],2,
   1/50
   ) / 8
   ! 2
};
)

~btk4[2] = 0

~mix = ~btk + ~btk2 + ~btk3
~mix = ~btk2 + ~btk3
~mix = ~btk2 + ~btk
~mix = ~btk2 + ~btk + ~btk4
~mix = ~btk3
~mix = ~btk3 + ~z
~mix = ~z + ~btk2
~mix = ~btk
~mix = ~btk2

~mix = ~btk2 + ~btk + ~btk4
~mix = ~btk2 + ~btk4
~mix = ~btk4

~mix = { (~z.ar / 628) + ~btk2.ar }
~mix = { (~z.ar / 628) + ~btk2.ar }


p.makeTempoClock( 80 / 60 );
