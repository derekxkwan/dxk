//basically a compilation of stuff in sc-miscellany

~amixer = {|device = "Master", level = 50|
	format("amixer set % %", device, level).unixCmd;
	
};

~amixerGUI = {
	var win, curx, cury, slidw, slidh, ww, wh, ctrls, boxh, myspec, vmarg, hmarg, idx;
	hmarg = 5;
	vmarg = 5;
	slidh = 200;
	slidw = 75;
	curx = hmarg;
	cury = vmarg;
	boxh = 30;
	myspec = ControlSpec.new(0, 127, \lin, 1);
	ctrls = [(label: "Master"), (label: "Headphone"), (label: "Speaker")];
	ww = ((ctrls.size+1)*hmarg+(ctrls.size*slidw));
	wh = (vmarg * 4) + (boxh*2)+slidh;
	win = Window.new("amixer", Rect(500, 500, ww, wh)).front;
	idx = 0;
	ctrls.do({|cur|
		var slider, numbox, mytext, device;
		device = cur.at(\label);
		mytext = StaticText(win, Rect(curx, cury, slidw, boxh));
		mytext.string = device;
		mytext.align = \center;
		mytext.font = Font(size: 14);
		cury = boxh + cury + vmarg;
		slider = Slider.new(win, Rect(curx, cury, slidw, slidh));
		cury = slidh + vmarg + cury;
		numbox = NumberBox(win, Rect(curx, cury, slidw, boxh));
		numbox.value = 0;
		
		slider.addAction({|sl|
			var curval = myspec.map(sl.value);
			~amixer.value(device, curval);
			numbox.value = curval});
		
		cur.put(\text, mytext);
		cur.put(\slider, slider);
		cur.put(\numbox, numbox);

		//increment
		curx = curx + hmarg + slidw;
		cury = vmarg;
	});


};

///a simple sound loader
~sndload = {
FileDialog.new(
	{|paths|
			if( b.class != Array, {b = [];});
		paths.do({|path|
			b = b.add(Buffer.read(s,path));
		});
	});
	b.postln;
};

//credit to h. james harkins
Event.addEventType(\polyInstr, { |server|
    ~instrument.do { |instr|
        // the main event being played now is accessible through currentEnvironment
        currentEnvironment.copy
        .put(\instrument, instr)
        .put(\type, ~subtype ?? { \note })
        .play;
    };
});

~loadsynths = {
	
	var path, files;
	path = "/home/user/dxkSynthDefs/";
	files = pathMatch(path ++ "dxk*.scd") ++ pathMatch(path ++ "not*.scd");
	files.size.postln;
	files.do({|curfile|
		this.executeFile(curfile);
	});
};

// tap tempo gui
~taptempo = {
	var time_now, cur_win, bpsbox, bpmbox, secbox, win, tap_button, tap_callback;
	time_now = AppClock.beats;
	tap_callback = {|evt|
		var cur_time = AppClock.beats;
		var time_since = cur_time - time_now;
		time_now = cur_time;
		secbox.value = time_since;
		bpsbox.value = 1.0/time_since;
		bpmbox.value = 1.0/time_since * 60.0;
	};
	cur_win = Window.new("taptempo", Rect(50, 500, 200, 200));
	secbox = EZNumber(cur_win, Rect(0, 0, 200, 30),"sec", ControlSpec(0,99999),initVal: 1);
	bpsbox = EZNumber(cur_win, Rect(0, 30, 200, 30),"bps", ControlSpec(0,99999),initVal: 1);
	bpmbox = EZNumber(cur_win, Rect(0, 60, 200, 30),"bpm", ControlSpec(0,99999),initVal: 60);
	tap_button = Button(cur_win, Rect(0, 100,2000,100));
	tap_button.states = [["TAP", Color.black, Color.green]];
	tap_button.action = {|evt| tap_callback.value(evt)};
	

	cur_win.front;

};

//converts note names (symbols or strings) to midinotes

~noteToMidi = {|note|
	var cleaned = note.asString.toLower;
	var octave_pair = cleaned.findRegexp("[0-9]+");
	var octave = if(octave_pair.size > 0, octave_pair[0][1], 4).asInt;
	var my_note = if(octave_pair.size > 0, cleaned.copyFromStart(octave_pair[0][0] - 1),
		cleaned);
	var note_name = my_note[0].asString;
	var midinote = 0;
	var detune = 0;


	if(my_note.size > 1,
		switch(my_note.copyToEnd(1),
			"b", {detune = -1},
			"bb", {detune = -2},
			"#", {detune = 1},
			"##", {detune = 2}
		));


	switch(note_name,
		"c", {midinote = 12},
		"d", {midinote = 14},
		"e", {midinote = 16},
		"f", {midinote = 17},
		"g", {midinote = 19},
		"a", {midinote = 21},
		"b", {midinote = 23}
	);

	midinote = (midinote + (octave.clip(0,99999) * 12)) + detune;
};
