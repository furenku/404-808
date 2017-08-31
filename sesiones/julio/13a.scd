(
~z[0] = {|notes=#[0,3,5,10]|
   FreeVerb.ar(SinOsc.ar(([48,60]+notes).midicps,0,SinOsc.kr(~tempo.kr/SinOsc.kr(~tempo.kr/16,0.4,0.5),0,14,15)).tanh,2/3,2/3)/2 ! 2
}

)


c = [
   [2,5,8,12],
   [0,3,7,10],
   [4,7,11,14],
   [7,11,14,17],
];

Tdef(\armonia,{inf.do{|i|
   ~z.setn(\notes,c[i%3]);
   [2,4,8].choose.wait;
}}).play;
