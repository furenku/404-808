~out.play;

~z[0] = {
|freq=220,trig=1,dist=0.3,quality=0.0|

   HPF.ar(
   (
   MoogFF.ar( PinkNoise.ar*(dist*100), freq*[1,2,1/2], quality+[3.93,3.91,4])
   * [1,1/2,3]).tanh,
   80)
   * EnvGen.kr( Env.adsr(0.01,0.1,1/3,1/2), trig )
! 1 ! 2
};

~z[1] = \set -> Pbind(
\dur, 1,
\freq, Prand((36+[0,1,4,5,7,10,15]).midicps,inf),
\quality, Pseq([0,1/4,1/2,2/3,1],inf),
/*\freq, Pwhite(36,52,inf).midicps,*/
\bw, Pwhite(48,168,inf).midicps,
\modfreq, Pwhite(3,1226,inf).midicps,
\trig, Pseq([1,0,1,1,0,0,0],inf)
)
