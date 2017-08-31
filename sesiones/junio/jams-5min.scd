~mix = ~z;




~k[0] = {
   Impulse.kr( ~tempo.kr / [2,3] )
}

~z[0] = {
   Ringz.ar( Impulse.ar( ~tempo.kr / [2,3] ), (48+[0,2,3,7,9]).midicps, SinOsc.kr(~tempo.kr/8)*0.35 ).tanh ! 2 / 10
};
~z[1] = {
   Ringz.ar( Impulse.ar( ~tempo.kr * [2,3] ), [1/2,1] * ([24,36]+[0,2,3,7,9]).midicps, SinOsc.kr(~tempo.kr/8)*0.25 ).tanh ! 2 / 5
};
~z[0] = 0;
~z[1] = 0;
~z[2] = {
   Ringz.ar( CoinGate.ar([1/4,1/3],Impulse.ar( ~tempo.kr * [2,3] )), [1/2,1] * ([24,36]+[0,2,3,7,9]+24).midicps, SinOsc.kr(~tempo.kr/8)*0.15 ).tanh ! 2 / 10
};



~pulso = { LFPulse.kr(~tempo.kr*2,1/[3,7],1/[2,3,6],1)  }
~mix = ~bzz
~bzz = 0
~bzz = { s=SinOsc; s.ar(60+[0,5,9].midicps,0,s.kr(~tempo.kr/[2,3,4])).tanh!2}
~bzz[0] = { s=SinOsc; s.ar(([12]/~pulso.kr)+60+[0,5,9].midicps,0,s.kr(~tempo.kr/[2,3,4])).tanh!2}
~bzz[1] = \filter -> {|in| in * ~pulso.kr ! 2 }





~out.play
~mix=~bzz;
~mix=~bzz+~btk;

~bzz[0] = { s=SinOsc; s.ar((36+[0,3,9,11]).midicps,0, s.kr(~tempo.kr/[2,3,4,6])).tanh/3 ! 2 };
~bzz[1] = { s=SinOsc; LFPulse.ar((60+[0,3,9,11]).midicps,s.kr(~tempo.kr/[2,3,4,6]),s.kr(~tempo.kr/[2,3,4,6],0,1/3,1/2),s.kr(0.25*~tempo.kr/[2,3,4,6])).tanh/6 ! 2 };
~bzz[1] = 0;

~btk[0] = { CaosKick.robot(t:~tempo.kr/[3,4],tp:[0,7]/8, rel: 3) / 3 ! 2 };
~btk[1] = { CaosHats.robot(t:~tempo.kr*[2,4,3]*LFPulse.kr(~tempo.kr/8,1/2,1/4,2,1),tp:[0,7,11]/16, rel: 1/3) / 3 ! 2 };
~btk[2] = { CaosSnare.robot(t:~tempo.kr/[2,4,3]*LFPulse.kr(~tempo.kr/8,1/2,1/[2,3],[0.5,1.5],1),tp:[0,3,7]/8, rel: 1/3) / 2 ! 2 };
~btk[3] = { (CaosKick.robot(t:~tempo.kr,tp:[0,1]/16, rel: 0.3) * SinOsc.kr(~tempo.kr/3)*3).tanh ! 2 };
~btk[4] = { (CaosKick.robot(t:~tempo.kr*2,tp:[0,1]/16, rel: 0.3) * SinOsc.kr(~tempo.kr/3)*13).tanh / 2 ! 2 };
