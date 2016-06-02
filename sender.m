% fsk

% amplitude
A=1;

% sampling frequency
Fs = 44100;

% carrier frequency
b_f = 800;

% frequency offset
delta_f = b_f/4;

%[fn1, fn2] = analyse_noise(Fs);
fn1 = 678;
fn2 = 1375;
[f0, f1, f2, f3] = pick_freq3(fn1, fn2);

% word duration
w_duration = 200/4000;

% bound signal
bound = [1, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1];
w_b = bin2sound2(bound, A, f0, f1,f2, f3, w_duration, Fs); 

% serialize text
b = text2bin('jambon.txt');

% % emulated async
% sound_data = [zeros(1, 15000), w_b];
% sound_data = w_b;

sound_data = bin2sound3(b, A, f0, f1, f2, f3, w_duration, Fs);

% end bound signal
sound_data = [w_b, sound_data, w_b];

%plot(sound_data);

%sound_data = sound_data + (randn(size(sound_data)) * 11);

duration = length(sound_data)/Fs;

%pause;
%sound(sound_data, Fs);
