~kk = {|prob=#[0.25,0.4,0.6,0.8]| CoinGate.kr( prob, Impulse.kr( ~tempo.kr*[2,3,1/2,1/4],[0,3,5,7]/8 ), 0.1, 1) }
~k1 = {|prob=#[0.1,0.3,0.8,0.5]| CoinGate.kr( prob, Impulse.kr( ~tempo.kr,[0,3,5,7]/8 )) }

~kk.control(s,5)

(
   ~z = {
   Resonz.ar(Decay2.kr(~kk,0.1,0.2) * WhiteNoise.ar*1000,(60+[3,6,8,9]).midicps,0.001).tanh / 2 ! 2
   !2}
)
~mix = ~z
~z.setn( \in, ~k1 )


~kk.setn(\prob,[1,1,1,1]/1.5)
(
   Tdef(\ritmos, {
   inf.do {|i|

      var counter = (i % 8)+1;

      ~kk.setn(\prob,[1,1,1,1]/(counter));
      counter.postln;
      ((166/60).reciprocal*8).wait;

   }
}).play;
)
~kk.setn(\prob,[1,1,1,1]/1.5)
