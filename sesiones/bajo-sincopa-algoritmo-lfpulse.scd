~bpm = 168;
p=ProxySpace.push(s);
p.makeTempoClock( ~bpm / 60 );

s.boot;


~z[0] = {|tempo=2,cutspeed=3,dur=0.1,basenote=30,intervals=#[0,3,5,8,9,11,15,17,18],dist=10| ( Resonz.ar( WhiteNoise.ar, (basenote+intervals.scramble).midicps * [1,2], 0.001 ) * LFPulse.kr( ~tempo.kr / tempo, [0, 5, 6, 7 ] / 8, dur ) * LFPulse.kr( ~tempo.kr/cutspeed, [0, 5, 6, 7 ] / 8, 1/[1,2.5], 2 ) * dist ).tanh / [3,5] ! 2 };


~z[2] = \filter -> {|in| FreeVerb.ar( in, LFNoise1.kr(~tempo.kr/8,0.3,0.5), LFNoise1.kr(~tempo.kr/8,0.3,0.5) ) + ( in * LFNoise1.kr(~tempo.kr/8,0.3,0.5) )};



~z.set(\dur,0.1);
~z.set(\dist,100);
~z.set(\dist,1);


~z[1] = \set -> Pbind(\tempo, Pseq([13,7,4],inf), \dur, Pseq([4,6],inf) );

~z.play;

