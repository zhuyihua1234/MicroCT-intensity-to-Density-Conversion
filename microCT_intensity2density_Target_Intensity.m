%This program convers Dragonfly UCT images intensity into density in g/cm^3
%Author: Yihua Zhu
%Instructions:
    %1. Run the program
    %2. Use the probe function on dragonfly to measure and input the
        %average intesntiy inside the following ROIs: Enamel, Dentin, Water
    %3. Click OK

 clearvars;
 %Create Prompt to input Dragonfly UCT iamge values
 name = 'Please input image information from ORS Dragonfly';
 prompt = {'Enamel Mean Intensity','Dentin Mean Intensity','Water Mean Intensity', 'ROI intensity1'};
 defaultanswer = {'9000','3600','-1500','20000'};
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
 ROIintensity = cell2mat(answer(4));
 %ROIintensity2 = cell2mat(answer(5));
 intensity = str2num(ROIintensity);
 %intensity2 = str2num(ROIintensity2);
 %Get Density reading from intensity value
 density = slope * intensity + offset;
 %density2 = slope * intensity2 + offset;

 %Display ROI density
 fprintf('density = %f\n', density);
 %fprintf('density2 = %f\n', density2);



