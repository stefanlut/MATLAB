function output = ParadigmScript(cue_image,delay,location,dimage2,dimage3,dimage4)
%cue_image is the cued RGB image that will appear in front of the fixation cross
%delay is the time delay between cue and targets in seconds
%location is the location of the target image out of four corners of the
%screen.
h = figure;
axis([0 10 0 10]);
h.WindowState = 'Maximized';
text(4,5,'Press Any Key to Start Trial','FontSize',20);
axis off
pause;
clf; axis off;
axis([0 10 0 10]);
fixation = text(4.85,5,'+','FontSize',60);
hold on;
pause(1);
blacksquare=rectangle('Position',[4,4,2,2]);
set(blacksquare,'FaceColor','k');
cue1 = image('CData',cue_image,'XData',[4.25 5.75],'YData',[5.75 4.25]);
pause(0.5);
clf;
axis([0 10 0 10]);
axis off;
fixation = text(4.85,5,'+','FontSize',60);
pause(delay);
if(location==1)
    target_x = 0;
    target_y = 8;
    distractor2_x = 8;
    distractor2_y = 8;
    distractor3_x = 0;
    distractor3_y = 0;
    distractor4_x = 8;
    distractor4_y = 0;
else
    if(location == 2)
        target_x = 8;
        target_y = 8;
        distractor2_x = 0;
        distractor2_y = 8;
        distractor3_x = 0;
        distractor3_y = 0;
        distractor4_x = 8;
        distractor4_y = 0;
    end
    if(location == 3)
        target_x = 0;
        target_y = 0;
        distractor2_x = 8;
        distractor2_y = 8;
        distractor3_x = 0;
        distractor3_y = 8;
        distractor4_x = 8;
        distractor4_y = 0;
    end
    if(location == 4)
        target_x = 8;
        target_y = 0;
        distractor2_x = 8;
        distractor2_y = 8;
        distractor3_x = 0;
        distractor3_y = 8;
        distractor4_x = 0;
        distractor4_y = 0;
    end
end
blacksquare3=rectangle('Position',[0,0,2,2]);text(2.25, 0,'3','FontSize',30);
set(blacksquare3,'FaceColor','k');
blacksquare1=rectangle('Position',[0,8,2,2]); text(2.25, 8,'1','FontSize',30);
set(blacksquare1,'FaceColor','k');
blacksquare4=rectangle('Position',[8,0,2,2]); text(7.5, 0,'4','FontSize',30);
set(blacksquare4,'FaceColor','k');
blacksquare2=rectangle('Position',[8,8,2,2]); text(7.5, 8,'2','FontSize',30);
set(blacksquare2,'FaceColor','k');
output = image('CData',cue_image,'XData',[target_x + 0.25 target_x + 1.75],'YData',[target_y+1.75 target_y+0.25]);
image('CData',dimage2,'XData',[distractor2_x+0.25 distractor2_x+1.75],'YData',[distractor2_y+1.75 distractor2_y+ 0.25]);
image('CData',dimage3,'XData',[distractor3_x+0.25 distractor3_x+1.75],'YData',[distractor3_y+1.75 distractor3_y+ 0.25]);
image('CData',dimage4,'XData',[distractor4_x+0.25 distractor4_x+1.75],'YData',[distractor4_y+1.75 distractor4_y+ 0.25]);
axis([0 10 0 10]);
end