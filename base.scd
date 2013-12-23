s=Server.local;//.boot;

p=ProxySpace.push(s);
p.quant=4;

~out.play;
~out.fadeTime = 10

~base = 40;

~pan = { [~mix.ar,DelayC.ar(~mix.ar,0.2,LFSaw.kr(1/10)/100) ] };
~out = { Limiter.ar( Compander.ar( Pan2.ar( ~pan.ar ),0,0.2,1,1,1/20,1/3 ) ) * 1/8 } ;


~mix = { (~fx1.ar * 3 ).wrap2(1) + ~btk.ar }
