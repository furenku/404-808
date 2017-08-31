s.boot
p = ProxySpace.push(s);
~p.quant_(4);
(


~oscbazz1 = {
   SinOsc.ar( (((2..7) * ((3..7)/20)) * Stepper.kr( Impulse.kr(1/[8,12]),0, 60 ,[180,420], 60 ) ) ) ! 2 / 15
};

~oscbazz2 = {
   SinOsc.ar( (((12..17) * ((3..7))) * Stepper.kr( Impulse.kr(1*[8,12]),0, 60 ,[180,420,960], 60 ) * [1,1/3]) ) ! 2 / 15
};

~y = {
   SinOsc.kr(1/[3,16],0,1,[0.1,2/3])
};


)

(

)


~oscbazz1 = {
   SinOsc.ar( (((2..7) * ((3..7)/20)) * Stepper.kr( Impulse.kr(1/[8,12]),0, 60 ,[180,420], 60 ) ) ) ! 2 / 15
};

~oscbazz2 = {
   SinOsc.ar( (((12..17) * ((3..7))) * Stepper.kr( Impulse.kr(1*[8,12]),0, 60 ,[180,420,960], 60 ) * [1,1/3]) ) ! 2 / 15
};

~y = {
   SinOsc.kr(1/[3,16],0,1,[0.1,2/3])
};





~oscbazz1 = {
   SinOsc.ar( (((2..7) * ((3..7)/20)) * Stepper.kr( Impulse.kr(1/[8,12]),0, 60 ,[180,420], 60 ) ) ) ! 2 / 15
};

~oscbazz2 = {
   SinOsc.ar( (((12..17) * ((3..7))) * Stepper.kr( Impulse.kr(1*[8,12]),0, 60 ,[180,420,960], 60 ) * [1,1/3]) ) ! 2 / 15
};

~y = {
   SinOsc.kr(1/[3,16],0,1,[0.1,2/3])
};


p.quant_(4)

~beat[0]= { ( Decay2.kr(Impulse.kr(1/[2,3,7]),0.01,0.1) * ~oscbazz1.ar * 800 ).tanh * 3 };
~beat[1]= { ( Decay2.kr(Impulse.kr(1*[2,3,7]),0.01,0.1) * ~oscbazz1.ar * 300 ).tanh };
~beat[2]= { ( Decay2.kr(Impulse.kr(1*[2,3,7]),0.01,0.1) * ~oscbazz2.ar * 300 ).tanh / 4 };
~beat[3]= { ( Decay2.kr(Impulse.kr(3),0.01,0.4) * ~oscbazz1.ar * 433 ).tanh * ~beat[0] * 10 };

~beat[4]= \filter -> {|in| ( in / 2 ) + (in*13).tanh  };
~beat[5]= \filter -> {|in| ( in ) + FreeVerb.ar(~beat[0], 1, 2/3, 3/4 )  };
~beat[6]= \filter -> {|in| ( in ) + Resonz.ar(FreeVerb.ar(~beat[3], 1, 2/3, 3/4 )*2, (36+[2,3,4,7,11,15]).midicps, 1/100)  };

~beat[7]= { ( Decay2.kr(Impulse.kr(2),0.01,0.7) * ~oscbazz1.ar * 2433 ).tanh * ~beat[0] };

~beat[6]= \filter -> {|in| ( in ) / 1 };


~tk[0] = { Impulse.ar( 1*(2..9), 1/(3..7)) }
~tk[1]= \filter -> {|in| in/2 + RLPF.ar(FreeVerb.ar(in,1/3,1/3,1/3),(54+[2,3,4,7,11,15]+Stepper.kr( Impulse.kr(1/[3,5]),0, 0 , [7, 11], 3 )).midicps,1/100)}
~tk[2]= \filter -> {|in| (in*Stepper.kr( Impulse.kr(1/[3,5]),0, 60 ,[180,420], 60 )).tanh }
~x = ~oscbazz1 * ~y
~x = ~oscbazz1 * ~y + ~oscbazz2 * ~y
~x.stop

~mix.play
~mix = ~x
~mix = ~x + ~tk
~mix = ~tk
~mix = ~tk + ~beat
~mix = ~x + ~beat + ~tk
~mix = ~x + ~beat
~mix = ~beat

~mix.fadeTime = 45
~mix = 0
