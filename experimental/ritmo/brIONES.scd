
s.boot;

p= ProxySpace.push(s);

(
~uno= {BPF.ar(WhiteNoise.ar(SinOsc.kr(100,0,30,40)),50.midicps,SinOsc.ar(20,0,0.02,0.03),1).distort.distort+SinOsc.ar(26.midicps,0,20).distort};

~dos= {BPF.ar(WhiteNoise.ar(SinOsc.kr(200,0,30,40)),62.midicps,SinOsc.ar(20,0,0.02,0.03),1).distort.distort*Dust.kr(3)};

~tres= {BPF.ar(WhiteNoise.ar(SinOsc.kr(500,0,30,40)),69.midicps,SinOsc.ar(20,0,0.02,0.03),1).distort.distort*Dust.kr(6)};

~cuatro= {Ringz.ar(BPF.ar(WhiteNoise.ar(SinOsc.kr(10000,0,30,40)),76.midicps,SinOsc.ar(20,0,0.02,0.03),1).distort.distort, LFNoise0.kr(6,300,600),0.005)*Dust.kr(7)};
);

~uno.fadeTime= 20;
~dos.fadeTime= 20;
~tres.fadeTime= 20;
~cuatro.fadeTime= 20;

~cinco= {Mix(Pluck.ar(Pulse.ar(200,0.1,1),Impulse.kr([4,2,6,12,8,16,24,32]*MouseY.kr(0.05,0.1)),1,[50,52,53,55,57,58,60,62].midicps.reciprocal,0.5))};

~cinco.fadeTime= 20;
~out= ~tres;

~out.fadeTime = 30;

~out.play