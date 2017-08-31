~z = {|freq=220, modfreq=3, bw=300,trig=1,dist=30|
o=SinOsc.kr( modfreq, 0,0.2,0.7);
(
RLPF.ar(
LFPulse.ar(freq*[1,3,4],1/4,o)
+
SinOsc.ar(freq/2)
,
o*bw,
1/30
)
* EnvGen.kr( Env.adsr(0.01,0.1,1/3,1/2), trig )
* dist
).tanh
! 1 ! 2
};

~z[1] = \set -> Pbind(
\dur, 1,
\freq, Prand((36+[0,1,4,5,8,10,15]).midicps,inf),
/*\freq, Pwhite(36,52,inf).midicps,*/
\bw, Pwhite(48,168,inf).midicps,
\modfreq, Pwhite(3,1226,inf).midicps,
\trig, Pseq([1,0,1,1,0,0,0],inf)
)
