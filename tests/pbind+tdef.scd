~z[0] = {|freq=200| SinOsc.ar( freq ) ! 2 }

~z[1] = {|freq=200| Pulse.ar( Stepper.kr() * freq * [9,12,17,19] )/2 ! 2 }
~z[2] = \set -> Pbind(\freq, Pseq([100,200, 300], inf), \dur, 0.006 );


(
Tdef(\durdur, { inf.do { |i|
	i.postln;
	~z[2] = \set -> Pbind(\freq, Pseq([100,200, 300], inf), \dur, 0.006 * (i%10+2) );
1.wait;
} }).play;
)