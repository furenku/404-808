~z = ~btk;
(
~btk[0] = { (
	MoogFF.ar(
		WhiteNoise.ar * Decay2.kr(Impulse.kr(~tempo.kr/[1,2,3], [[0,3,5,6]/8,1/2,[0,5]/8]),0.01,1/3), Array.exprand(7,60* [3,1,1/2],8500* [2,1,1/2]) , SinOsc.kr(1/30,0,1.9,2) ) * ( 4 / [12,1,1/8] ) ! 2  * 10 ).tanh / 4
};

)