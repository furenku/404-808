~z.fadeTime = 0;

(
   ~z[0] = {|notes=#[0,5,7,8]|RLPF.ar(WhiteNoise.ar/(SinOsc.kr(~tempo.kr/(8*4),[0,6]/8,3,1)*4),(48+notes).midicps,1/20).tanh!2};
   ~z[1] = {|notes=#[0,5,7,8]|BPF.ar(WhiteNoise.ar/(SinOsc.kr(~tempo.kr/(16*4),1/[4,7],4,1)*4),(55+notes).midicps,1/20).tanh!2};
)

~z[2] = \filter -> {|in| FreeVerb.ar(in/1.5,1,1) / 2 }

~mix = ~z + ~btk + ~coinnoise

~z.quant_(4);
~btk.quant_(4);

~mult = 2

~coinnoise.quant_(4)
~coinnoise = {|notes=#[0,5,7,8]| RLPF.ar(WhiteNoise.ar,(55+notes).midicps,0.01) * Decay2.kr(CoinGate.kr([6,3,1]/8,Impulse.kr(~tempo.kr*[1/4,1/2,4])),1/18,1/8) ! 2 }
~coinnoise[2] = \filter -> {|in| FreeVerb.ar((in*33.5).tanh,1/2,1/4)}


~mix = ~coinnoise + ~btk + ~z + ~bzz

~mult = 1/2;
(
   ~btk[0] = { CaosKick.robot(t:~tempo.kr/([4,6]/~mult),rel:1/[12,13]) ! 2 };
   ~btk[1] = { CaosKick.robot(t:~tempo.kr/([2,3]/~mult),rel:1/[12,13])/[4,6] ! 2 };
   ~btk[2] = { CaosHats.robot(t:~tempo.kr/([2,4]/~mult),tp:[0,3,4,5,7]/8 )/2 ! 2 };
   ~btk[3] = { CaosSnare.robot(t:~tempo.kr/([4,3]/~mult),tp:[0,3]/8 )/8 ! 2 };
   ~btk[4] = { CaosSnare.robot(t:~tempo.kr/([2,4]/~mult),tp:[0,3]/16, rel: 1/20 )/16 ! 2 };
)


~btk[2] = \filter -> {|in| FreeVerb.ar((in*13.5).tanh,1/2,1/4)}



(
   c=[
[0,5,7,8],
7+[0,5,7,8],
3+[0,5,7,8]
];

Tdef(\armonia,{
      inf.do {

         ~coinnoise.setn(\notes,c.scramble.choose);
         ~z.setn(\notes,c.choose);
         [2,4,6].choose.wait;
      }
}).play
Tdef(\armonia).stop
~bzz.quant_(4)

~bzz = { Ringz.ar(33*Impulse.ar(~tempo.kr/8,[0,1,5,6,7]/16),([24,36]+[0,1,5,7,8,10,15]).midicps,1/2).tanh}



~mult=2;
~bzz[1] = { Ringz.ar(33*Impulse.ar(~tempo.kr/[6,12],[0,1,5,6,7]/16),([36,43]+[0,1,5,7,8,10,15]).midicps,1/1.5).tanh}


~mix = ~coinnoise + ~z

~mix = 0;
