s=Server.local;//.boot;

p=ProxySpace.push(s);
p.quant=4;

~out.play;
~out.fadeTime = 10

~base = 40;

~pan = { [~mix.ar,DelayC.ar(~mix.ar,0.2,LFSaw.kr(1/10)/100) ] };
~out = { Limiter.ar( Compander.ar( Pan2.ar( ~pan.ar ),0,0.2,1,1,1/20,1/3 ) ) * 1/8 } ;


~mix = { (~fx1.ar * 3 ).wrap2(1) + ~btk.ar }

~mix = { Compander.ar( ~bajo1.ar + ~bajo2.ar, ~bmb.ar,1/8,1.5,1/2,1/20, SinOsc.kr(1/5,0,3/4,1)) }
~mix = { Compander.ar( ~bajo1.ar + ~bajo2.ar, ~bmb.ar,1/8,1.5,1/2,1/20, SinOsc.kr(1/5,0,3/4,1))/2 + ~btk.ar }


~mix = { ~fx1.ar }
~mix = { ~bajo2.ar }

~ff1=~bajo1;
~ff1=~bajo2;
~ff1=~bajo1 + ~bajo2;
~ff1=~bmb2;

~fx1 = {|in| RLPF.ar( GVerb.ar( ~ff1.ar), SinOsc.kr(0.05,0,3000,5000),1/2) };

~bajo1 = { LFSaw.ar(~base*[1,4,7,8])  * LFPulse.kr([1,3]/3,[0,2,4,7,7.3]/8,0.1) };
~bajo2 = { LFPulse.ar(~base*[1,2,3,7,10])  * LFPulse.kr([1,3]/3,[0,2,4,7,7.3]/8,0.1) };


~dist = 3.13;

~mix = ~btk
~btk  = ~bmb + ~bmb2
~bmb={(	Decay2.kr( Impulse.kr(1,1/2),1/200,1/20) * SinOsc.ar(~base*[1,2,15,40],0,1/[1,4,5,3]/2) *  ~dist * 2 ).wrap2(1)	}
~bmb2={(	Decay2.kr( Impulse.kr(2,1/[2,8,16.25]),1/20,1/16) * LFSaw.ar(~base*[1,2,15,20]) *  ~dist* 1).wrap2(1)	}