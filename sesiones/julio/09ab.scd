(
o = SinOsc;
f = LFPulse;
~g ={f.kr(~tempo.kr*2,0,1/4,7,1);};
~h ={f.kr(~tempo.kr,0,1/4,3,1);};
~z[0] = { o.ar((50/1)*~g,0,o.kr(~tempo.kr/2)) ! 2 };
~z[1] = { o.ar(~g*(75/~g)*f.kr(~tempo.kr/8,1/6,1/3,4,1),0,o.kr(~tempo.kr/4)) ! 2 };
~z[2] = { o.ar(~h*(130/1)*f.kr(~tempo.kr/12,1/10,1/2,5,1),0,o.kr(~tempo.kr/6)) ! 2 };

)

~z[4] =  \filter -> {|in| var of = o.kr(1/32,0,0.1,0.25); FreeVerb.ar(in,of,1-of) }
/*~z[5] =  \filter -> {|in| Ringz.ar(in,133*[1,1.3,1.7],0.000513).tanh/2 }*/
~z[5] =  \filter -> {|in| Ringz.ar(in,133*[1,1.3,1.7],0.063).tanh/2 }
~z[6] =  \filter -> {|in| in/1.5 }

~mix = ~z + ~btk


~z.quant_(4);
~btk.quant_(4);
~btk[0] = {CaosKick.robot(t:~tempo.kr/[1,2,6]).tanh ! 2 };
~btk[1] = {CaosHats.robot(t:~tempo.kr/[1,2,6],tp:1/4).tanh !  2};
~btk[2] = {CaosSnare.robot(t:~tempo.kr/[2,3],tp:[1,3]/4).tanh !  2};
/*~btk[3] =  \filter -> {|in| var of = o.kr(1/32,0,0.1,0.25); FreeVerb.ar(in,of,1-of) }
~btk[4] =  \filter -> {|in| Ringz.ar(in,133*[1,1.3,1.7],0.13).tanh/2 }
~btk[5] =  \filter -> {|in| RLPF.ar(in*1,SinOsc.kr(~tempo.kr/32,0.5,8000,8100),0.01).tanh }*/

~mix = ~z

~mix = 0

s.record
s.stopRecording;
