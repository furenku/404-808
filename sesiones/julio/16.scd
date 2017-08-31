(
   ~z[0] = {|notes=#[0,3,7,10]| SinOsc.ar( ([36,43,48]+notes).midicps, SinOsc.kr(~tempo.kr/4,0,1/2,1/2), 3*SinOsc.kr(~tempo.kr/[2,6], 0, 3, 3
    )).tanh ! 2 };
~z[1] = {|notes=#[0,3,7,10]| SinOsc.ar( ([36,43,48]+notes).midicps, SinOsc.kr(~tempo.kr/7,0,1/2,1/2), 3*SinOsc.kr(~tempo.kr/[6,9], 0, 6, 6
    )).tanh ! 2 };
~z[2] = {|notes=#[0,3,7,10]| SinOsc.ar( ([36,43,48]+notes).midicps, SinOsc.kr(~tempo.kr/10,0,1/2,1/2), 3*SinOsc.kr(~tempo.kr/[10,12], 0, 9, 9
    )).tanh ! 2 };
    )


(
c = [
[0,3,7,10],
[2,5,9,12],
[5,8,12,15],
[10,13,17,20],
];

Tdef(\armonia,{inf.do{|i|

~z.setn(\notes,c.choose);

[1/4,2,4,3].choose.wait;
}}).play;

)
