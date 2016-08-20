s.boot;

p = ProxySpace.push(s);

(
~fq1 = 60+{230.rand} ! 2;
~fm1.setn(\f, ~fq1 );
~fm1 = {|base=130,rango=1300,inicio=1500| LFTri.kr( 33 + base ,0,rango, 50 + inicio)  };
~fm1[2] = \set -> Pbind(\base, Pseq({2.5.rand}!4,inf), \dur, 3 )
~fm1[3] = \set -> Pbind(\rango, Pseq({120.rand}!4,inf), \dur, 6 )
~fm1[4] = \set -> Pbind(\inicio, Pseq({50.rand}!4,inf), \dur, 2 )
~x = { LFTri.ar( LFTri.ar( ~fm1.kr,0,~fm1.kr*512,1258 ), 0, 1/80 ).tanh ! 2  / 2 };
~x[1] = { LFTri.ar( LFTri.ar( ~fm1.kr * 3,0,~fm1.kr*1512,2258 ), 0, 1/20 ).tanh ! 2  / 20 };
~x[2] = { LFTri.ar( LFTri.ar( ~fm1.kr / 3,0,~fm1.kr*212,158 ), 0, 1/10 ).tanh ! 2  / 4 };
~x[3] = \filter -> {|in| RLPF.ar( in, LFNoise2.kr(1/[2,3,5],3500,4000), 1/20 )}
~x[4] = \filter -> {|in| (Resonz.ar( in, [4,14,144]*Stepper.kr( Impulse.kr(~fm1.kr/[12,15]), 0, 13, 2), 0.01 ) * 13).tanh + (in / 4 )}
~x.play;
)
