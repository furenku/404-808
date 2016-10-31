s.boot;
(

SynthDef(\basic_drum, {|gate=1, freq=240, amp=1, gain=1|

	var sig, env;

	sig = SinOsc.ar(60,pi/2);

	env = EnvGen.kr( Env.perc(1/100,1/6), gate, doneAction: 2 );

	sig = ( (sig * env) * gain * 2).tanh * amp;

	Out.ar(0, Pan2.ar( sig, 1 ));


}).add;



SynthDef(\wood_res, {|gate=1, freq=40, amp=1, gain=133|
	var sig, env;

	sig = SinOsc.ar(freq*Array.exprand(10,0.5,12),pi/2,(1/8)/(1..8)) ! 1;

	sig = Resonz.ar( sig, Line.kr(1,1/16,1/8)*8500, 0.01 ) * 214;

	// sig = Ringz.ar( sig, Array.exprand(10,1.5,23)*10);

	env = EnvGen.kr( Env.perc(1/100,1/15), gate, doneAction: 2 );

	sig = ( (sig * env) * gain * 2).tanh * amp;

	Out.ar(0, Pan2.ar( sig, 1 ));

}).add;


SynthDef(\drum_brokendist, {|gate=1, freq=80, amp=2, gain=0.01|
	var sig, env;
	var carrierFreqs;

	carrierFreqs = freq * [1, 2, 3, 5, 8, 13, 21 ];
	carrierFreqs = carrierFreqs * XLine.kr( 1,1/8,1/24);

	sig = WhiteNoise.ar(1/2) * EnvGen.kr( Env.perc(1/100,1/8));
	sig = sig + LFSaw.ar( SinOsc.kr( freq*[1,1.02], 1/2, LFSaw.kr(1/[18,22],0), LFSaw.kr(1/[18,22],1/2) ) + carrierFreqs, 0, 1/(1..8) );
	sig = sig + SinOsc.ar( carrierFreqs, 0, (1/8)/(1..8) );


	sig = RLPF.ar( sig,  [250,255] * XLine.kr( 1,1/8,1/26), 0.1);

	sig = sig + Ringz.ar( sig,  carrierFreqs / 4, 1/4);

	sig = Mix( sig );


	sig = sig * amp;
	env = EnvGen.kr( Env.perc(1/100,1/6), gate, doneAction: 2 );

	Out.ar(0, Pan2.ar( ( (sig * env) * gain).tanh * amp, 1 ));

}).add;



SynthDef(\drum_lofi, {|gate=1, freq=1400, amp=1, gain=13|
	var sig, env;



	sig = WhiteNoise.ar * EnvGen.kr(Env.perc(1/100,1/20));
	sig = sig + LFSaw.ar( 40+LFSaw.kr(1/2,0,350, [40,45] * XLine.kr( 25,1,1/15)) );
	// sig = sig + LFSaw.ar( LFSaw.kr(35,0,650,35 * XLine.kr( 250,1,1/15)) );
	sig = RLPF.ar( sig/10, freq * Array.exprand(5,1,30) * XLine.kr( 10,0.01,1/10) , 1/10 );
	// sig = sig + SinOsc.ar( XLine.kr( 1,0.1,1/5) *
	// Array.exprand(:5,freq,freq*100) ) ! 1;
	sig = Mix(( sig * 3.1 ).tanh);
	//sig = sig + SinOsc.ar( [freq, freq+Line.kr( 10000,0,1/30)])/2 ! 1;

	env = EnvGen.kr( Env.perc(1/100,1/2), gate, doneAction: 2 );

	sig = ( (sig * env) * gain * 2).tanh * amp;

	Out.ar(0, Pan2.ar( sig, 1 ));

}).add;


SynthDef(\clearkick, {|gate=1, freq=60, amp=1, gain=1|

	var sig, env;

	sig = SinOsc.ar(XLine.kr(12000,freq*[1,1.02],1/64),pi/2);

	sig = RLPF.ar(sig,XLine.kr(12000,freq*[1,1.02]*Array.fib(12),1/24),0.01);

	env = EnvGen.kr( Env.perc(1/100,1/8), gate, doneAction: 2 );

	sig = ( (sig * env) * gain * 2).tanh * amp;

	Out.ar(0, Pan2.ar( sig, 1 ));


}).add;

)





(

Tdef(\testdrums, { loop {

	if( 1.0.rand > 0.7, {
		Synth(\drum_lofi);
	});

	if( 1.0.rand > 0.3, {
		Synth(\wood_res);
	});

	if( 1.0.rand > 0.9, {
		Synth(\drum_brokendist);
	});

	if( 1.0.rand > 0.5, {
		Synth(\clearkick);
	});


	(1/4).wait;

}}).play;

)