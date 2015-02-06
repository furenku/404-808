{e=LFNoise2;f=60*[1,5];h=[3,4];FreeVerb.ar(Blip.ar(Latch.ar(e.kr(1/h,f,f),Dust.kr(1/h)),e.kr(1/5,100,3)),1,e.kr(0.1,1,0))}.play;//#SuperCollider

{t=[1,5,16];z=Impulse.ar(1/t);r=10;f=[60,210];r.do{|i|z=AllpassC.ar(z+RLPF.ar(z,f+(i*f*[0.5,1.5]*t),t/6),0.1,0.1)};z/3!2}.play//#SuperCollider


