clear all, close all 

global y t_previous e_previous  % variables that we'll need to access within the audio_analysis function

recording_length = 7;                                           % length of time to record for
recObj = audiorecorder(8000,16,1);                              % settings for audio recorder
set(recObj, 'TimerPeriod', 0.1, 'TimerFcn', @audio_analysis);   % specify frequency with which data is returned

record(recObj,recording_length)                                 % start recording
tic                                                             % start the clock
y = 0;                                                          % set initial conditions
t_previous = 0;
e_previous = 0;


function [all_sound_data] = audio_analysis(h,~) 
    global y t_previous e_previous
   
    all_sound_data = getaudiodata(h, 'double');                 % record the sound signal
    clip = all_sound_data(end-768:end);                         % get the most recent sound clip
    r = sum(abs(clip));                                         % define the reference as the magnitude of the sound clip

    dt = toc - t_previous;  
    
    % time between last time clip recording and now, note: toc = the time elapsed since tic
    t_previous = toc;                                           % update t_previous because the current time will be the previous time in the next iteration

    % --- Feedback control implementation ---
    K = 0.5;
    Kd = 0.01;
    

    e = r-y; % Error calculation
    edot = (e_previous - e)/dt;
    u = K*e + Kd*(-1*edot); % Calculate control signal
    y = y + u;
    e_previous = e;        
    plot(toc, r, 'rx', toc, y, 'go'); hold on
    axis([0 7 0 50]); xlabel('t (sec)'); legend('r', 'y')
    
end
