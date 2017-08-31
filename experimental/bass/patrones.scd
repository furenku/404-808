(

~z[0] = {|notes=#[0,3,7,9]|
   Ringz.ar(Impulse.ar(~tempo.kr/[2,3,4,5]),([24,36]+notes).midicps) ! 2
};

~z[1] = \filter -> {|in| (in*13).tanh };

~z[2] = \filter -> {|in| RLPF.ar(in,SinOsc.kr(~tempo.kr/[2,3],0,150,300),1/10).tanh };

)

~out.play
(

~z[0] = { LFPulse.ar( ([24,36]+(LFPulse.kr(~tempo.kr/[2,3],[0,1]/2)*[3,9])).midicps )
};
~z[1] = \filter -> {|in| (in*33).tanh };
~z[2] = \filter -> {|in| RLPF.ar(in,SinOsc.kr(~tempo.kr*[4,6],0,150,2500),1/4).tanh };
~z[3] = \filter -> {|in| RLPF.ar(in*30,SinOsc.kr(~tempo.kr/8,0,1500,1750),1/3).tanh };

)




{f=LFPulse;r=RLPF;o=SinOsc;a=[2,3];r.ar(r.ar(f.ar((a*12+(f.kr(1/a,[0,1]/2)*a*3)).midicps),a*111,1/4),o.kr(1/8,0,1500,1750),0.1)}.play// #SC
~z[1] = \filter -> {|in| (in*33).tanh };
~z[2] = \filter -> {|in| RLPF.ar(in).tanh };
~z[3] = \filter -> {|in| RLPF.ar(in*30,SinOsc.kr(~tempo.kr/8,0,1500,1750),1/3).tanh
