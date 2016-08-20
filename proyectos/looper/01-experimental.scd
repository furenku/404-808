s.boot;

().play

(
   SynthDef(\looper, {

      arg bufnum, t_reset;

      var inputSig, outputSig, existingSig, recHead;

      inputSig = AudioIn.ar(1);

      recHead = Phasor.ar(t_reset, BufRateScale.kr(bufnum), 0, BufFrames.kr(0));

      existingSig = BufRd.ar(1, bufnum, recHead);

      BufWr.ar(inputSig + existingSig, bufnum, recHead);

      Out.ar(0, existingSig);

   }).add;


   b = Buffer.alloc(s, 3 * s.sampleRate, 1);

   ~looper = Synth.new(\looper, [\bufnum, b.bufnum]);

   ~looper.set(\t_reset, 1);

   Tdef(\looper, {
      inf.do{|i|
         ~looper.set(\t_reset, 1);
         2.wait;
      }
   }).stop;

)
