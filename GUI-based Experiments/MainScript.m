% This script performs the attention - working memory experiment we are
% implementing in EK 131 Human Brain Mapping

% Stefan Lütschg 2021
clear, clc, close all;
%% Inputs
name = input('What is your name? ');
age = input('How old are you? ');
handedness = input('What is your dominant hand? ');
number_of_trials = input('How many Trials are needed? ');
delay = input('How long should the delay to be? (Enter a number in seconds) ');
repelements = input('Which trials should have repetitions? Enter a vector as [a:b; c:d] ');
reps = input('In what screen locations should the repetitions appear? Enter a 2 element vector [a b] ');
repPics = input('What images should be used in the repetitions? Enter a 2 element vector [a b]');
imagecell = {'imagesmatlab/ADOG43.jpg','imagesmatlab/ADOG51.jpg','imagesmatlab/Adog71.jpg','imagesmatlab/Adog122.jpg', ...
                'imagesmatlab/Adog86.jpg','imagesmatlab/Adog94.jpg','imagesmatlab/Adog120.jpg','imagesmatlab/Alabradordog.jpg', ...
                'imagesmatlab/31214112.thl.jpg','imagesmatlab/ADOG18.jpg','imagesmatlab/ADOG61.jpg','imagesmatlab/30750635.thl.jpg'};
%% Experiment Configuration            
trial_settings = zeros(2,number_of_trials);
trial_settings(1,:) = randi(length(imagecell),1,number_of_trials); % one of X images will be used as a cue
trial_settings(1,repelements(1,:)) = repPics(1);
trial_settings(1,repelements(2,:)) = repPics(2);
trial_settings(2,:) = randi(4,1,number_of_trials); %Target image location
trial_settings(2,repelements(1,:)) = reps(1);
trial_settings(2,repelements(2,:)) = reps(2);

%% Introdouction Figure
intro = figure;
intro.WindowState = 'Maximized';
text(-0.1,0.70,'In this experiment you will focus on a cross in the center of the screen.','FontSize',20);
text(-0.1,0.60,'A cue image will appear briefly on top of the cross and then disappear.','FontSize',20);
text(-0.1,0.50,'An image identical to the cue will appear in one of four locations on the screen. This is the target.','FontSize',20);
text(-0.1,0.40,'Other distracting images will appear at the remaining three locations on the screen','FontSize',20);
text(-0.1,0.30,'You will respond to the location of the target using the numbers 1-4 on the keyboard','FontSize',20);
text(-0.1,0.20,'Press any key to continue','FontSize',20);
axis off;
pause;
clf;
text(-0.10,0.5,'When you are ready to begin the trials, please press any button.','FontSize',20);
axis off;
pause;
close all;
response_time = zeros(1,number_of_trials);
correctness_array = zeros(1,number_of_trials);
%% Experiment Loop
for i = 1:number_of_trials
    cuenumber = trial_settings(1,i);
    image1 = imread(imagecell{trial_settings(1,i)});
    
    distractor2 = randi(length(imagecell));
    while(distractor2 == cuenumber)
        distractor2 = randi(length(imagecell));
    end
    image2 = imread(imagecell{distractor2});
    
    distractor3 = randi(length(imagecell));
    while(distractor3 == cuenumber || distractor3 == distractor2)
        distractor3 = randi(length(imagecell));
    end
    image3 = imread(imagecell{distractor3});
    
    distractor4 = randi(length(imagecell));
    while(distractor4 == cuenumber || distractor4 == distractor2 || distractor4 == distractor3)
        distractor4 = randi(length(imagecell));
    end
    image4 = imread(imagecell{distractor4});
    
    target_location = trial_settings(2,i);
    ParadigmScript(image1,delay,target_location,image2,image3,image4);
    tic;
    pause;
    response = get(gcf,'CurrentCharacter');
    response_time(i) = toc;
    if(str2double(response) == target_location)
        correctness_array(i) = 1;
   else
        correctness_array(i) = 0;
   end
    close all;
end
%% Plotting Data
score = mean(correctness_array) * 100; % Percent Correct
stdScore = std(correctness_array); % Standard Deviation of average score
stderrorScore = stdScore / length(correctness_array); % Standard Error of Score
avgRT = mean(response_time) * 1000; % Average Reaction Time in ms
stdRT = std(response_time) * 1000; % Standard Dev. of Reaction Time in ms
stderrorRT = stdRT / length(response_time); % Standard Error of Average Reaction Time

RTPlot = scatter(1:length(response_time),response_time * 1000,'LineWidth',2); % Plotting points
grid on;
ax = gca;
ax.FontSize = 20;
xlabel('Trial Number','FontSize',20)
ylabel('Reaction Time (ms)','FontSize',20);
title(['Reaction Time with delay ' num2str(delay * 1000) ' ms and similar images']);
save Experiment6 correctness_array score stdScore stderrorScore ...
    response_time avgRT stdRT stderrorRT trial_settings delay;