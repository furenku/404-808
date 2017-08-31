~z = { Silent.ar ! 2 };
~z.fadeTime = 0

~z[0] = {|freq| (LFPulse.ar( freq, SinOsc.kr(~tempo.kr/8,0.4,0.5), SinOsc.kr(~tempo.kr/32,0,0.4,0.5))*3333).tanh/1.2 !2 };

~z[7] = {   (CaosKick.robot(t:~tempo.kr/[1,2,3],tp:[0,2 + Stepper.kr(Impulse.kr(~tempo.kr/4),0,0,11,0.5)]/4,rel:1/10)*20/[1,2,3]).tanh/4 ! 2};
~z[4] = {
   (CaosHats.robot(t:~tempo.kr*Stepper.kr(Impulse.kr(~tempo.kr/8),0,1,12,1),tp:1/4,rel:0.25)*3/[1,2,3]).tanh ! 2
};
~z[5] = {
   (CaosSnare.robot(t:~tempo.kr/[2,3],tp:1/2)*3/[1,2,3]).tanh ! 2
};

p.clock.tempo = 5.5/60;

~z[3] = {   (CaosKick.robot(t:~tempo.kr/[1,2,3],tp:[0,2 + Stepper.kr(Impulse.kr(~tempo.kr/4),0,0,2,0.25)]/4,rel:1/8)*20/[1,2,3]).tanh ! 2};
~mix = ~z;

(
   ~z[1] = \set -> Pbind(
   /*\degree,Pseq([[0,3,8],[2,5,11]],99),*/
   \note, Pseq([0,3,7,10,1,\rest,\rest,\rest], inf),
   \dur, 1/2,
   \octave, 3,
   /*\legato, 0.4,*/
   /*\strum, 0.1*/
);
~z[2] = \set -> Pbind(
   /*\degree,Pseq([[0,3,8],[2,5,11]],99),*/
   \note, Pseq(12+[0,3,7,10,1,\rest,\rest,\rest,\rest,\rest,\rest], inf),
   \dur,1/4,
   \octave, 3,
   /*\legato, 0.4,*/
   /*\strum, 0.1*/
);
)

p.clock.tempo = 5.5/60;
~z[6] = \filter -> {|in| (RLPF.ar(FreeVerb.ar(in,1,SinOsc.kr(~tempo.kr/16,0,0.4,0.5)),SinOsc.kr(~tempo.kr/16,0,0.4,0.5)*22200,0.1)).tanh }
~z[6] = 0;
p.clock.tempo = 166/60;
