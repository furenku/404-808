(
o = SinOsc;
f = LFPulse;
~z[0] = { o.ar(120*f.kr(~tempo.kr/4,1/2,1/4,3,1),0,o.kr(~tempo.kr/2)) ! 2 };
~z[1] = { o.ar(175*f.kr(~tempo.kr/8,1/6,1/3,4,1),0,o.kr(~tempo.kr/4)) ! 2 };
~z[2] = { o.ar(230*f.kr(~tempo.kr/12,1/10,1/2,5,1),0,o.kr(~tempo.kr/6)) ! 2 };
)

~z[4] =  \filter -> {|in| var of = o.kr(1/32,0,0.3,0.65); FreeVerb.ar(in,of,1-of) }

 ~z[3]
