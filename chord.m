function[]=chords()
    global chord; %create a global variable to use throughout gui
    chord.fig=figure('numbertitle','off','name','Music Chord'); %create a figure to place the gui on
    chord.message1=uicontrol('style','text','units','normalized','position',[.10 .70 .85 .30],'string',...
        'This GUI was designed so that you, the user, can interact with two notes to learn more about what kind of chord is created when the two notes are played at once. It will also display one of the locations of the note on a musical staff. Disclaimer, the information provided here is limited. It does not take into account sharps or flats and does not include an octave. This is the very basic, generic introduction to chords and intervals. Enjoy!',...
        'horizontalalignment','center'); %this is introduction text for disclaimers
    chord.message2=uicontrol('style','text','units','normalized','position',[.10 .50 .85 .30],'string',...
        'Select two rectangular boxes to learn more about the chord created. Click the circular button to view an image of the note on a musical staff.','horizontalalignment','center');
    
    chord.noteADisplay=uicontrol('style','text','units','normalized','position',[.14 .50 .09 .095],'string',...
        'Note A','horizontalalignment','center'); %title/text for the note A
    chord.noteBDisplay=uicontrol('style','text','units','normalized','position',[.24 .50 .09 .095],'string',...
        'Note B','horizontalalignment','center'); %title/text for the note B
    chord.noteCDisplay=uicontrol('style','text','units','normalized','position',[.34 .50 .09 .095],'string',...
        'Note C','horizontalalignment','center'); %title/text for the note C
    chord.noteDDisplay=uicontrol('style','text','units','normalized','position',[.44 .50 .09 .095],'string',...
        'Note D','horizontalalignment','center'); %title/text for the note D
    chord.noteEDisplay=uicontrol('style','text','units','normalized','position',[.54 .50 .09 .095],'string',...
        'Note E','horizontalalignment','center'); %title/text for the note E
    chord.noteFDisplay=uicontrol('style','text','units','normalized','position',[.64 .50 .09 .095],'string',...
        'Note F','horizontalalignment','center'); %title/text for the note F
    chord.noteGDisplay=uicontrol('style','text','units','normalized','position',[.74 .50 .09 .095],'string',...
        'Note G','horizontalalignment','right'); %title/text for the note G
    
    chord.noteAToggle=uicontrol('style','togglebutton','units','normalized','position',[.16 .40 .04 .04],...
        'callback',{@push}); %toggle button to build a chord with note A, activates callback push
    chord.noteBToggle=uicontrol('style','togglebutton','units','normalized','position',[.26 .40 .04 .04],...
        'callback',{@push}); %toggle button to build a chord with note B, activates callback push
    chord.noteCToggle=uicontrol('style','togglebutton','units','normalized','position',[.36 .40 .04 .04],...
        'callback',{@push}); %toggle button to build a chord with note C, activates callback push
    chord.noteDToggle=uicontrol('style','togglebutton','units','normalized','position',[.46 .40 .04 .04],...
        'callback',{@push}); %toggle button to build a chord with note D, activates callback push
    chord.noteEToggle=uicontrol('style','togglebutton','units','normalized','position',[.56 .40 .04 .04],...
        'callback',{@push}); %toggle button to build a chord with note E, activates callback push
    chord.noteFToggle=uicontrol('style','togglebutton','units','normalized','position',[.66 .40 .04 .04],...
        'callback',{@push}); %toggle button to build a chord with note F, activates callback push
    chord.noteGToggle=uicontrol('style','togglebutton','units','normalized','position',[.76 .40 .04 .04],...
        'callback',{@push}); %toggle button to build a chord with note G, activates callback push
    
    chord.noteARadio=uicontrol('style','radiobutton','units','normalized','position',[.16 .45 .1 .1],...
        'callback',{@disp,1}); %radiobutton to display image of note on staff
    chord.noteBRadio=uicontrol('style','radiobutton','units','normalized','position',[.26 .45 .1 .1],...
        'callback',{@disp,2}); %radiobutton to display image of note on staff
    chord.noteCRadio=uicontrol('style','radiobutton','units','normalized','position',[.36 .45 .1 .1],...
        'callback',{@disp,3}); %radiobutton to display image of note on staff
    chord.noteDRadio=uicontrol('style','radiobutton','units','normalized','position',[.46 .45 .1 .1],...
        'callback',{@disp,4}); %radiobutton to display image of note on staff
    chord.noteERadio=uicontrol('style','radiobutton','units','normalized','position',[.56 .45 .1 .1],...
        'callback',{@disp,5}); %radiobutton to display image of note on staff
    chord.noteFRadio=uicontrol('style','radiobutton','units','normalized','position',[.66 .45 .1 .1],...
        'callback',{@disp,6}); %radiobutton to display image of note on staff
    chord.noteGRadio=uicontrol('style','radiobutton','units','normalized','position',[.76 .45 .1 .1],...
        'callback',{@disp,7}); %radiobutton to display image of note on staff
    
    chord.reset=uicontrol('style','pushbutton','units','normalized','position',[.60 .15 .25 .06],...
        'string','Reset','callback',{@reset}); %button to reset the toggle activation, calls callback function reset
    
    chord.backgroundInfo=uicontrol('style','pushbutton','units','normalized','position',[.12 .15 .25 .06],...
        'string','Background Information','callback',{@info}); %background information push button for music, goes to callback function info
