s.boot;

().play;

(

~bpm = 160;

p = ProxySpace.push(s);



~z = { Silent.ar ! 2 };
~mix = ~z;
~amp = 0.95;
~out = {var m=HPF.ar(~mix.ar,20);Pan2.ar(Limiter.ar(Compander.ar(m,m)*~amp),0);};
//~out = { Pan2.ar( Limiter.ar( ~mix.ar * ~amp ), 0 )  };


p.quant_(4);
p.quant = (4);

~out.play;

TempoClock.default.tempo = ~bpm / 60;
p.makeTempoClock( ~bpm / 60 );

)

~z = { WhiteNoise.ar(1/20) ! 2 };
~z = { Silent.ar ! 2 };
~mix = ~z;


