%This program convers Dragonfly UCT images intensity into density in g/cm^3
%Author: Yihua Zhu
%Instructions:
    %1. On Dragonfly, right click image property, and change Offest to 0
        %and slope to 1
    %2. Run the program
    %3. Use the probe function on dragonfly to measure and input the
        %average intesntiy inside the following ROIs: Enamel, Dentin, Water
    %4. Click OK
    %5. Input the Offset and Slope values into Dragonfly, and click apply
    %6. Reset data display range and intensity value is now in density (g/cm^3)

 clearvars;
 %Create Prompt to input Dragonfly UCT iamge values
 name = 'Please input image information from ORS Dragonfly';
 prompt = {'Enamel Mean Intensity','Dentin Mean Intensity','Water Mean Intensity'};
 defaultanswer = {'9000','3600','-1500'};
 answer = inputdlg(prompt,name,1,defaultanswer);
 %Tooth Structural Density
 enameldensity = 3;
 dentindensity = 2.1;
 waterdensity = 1;
 %Create arrays to fit data
 raw_x = [answer(1) answer(2) answer(3)];
 x = str2double(raw_x);
 y = [enameldensity dentindensity waterdensity];
 %Fit data linearly
 p = polyfit(x,y,1);
 slope = p(1);
 offset = p(2);
 %Display Slope and Offset
 message = sprintf('Slope = %.9f\nOffset = %.3f', slope, offset);msgbox(message);
 fprintf('slope = %f\n', slope);
 fprintf('offset = %f\n', offset);


