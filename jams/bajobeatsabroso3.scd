s=Server.local;//.boot;

p=ProxySpace.push(s);
p.quant=4;

~out.play
~out.fadeTime = 0

~base = 40;


~out = { Limiter.ar( Compander.ar( Pan2.ar( [~mix.ar,DelayC.ar(~mix.ar,0.2,LFSaw.kr(1/10)/100) ] ),0,0.2,1,1,1/20,1/3 ) ) } ;

~mix = { Pan2.ar( (  ~baho.ar + ~btk.ar).wrap2(SinOsc.ar(1/10,0,0.3,0.6))+ RLPF.ar(~bmb.ar  * 30,80,0.2)  )};
~mix = ~baho + ~btk  ;
~mix = ~baho;

~btk = { RLPF.ar( WhiteNoise.ar , [1,4,7,15]*[100,1133],1/135 ) * LFPulse.ar([1/2,2,4]*4,[0,3]/10,0.01 ) }

~bmb = { RLPF.ar( WhiteNoise.ar , [0.4,10,4.8,7,13]*[100,1133],1/76 ) * LFPulse.ar([1/2,1]/2,[0,3]/10,0.05 ) }

~baho = { Compander.ar( LFSaw.ar(Lag2.kr(~base*[1,10,100],0.1,0.1), [0.1,LFSaw.kr(1/10)] )* LFPulse.ar([1/2,2,3]/3,[3,6,9]/10,0.1 ) , ~bmb.kr,0.3,1.5,1/2,1/10,1/3 )  };
