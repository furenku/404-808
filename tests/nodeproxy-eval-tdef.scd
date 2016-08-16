// variability: re-evaluating a NodeProxy via Tdef
// variabilidad: re-evaluando NodeProxys a través de un Tdef

s.boot;

p=ProxySpace.push(s);

~z.defineBus(\audio,2).play;

(

Tdef(\loopEval,{

	inf.do{
		~gen = { Resonz.ar(WhiteNoise.ar, 80 + ( { 1.0.rand } ! 4 * 730 ), 1/100  ) };
		~beat = { Decay2.kr(Impulse.kr(1,(({8.rand}!6)/8)),0.01,0.2,0.5+({ 0.5.rand } ! 4 )) };
		~z = { ( ~gen.ar  * ~beat.kr ! 2  * 14 ).tanh };
		"changed".postln;
		4.wait;
	}

});

)

Tdef(\loopEval).play;
