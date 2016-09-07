~z = 0;//{ WhiteNoise.ar(1/20) ! 2 };

(
~z[0] = { Pulse.ar([75,130]/2,1/3,LFSaw.kr(1/30)) / 3 };
~z[1] = { Pulse.ar([75,130]*3.1,1/3,LFSaw.kr(1/23)) / 10 };
~z[2] = { Pulse.ar([75,130]*4.6,1/3,LFSaw.kr(1/35)) / 10 };
)

~z.fadeTime=10;

~z[3] = \filter -> {|in| ( ( in * 10 ).tanh / 5 )+ in }
~z[4] = \filter -> {|in| FreeVerb.ar( in ) }


~z = 0

~btk[0]= { Ringz.ar( Impulse.ar( 1 ),[200,300,450] * LFPulse.kr(1/8,0,1/[4,9],[2,3],1) ) / 3  ! 2  }

~btk[1]= { Ringz.ar( Impulse.ar( 2 ),0.25*[200,300,450] * LFPulse.kr(1/8,0,1/[4,9],[2,3],1) ) / 3  ! 2  }

~btk[3]= { Ringz.ar( Impulse.ar( 1/2 ),0.0825*[200,300,450] * LFPulse.kr(1/[3,8],0,1/[4,9],[2,3],1) ) / 1  ! 2  }

~btk[4] = \filter -> {|in| FreeVerb.ar( (in*4).tanh ) / 8  + in / 3 }


~btk2[0] = { CaosKick.robot(t:3/[3,7]) }
~btk2[1] = { CaosSnare.robot(t:2/[3,7],tp: 1/[2,2.66]) }
~btk2[2] = { CaosHats.robot(t:3/[2,7],tp: [0,3,7,9,11,13,15]/16) / 2 }


~btk[4] = \filter -> {|in| FreeVerb.ar( (in*12).tanh ) / 6  + in / 3 }

~mix = ~z + ~btk + ~btk2
