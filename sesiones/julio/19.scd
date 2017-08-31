e=[CaosSnare,CaosSnare,CaosSnare];
d=[
[CaosKick,CaosSnare,CaosSnare],
[CaosKick,CaosHats,CaosSnare],
[CaosHats,CaosHats,CaosHats],
[CaosKick,CaosKick,CaosSnare],
];

~k={ Stepper.kr(Impulse.kr(~tempo.kr/2),0,0,2,1); }
~h={ Stepper.kr(Impulse.kr(~tempo.kr/6),0,0,12,1); }

~z = { (RLPF.ar(WhiteNoise.ar(4),(((~h.kr+1)/6)*70)+(10*~k.kr*~h.kr*8),0.05).tanh / (3*(1+~k.kr))).tanh/2 !2 }

~mix = ~btk

~i = 0;
~btk.quant_(4);
~btk[4] = \filter->{|in| FreeVerb.ar(in/1.5,1/2,1/2)+(in*33).tanh/2.5 };
~btk[4] = 0;

d

(
   Tdef(\btk,{
   inf.do{
      d=[
      [CaosKick,CaosSnare,CaosSnare],
      [CaosKick,CaosHats,CaosSnare],
      [CaosHats,CaosHats,CaosHats],
      [CaosKick,CaosKick,CaosSnare],
      ].choose;
      ~multi = 1/[1/[2,3],1,1/[4,6],1/8,2,8,32].choose;
      ~btkk[0] = {i=[0,1,2].choose; d.choose.robot(t:(~tempo.kr*~multi)) ! 1 };
      ~btkk[1] = {i=[0,1,2].choose; d.choose.robot(t:(~tempo.kr*~multi)/2) ! 1 };
      ~btkk[2] = {i=[0,1,2].choose; d.choose.robot(t:(~tempo.kr*~multi)/3,tp:[0,11]/16) ! 1 };
      ~btkk[3] = {i=[0,1,2].choose; d.choose.robot(t:(~tempo.kr*~multi)/8,tp:[0,11]/16) ! 1 };
      [2,3,4].choose.wait;
   }
   }).play;
)
