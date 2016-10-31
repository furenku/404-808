s.boot



(
c = NoteOnResponder({ |src,chan,note,vel|
	        [src,chan,note,vel].postln;
	if( note == 35, {
		Synth(\drum,[\freq, note*vel*100, \amp, vel/127 ]);
		}, {
			Synth(\drum,[\freq, note, \amp, vel/127 ]);
	})
    });
    c.learn; // wait for the first note
)
NoteOnResponder.removeAll