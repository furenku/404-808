s.boot;

p=ProxySpace.push(s);


~ritmo = { Decay2.kr( CoinGate.kr(1/[2,4,8,12], Impulse.kr(1*[4,6],[0, 1/3, 0.5]) ) ) }

~beat = { ( Resonz.ar( WhiteNoise.ar, Array.exprand(12,40,8500) * [1/2,1,2.5,3], 1/100 ) * ~ritmo.kr * 20 ).tanh / 4 ! 2 };

~beat.play