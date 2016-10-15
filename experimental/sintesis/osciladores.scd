(
SynthDef(\substr_harm_rand,{|freq=440, drive=30, pan=0|

var sig = PinkNoise.ar;
var f = freq * (1..8);

f = f * LFPulse.kr([1/8,1/2, 160,696.59,999], [1,2,4,6,8,13,15]/16, [1,2,4,5,6]/16 ,2,1);

sig = Resonz.ar( sig , f, 1/100 ) * drive !2;

sig = sig.tanh;

sig = sig * EnvGen.kr(Env.perc,doneAction:2);

Out.ar( 0, Pan2.ar(sig/8, pan ) )

}).store;
)



Tdef(\escala,{
   inf.do{|i|
      x = Synth(\substr_harm_rand, [\freq, (42+([0,3,6,8,11,13,15].choose)).midicps]);
      y = Synth(\substr_harm_rand, [\freq, (42+([0,3,6,8,11,13,15].choose)).midicps]);
      //x.set(\freq,220 + (30*i) );

      (1/2).wait;
      z = Synth(\substr_harm_rand, [\freq, (30+([0,3,6,8,11,13,15].choose)).midicps]);
      (1/4).wait;
   }
});

t = Tdef(\escala);
t.play;
