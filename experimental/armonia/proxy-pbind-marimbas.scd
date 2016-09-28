s.boot;

~bpm = 168;
p=ProxySpace.push(s);
p.makeTempoClock( ~bpm / 60 );

(

~z[0] = {|speed=1, freq=300, decay=0.5,intervals=#[0,2,6,9,15]| (Resonz.ar((SinOsc.ar(freq*[1,1/3,2.5])+WhiteNoise.ar )* Decay2.kr(Impulse.kr( ~tempo.kr * [2,3] / speed.poll ),1/100, decay )!2 / 3
	, (60+intervals).midicps
	,1/100
) * 133 ).tanh / 2
}
)
(

~z[1] = \set -> Pbind(
	\speed, Pseq([2,1/3,1/5], inf),
	\freq, Pwhite(100,18000, inf),
	\decay,Pwhite(0.01,1, inf),
	\dur, Pseq([2,3,5], inf),
	\intervals, Pseq([[2,3,6,8,12],[2,4,7,8,10],[0,3,5,9,19],[0,2,7,11,15]], inf)

);

)



~z.play;