end

function[]=push(source,event)
    global chord; %allows us to use global variable
    if chord.noteAToggle.Value==1&&chord.noteBToggle.Value==1
        makeChord(1,2); %if the value of the note A toggle is 1, the toggle button of note A has been
                        %pushed and needs to be paired with the
                        %activated note B toggle button to create a chord
                        %if/when both are selected, calls the function
                        %makeChord with specified note numbers
    elseif chord.noteAToggle.Value==1&&chord.noteCToggle.Value==1
        makeChord(1,3); %both the note A and note C toggles have been pushed
                        %calls the makeChord function with specified note
                        %numbers
    elseif chord.noteAToggle.Value==1&&chord.noteDToggle.Value==1
        makeChord(1,4);
    elseif chord.noteAToggle.Value==1&&chord.noteEToggle.Value==1
        makeChord(1,5);
    elseif chord.noteAToggle.Value==1&&chord.noteFToggle.Value==1
        makeChord(1,6);
    elseif chord.noteAToggle.Value==1&&chord.noteGToggle.Value==1
        makeChord(1,7);
    elseif chord.noteBToggle.Value==1&&chord.noteCToggle.Value==1
        makeChord(1,2);
    elseif chord.noteBToggle.Value==1&&chord.noteDToggle.Value==1
        makeChord(1,3);
    elseif chord.noteBToggle.Value==1&&chord.noteEToggle.Value==1
        makeChord(1,4);
    elseif chord.noteBToggle.Value==1&&chord.noteFToggle.Value==1
        makeChord(1,5);
    elseif chord.noteBToggle.Value==1&&chord.noteGToggle.Value==1
        makeChord(1,6);
    elseif chord.noteCToggle.Value==1&&chord.noteDToggle.Value==1
        makeChord(1,2);
    elseif chord.noteCToggle.Value==1&&chord.noteEToggle.Value==1
        makeChord(1,3);
    elseif chord.noteCToggle.Value==1&&chord.noteFToggle.Value==1
        makeChord(1,4);
    elseif chord.noteCToggle.Value==1&&chord.noteGToggle.Value==1
        makeChord(1,5);
    elseif chord.noteDToggle.Value==1&&chord.noteEToggle.Value==1
        makeChord(1,2);
    elseif chord.noteDToggle.Value==1&&chord.noteFToggle.Value==1
        makeChord(1,3);
    elseif chord.noteDToggle.Value==1&&chord.noteGToggle.Value==1
        makeChord(1,4);
    elseif chord.noteEToggle.Value==1&&chord.noteFToggle.Value==1
        makeChord(1,2);
    elseif chord.noteEToggle.Value==1&&chord.noteGToggle.Value==1
        makeChord(1,3);
    elseif chord.noteFToggle.Value==1&&chord.noteGToggle.Value==1
        makeChord(1,2);
    else
        return; %if something goes wrong, return to the main function
    end
end

