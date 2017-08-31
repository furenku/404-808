~z[0] = {|notes=#[0,3,7,1,16,15]| Ringz.ar(Impulse.ar(~tempo.kr/[1,3,5],1/[3,4]),((12*notes)+[0,7,10,13]).midicps ) ! 2 };
~z[1] = {|notes=#[0,3,7,1,16,15]| Ringz.ar(Impulse.ar(~tempo.kr/[1,3,5],1/[3,8]),((12*notes)+[0,7,10,13]).midicps ) ! 2 };
~z[2] = {|notes=#[0,3,7,1,16,15]| Ringz.ar(Impulse.ar(~tempo.kr/[1,3,5],11/[3,6]),((12*notes)+[0,7,10,13]).midicps ) ! 2 };
~z[3] = \filter -> {|in| FreeVerb.ar(in,2/3,2/3) + in/2 }
~z[4] =0;// \filter -> {|in| FreeVerb.ar((in*100).tanh,2/3,2/3) + in/2 }
~z.fadeTime = 16

~z.quant_(4)

~mix = ~z + ~btkk
~btkk.quant_(4);
(
   ~btkk[0] = { (CaosKick.robot(t:~tempo.kr/[4,6],rel:1/[3,4])*[4,2,3,1/2]).tanh !2 };
   ~btkk[1] = { CaosHats.robot(t:~tempo.kr/[14,16],tp:rel:[3,4])!2 };
   ~btkk[2] = { CaosSnare.robot(t:~tempo.kr/[14,16],tp:[0,4,7]/16,rel:[3,4])!2 };
~z[3] = \filter -> {|in| FreeVerb.ar((in*100).tanh,2/3,2/3) };
)
~btkk[0] = 0;
~btkk[1] = 0;
~btkk[2] = 0;

(
   ~btkk[3] = { (CaosKick.robot(t:~tempo.kr*[1,2],rel:1/[3,4])*[4,2,3,1/2]).tanh / 3 !2 };
   ~btkk[4] = { CaosHats.robot(t:~tempo.kr/[1,2],tp:[0,3,5,6]/8,rel:1/[3,4])!2 };
   ~btkk[5] = { CaosSnare.robot(t:~tempo.kr/[4,6],tp:[0,4,7]/16,rel:1/[3,4])!2 };

)
~btkk[6] = 0;//\filter -> {|in| FreeVerb.ar(.tanh,2/3,2/3) };

~m,o

~mix = ~btkk
(

   c=[
   [0,3,7,1,16,15],
   3+[1,3,7,1,15,15],
   7+[0,4,6,1,16,15],
   ];
   Tdef(\armonia, {


   inf.do{|i|

      ~z.setn(\notes,c.choose);
      (1..5).choose.wait;
   }
}).play
)
