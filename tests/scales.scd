// Checking out scales for melody and harmony
// Probando el uso de escalas para melodía y armonía


~mix = ~z;

e = Scale.minor;
~freqs = (42+e.degrees).midicps * 1;
~rate = 1/8;
/*
RESET:
(
~freqs.defineBus(\control,4);
~rate.defineBus(\control,1);
~z.defineBus(\audio,2);
)
*/
~z.map(\freqs,~freqs);
~z.map(\rate,~rate);

~z = {| trate=1, freqs=#[100,200,300,400] | RLPF.ar( Ringz.ar( Dust.ar( [3,5] * trate ), [freqs,freqs*2.5,freqs/2], 0.2 ), freqs * 3, 0.02 ).tanh / 2 ! 2 ; }



~z = {|rate=0.5,freqs=#[1,1,1,1]| RLPF.ar( Ringz.ar( Dust.ar( [3,5] * rate ), [freqs,freqs*2.5,freqs/2], 0.5 ), freqs * 3, 0.8 ).tanh / 8 ! 2 ; }

~mix = 0;

~z.quant=0

(

Tdef(\armonia, {
	inf.do {|i|
		switch((i%4).asInteger,
			0, { ~freqs = (45+e.degrees).midicps * 1; },
			1, { ~freqs = (44+e.degrees).midicps * 1; },
			3, { ~freqs = (42+e.degrees).midicps * 1; },
		);
		(2).wait;

	}
}).play;
)