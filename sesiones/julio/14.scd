(
   ~z[0] = {
   Ringz.ar( Impulse.ar(~tempo.kr/[4,6],[0,2,3,5,11]/16),
   (-24+[48+60]+[0,1,5,7,8,10]).midicps,
   1/2
   ) / 2
   ! 2
};
~z[1] = {
   Ringz.ar( SinOsc.kr(~tempo.kr/8,0,8,4.1)*Impulse.ar(0.25*~tempo.kr/[4,6],[0,2,3,5,11]/16),
   ([12+17]+[0,1,5,7,8,10]).midicps,
   6
   ).tanh
   ! 2
};
~z[2] = {
   Ringz.ar(  SinOsc.kr(~tempo.kr/8,0,[4,6,12],[2.1,3.1,6.1])*Impulse.ar(~tempo.kr/[2,3,16],0.5*[0,2,3,5,11]/16),
   (-12+[48+60,36]+[0,1,5,7,8,10]).midicps,
   3
   ).tanh / 3
   ! 2
};

/*~z[0] = 0;*/
~mix = ~z;

)

~z[2] = 0;

~z[3] = \filter -> {|in| FreeVerb.ar(in,1,1) + in/4 }

~mix = ~z + ~btk

~btk.quant_(4)
(
   ~btk[0] = { CaosKick.robot(t:~tempo.kr/[8,12],tp:[0,7]/16) / 2 ! 2 };
~btk[1] = { CaosKick.robot(rel:1/10,t:~tempo.kr*[1/2,1/4],tp:[0,7]/16) / 2 ! 2 };
~btk[2] = { CaosHats.robot(rel:1/[10,5,3],t:~tempo.kr*[1,1/4,1/8],tp:[0,3,4,7,10,11]/16) / 1 ! 2 };
~btk[4] = { CaosKick.robot(rel:1/10,t:~tempo.kr*[1,1/2],tp:[0,3]/16) / 2 ! 2 };
~btk[5] = { CaosSnare.robot(rel:1/[3,1.5,2],t:~tempo.kr*[1/4,1/8],tp:[6,8,12]/16) / 2 ! 2 };
~btk[6] = \filter -> {|in| FreeVerb.ar(BPF.ar(in,SinOsc.kr(~tempo.kr/8,0,6000,6000),1/20),2/3,2/3)*0.7 + in };
)

~z[]
~mix = ~z + ~btk;

s.scope
