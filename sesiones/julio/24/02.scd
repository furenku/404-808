~mix = ~zz
~lfpp = { LFPulse.kr(~tempo.kr/8,1/8,[0,3,7]/8,1,1/3) }

~zz[0] = { Ringz.ar(CoinGate.ar((1..3)/8,Impulse.ar(~tempo,[0,1,3]/8)),(~lfpp.kr*[36,43]+[0,3,4]).midicps) ! 2 }

~zz[1] = { Ringz.ar(CoinGate.ar(~lfpp.kr*(1..3)/8,Impulse.ar(~tempo*2,[0,1,3]/8)),(~lfpp.kr*[36,43]+[0,3,4]).midicps) / 4 ! 2 }

~zz[2] = \filter -> {|in| (RLPF.ar((in*1444).tanh,~lfpp.kr*[24,36,57].midicps,0.1) * 2).tanh }

~zz = 0

~zz.fadeTime=4



s.stopRecording
