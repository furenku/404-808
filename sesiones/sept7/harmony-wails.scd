~z.fadeTime=10;

~z[0] = { Ringz.ar( Impulse.ar( 1 / [3,5], [1,3,5,6]/8 ) , (50 + [0,3,6,7,9]).midicps ) ! 2 / 8 }

~z[1] = { ( Resonz.ar( Impulse.ar( SinOsc.kr(1/100,0,23,30)  ) , (72 + [0,3]).midicps, SinOsc.kr(1/300,0,0.28,0.3)  ) * 3 ).tanh * 0.8  }

~z[2] = \filter -> {|in| FreeVerb.ar( in, 0.9, 0.9 ) + in / 2 }




~y[0] = { Ringz.ar( Impulse.ar( 0.5 / [2,3,7], [1,3,5,6]/8 ) , (62 + [0,15,8,6,7,9]).midicps ) ! 2 /24 }

~y[1] = { ( Resonz.ar( Impulse.ar( SinOsc.kr(1/200,0,13,20)  ) , (43 + [0,3]).midicps,  SinOsc.kr(1/300,0,0.395,0.4) ) * 3 ).tanh * 1.3  }

~y[2] = \filter -> {|in| FreeVerb.ar( in, 0.9, 0.9 ) + in / 2 }



~x[0] = { Ringz.ar( Impulse.ar( 0.3 * [2,3,7], [1,3,5,6]/8 ) , (69 + [0,15,9,11,5,9]).midicps * LFPulse.kr(1/4,0.25,0.25,LFPulse.kr(16,0.25,0.0625,[8,5,1.5],2),1) ) ! 2 / 12 }

~x[1] = { ( Resonz.ar( Impulse.ar( SinOsc.kr(1/20,0,13,20)  ) , (93 + [0,3]).midicps,  SinOsc.kr(1/300,0,0.395,0.4) ) * 33 ).tanh * 0.3  }

~x[2] = \filter -> {|in| FreeVerb.ar( in, 0.9, 0.9 ) + in / 2 }


~mix = ~z + ~y + ~x;

~mix = ~x;
~mix = ~y;
~mix = ~z;

~mix.fadeTime = 30;


~mix = ~z + ~y + ~x;

~mix = 0;

~mix.fadeTime = 0;

~mix = ~x;

~mix.fadeTime = 10;

~mix = 0;
