~pulso= {LFPulse.kr(1/2,[1,5,12]/16,[2,5,8]/32,2,1)}
~z[0]={|freq=110| f=LFPulse; LFPulse.ar(freq*~pulso.kr)/8!2}
~z[1]=\filter->{|in| FreeVerb.ar(in,1,1) }
~z[2]={|freq=110|o=SinOsc.kr(1/16,0,0.3,0.55); f=LFPulse; (LFPulse.ar((freq/[3,4])*~pulso.kr,o,1-o)).tanh!2}


~z[3] = \set -> Pbind(
    \degree, Pseq([[0,3,7,11],[2,5,9,15]], inf),
    \dur, Pseq(8*([1,3,7,11].reciprocal), inf),

)
