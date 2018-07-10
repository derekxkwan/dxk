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
