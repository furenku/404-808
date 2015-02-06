p=ProxySpace.push(s);
(
/*

HACKPACT 1/15: 6/2/15

*/


~out = { Silent.ar ! 2  };
~out.play;



~mix1 = { Silent.ar ! 2  };
~mix2 = { Silent.ar ! 2  };

~amp = 0.5;
~mix = ~mix1 + ~mix2;

~out = ~mix * ~amp;


)


~f2 = { LFPulse.kr(1/8,1/4,1/4,4/[1,2,3],4/[1,2,3]) };
~f1 = { LFPulse.kr(1/4,1/4,1/4,4/[1,2],4/[1,2]) };

~f3 = { LFPulse.kr(1/16,1/4,1/4,[1,2,3]/[4,3],[1,2,3]/[4,3]) };

~mix1 = ~slow;
~slow = { SinOsc.ar([40, 70,120,330] * ( ~f1.kr + ~f3.kr ) * 1/[1,2,4,6] )*SinOsc.kr(1/[5,6],[0,1]/3,1/2,1/2) / 6  };

~mix2 = ~rv;

~rv = { FreeVerb.ar ( RLPF.ar( ~slow.ar * 6, SinOsc.kr(1/30,0,650,700), 0.01 ) + ~delay.ar + ~delay2.ar, 2/3,  SinOsc.kr(1/30,0,0.3,0.5),  SinOsc.kr(1/30,0,0.3,0.5) ).tanh };


~delay = { var z = ~z2.ar; 10.do{|i| z = AllpassC.ar( ~z2.ar, [0.2,1], [0.2,1]  ) * ((10-i)/5); }; z; };

~delay2 = { var z = ~bzz.ar; 10.do{|i| z = AllpassC.ar( ~bzz.ar, [0.2,4], [0.2,4]  ) * ((10-i)/2); }; z; };

~z2 = { ( ~k.ar * 1040 ).tanh };
~k = { Formant.ar( [120, 440 , 333 ,1000] * ~f2.kr, SinOsc.kr(1/30,0,2000,2040) , SinOsc.kr(1/50,0,1000,1020) )  * Decay2.kr(Impulse.kr([3,7,10,20]),0.01,SinOsc.kr(1/50,0,0.05,0.06)) * SinOsc.kr(1/[2,3,4,10],[0,1,2,3]/4,1/2,1/[2,3,5,9]) };

~bzz = { (~bz.ar*14).wrap2(1)  } ;
~bz = { Formant.ar( [140, 220 , 320 ] * ~f3.kr, SinOsc.kr(1/30,0,2000,2040) , SinOsc.kr(1/50,0,1000,1020) )  * Decay2.kr(Impulse.kr(1/[3,7,10,20]),0.01,SinOsc.kr(1/150,0,0.5,0.51)) * SinOsc.kr(1/[2,3,4,10],[0,1,2,3]/4,1/2,1/[2,3,5,9]) ! 1 };
//)

//~btk = { var z = Decay2.ar(Impulse.ar(1/[4,6]),0.01,1/[5,6,9])*WhiteNoise.ar(1/3); 8.do{|i| z = AllpassC.ar( Resonz.ar(z,[50,330,750]+i*[30,53,1035],1/10), 1/5,1/14) * (((i+1)*3)/32); }; z;  };
