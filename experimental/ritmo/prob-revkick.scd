s.boot;

p=ProxySpace.push(s)
p.makeTempoClock( 160 / 60 );


~x.play
().play
(
   ~bzz[0] = {
      WhiteNoise.ar
   };
   ~bzz[1] = {
      SinOsc.ar(360*SinOsc.kr(~tempo.kr/8,0,1/4,1/2))
   };
~x = {
    ~bzz.ar * CoinGate.kr(SinOsc.kr(~tempo.kr/4,0,1/4,1/2),Impulse.kr(~tempo.kr*4))
}
~x[1] = {
    (~bzz.ar*1000).tanh * Decay2.kr(CoinGate.kr(SinOsc.kr(~tempo.kr/8,0,1/4,1/2),Impulse.kr(~tempo.kr)),1/20,1/10)
}

~x[2] = \filter-> {|in|
    (RLPF.ar(FreeVerb.ar(in,SinOsc.kr(~tempo.kr/8,0,1/4,1/2),SinOsc.kr(~tempo.kr/8,0,1/8,1/4)), SinOsc.kr(~tempo.kr/8,0,1/8,1/4)*610,0.5)*33).tanh
}

~x[3] = {
    RLPF.ar((~bzz.ar*11).tanh,SinOsc.kr(~tempo.kr/8,0,1/8,1/4)*600,0.01) * Decay2.kr(CoinGate.kr(LFPulse.kr(~tempo.kr/2,0,1/16)*SinOsc.kr(~tempo.kr/8,0,1/4,1/2),Impulse.kr(~tempo.kr/2)),1/20,1/2)
}

)
