p=ProxySpace.push(s);
(
/*

HACKPACT 1/15: 4/2/15

*/



~out.play;

~amp = 0.5;
~out = ~mix * ~amp;
~mix = ~mix1 + ~mix2;

~mix1 = ~z1+~z2;
~mix2  = ~btk;
)

~z1 = { SinOsc.ar(330)*SinOsc.kr(1/5,0,1/2,1/2)/10 };
~z2 = { SinOsc.ar(40)*SinOsc.kr(1/5,1/2,1/2,1/2)/3 };

~btk = { var z = Decay2.ar(Impulse.ar(1/[4,6]),0.01,1/[5,6,9])*WhiteNoise.ar(1/3); 8.do{|i| z = AllpassC.ar( Resonz.ar(z,[50,330,750]+i*[30,53,1035],1/10), 1/5,1/14) * (((i+1)*3)/32); }; z;  };


