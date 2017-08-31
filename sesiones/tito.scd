(
   ~freqs = (48+[0,3,6,9]).midicps;
~z[0] = { RLPF.ar(WhiteNoise.ar/2,~freqs, 1/20 ); };
~z[1] = { s = SinOsc; s.ar(~freqs*[1,1.5,2],0,s.kr(~tempo.kr/[4,6,8])).tanh/2 ! 1};
~z[2] = { s = SinOsc; s.ar(2*~freqs*[1,1.5,2],0,s.kr(~tempo.kr/[84,6,8])).tanh/8 ! 1};
~z[3] = \filter -> {|in| (in * 8).tanh * 1.5 ! 1 }
~z[4] = \filter -> {|in| FreeVerb.ar(in,2/3,2/3) }
~z.fadeTime = 1
)
~btk.quant_(4)

~multiRitmo = 1

(
~btk[0] = { CaosKick.robot(t:~multiRitmo * ~tempo.kr/[8,12], rel: 2)!1};
~btk[1] = { CaosHats.robot(t:~multiRitmo * ~tempo.kr/[8,12], tp: [0,3,6,7,9,11]/16, rel: 2)!1};
~btk[2] = { CaosSnare.robot(t:~multiRitmo * ~tempo.kr/[8,12], tp: [1/2,3/4], rel: 2)!1};
~btk[4] = \filter -> {|in| FreeVerb.ar(in,2/3,2/3) }
~btk[5] = \filter -> {|in| (RLPF.ar(in,(55+[0,3,6,10]).midicps,1/30)/2 + in/2) / 4 }

)
(
   ~simple = [4,8];
~btk[0] = { CaosKick.robot(t:~simple * ~tempo.kr/[4,8,12], rel: 0.3)!1};
~btk[1] = { CaosHats.robot(t:~simple * ~tempo.kr/([8,12]*2), tp: [0,3,6,7,9,11]/16, rel: 0.3)!1};
~btk[2] = { CaosSnare.robot(t:~simple * ~tempo.kr/[8,12], tp: [1/2,3/4], rel: 0.3)!1};
~btk[4] = \filter -> {|in| (in ).tanh };
~btk[5] = \filter -> {|in|  (in * 0.5 * ~z.ar ) + in / 2};
~btk[5] = \filter -> {|in| (RLPF.ar(in,(Stepper.kr(~tempo.kr/3,0,1,12,3)+55+[0,3,6,10]).midicps,SinOsc.kr(~tempo.kr/16,0,0.4,0.5))/2 ) / 2 }
~btk[6] = \filter -> {|in| FreeVerb.ar(in,1,1) + in / 2 }
~btk.fadeTime = 0;
)
Tdef(\ritmoson,{
   inf.do{|i|

      ~multiRitmo = (i%3)+(1..6).choose;
         if( i % 2 == 0, {
            ~btk[5] = \filter -> {|in|  (in * 0.5 * ~z.ar ) + in / 2};
         }, {
            ~btk[5] = \filter -> {|in| (RLPF.ar(in,(Stepper.kr(~tempo.kr/3,0,1,12,3)+55+[0,3,6,10]).midicps,SinOsc.kr(~tempo.kr/16,0,0.4,0.5))/2 ) / 2 }
         });
      (160/60).wait;
   }
}).play

~mix = ~z + ~btk
~mix = ~z


~z.fadeTime = 20
