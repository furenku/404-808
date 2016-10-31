(
~rhythm = {
	arg times=#[1,2,3,4,5,6],
	phases=#[2,4,6,8,10,12],
	muls=#[0.5,0.5,0.5,0.5,0.5,0.5],
	prob=#[0.5,0.5,0.5,0.5,0.5,0.5];

	CoinGate.kr( prob, Impulse.kr( 1 / times, phases / 16, muls ) );

}
)


~z = { ( Resonz.ar( WhiteNoise.ar, Array.exprand(12,60,8500), 0.001 ) * Decay2.kr( ~rhythm.kr, 1/100, 1/3 ) * 130 ).tanh / 2 ! 2 }

~rhythm.setn(\prob,6.geom(1,2)/8 );

~rhythm.setn(\times,6.geom(1,2)/4 );
~rhythm.setn(\phases,6.geom(1,1.5) );


~out.play