function[]=disp(source,event,pic)
    figure
    if pic==1
        trebleA=imread("C:\Users\reich\Desktop\UNL 2020-2021\Computer Science\noteA"); %reads the image from my computer
        imshow(trebleA,[.2 .6]) %displays the image saved in the variable
        reset
    elseif pic==2
        trebleB=imread("C:\Users\reich\Desktop\UNL 2020-2021\Computer Science\noteB.png");
        imshow(trebleB,[.2 .6])
        reset
    elseif pic==3
        trebleC=imread("C:\Users\reich\Desktop\UNL 2020-2021\Computer Science\noteC.png");
        imshow(trebleC,[.2 .6])
        reset
    elseif pic==4
        trebleD=imread("C:\Users\reich\Desktop\UNL 2020-2021\Computer Science\noteD.png");
        imshow(trebleD,[.2 .6])
        reset
    elseif pic==5
        trebleE=imread("C:\Users\reich\Desktop\UNL 2020-2021\Computer Science\noteE.png");
        imshow(trebleE,[.2 .6])
        reset
    elseif pic==6
        trebleF=imread("C:\Users\reich\Desktop\UNL 2020-2021\Computer Science\noteF.png");
        imshow(trebleF,[.2 .6])
        reset
    else
        trebleG=imread("C:\Users\reich\Desktop\UNL 2020-2021\Computer Science\noteG.jpg");
        imshow(trebleG,[.2 .6])
        reset
    end
end

function[]=reset(source,event)
    global chord; %establish global variable to use in function
    chord.noteAToggle.Value=0; %resets the value of the togglebutton to 
    chord.noteBToggle.Value=0; %off in order to be pushed again
    chord.noteCToggle.Value=0;
    chord.noteDToggle.Value=0;
    chord.noteEToggle.Value=0;
    chord.noteFToggle.Value=0;
    chord.noteGToggle.Value=0;
    
    chord.noteARadio.Value=0; %resets the radio button value to off to be
    chord.noteBRadio.Value=0; %pushed again
    chord.noteCRadio.Value=0;
    chord.noteDRadio.Value=0;
    chord.noteERadio.Value=0;
    chord.noteFRadio.Value=0;
    chord.noteGRadio.Value=0;
end

function[]=makeChord(note1,note2)
    if note1==1&&note2==2 %takes the specified numbers from push callback 
                            %and matches the notes to create a chord
                            %also provides info on the chord
        msgbox('This chord is called a Second. These notes are only two spots away from each other, including the spot of the first note. A famous example of this chord is the very beginning of the "Happy Birthday Song".','modal');
        reset %resets the toggle button back to off
    elseif note1==1&&note2==3
        msgbox('This chord is called a Third. These notes are three spots away from each other. Thirds are commonly used in harmonizing, and are easily heard because of how nicely the frequencies of the notes line up. A famous example of a third is the song "When the Saints go Marching In.','modal');
        reset
    elseif note1==1&&note2==4
        msgbox('This chord is called a Fourth. These notes are four spots away from each other. They are found in many chords and often serve as a basis for tuning. A few famous examples of fourths are the beginnings of "Here Comes the Bride" and "Amazing Grace.','modal');
        reset
    elseif note1==1&&note2==5
        msgbox('This chord is called a Fifth. These notes are five spots away from each other. Fifths are commonly recognized because the frequency of how "in tune" the notes are. A few famous examples of fifths are the beginning two notes of "Twinkle Twinkle Little Star" and "The ABC Song" (which, I might add, are the same song).','modal');
        reset
    elseif note1==1&&note2==6
        msgbox('This chord is called a Sixth. Sixths are not quite as recognizable as Fifths or Thirds but are still important in building chords. A famous example of a sixth is in the the first two notes of the song "My Bonnie Lies Over the Ocean".','modal');
        reset
    elseif note1==1&&note2==7
        msgbox('This chord is called a Seventh. Sevenths are not commonly used because of how the frequencies do not line up and often clash. A famous example of a seventh is in the beginning of the chorus of the song "Take On Me" by A-ha.','modal');
        reset
    else
        msgbox('Please choose another note','modal'); %insurance in case all else fails
    end
end

function[]=info(source,event)
     msgbox('Music is written on a collection of line and spaces called a staff. Typically, there are five lines with four spaces in between and it can be expanded if needed. Each note has its respective space or line on the staff. Chords are made based on the distance between the notes on the staff.','modal');
     %activated by a pushbutton to create a messagebox that provides needed
     %background info on music
end