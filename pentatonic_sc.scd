(
~pen = {
arg a;
var note = [0, 2, 4, 7, 9];
var b = (a / 5).floor;
var c = a % 5;
var d = note[c];
var e = b * 12 + d;
e;
}
)

~pen.value(20);

~fo = {arg x = 3; x}
a = ~fa

(
SynthDef(\sine, {
	arg freq;
	var sine = SinOsc.ar((freq+50).midicps!2);
	var env = Line.kr(1, 0, 3, doneAction: 2);
	var mix = sine * env;
	Out.ar(0, mix);
}).add;
)

(
OSCdef(\test, {
	arg msg;
	var note;
	msg[1].postln;
	note = ~pen.value(msg[1]);
	note.postln;
	Synth(\sine, [\freq, note]);
}, "/unity", recvPort: 5555)
)