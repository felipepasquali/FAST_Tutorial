%%
%%%%%%%%%%%%% EXERCISE 1 %%%%%%%%%%%%%

% The code from the Tutorial - Part 4 read the wind file (Inflow file) into a
% struct in matlab. Then we found, in that struct, the line corresponding  
% to the wind speed. We modified that line within the for loop and generated 
% responses for each of the wind speeds. Finally we plotted the values.
% Exercise 1 fo
% 
% In Exercise 1 you will conduct a parametric study of the tower diameter and 
% thickess.Use part 4 of the tutorial as a reference. Run 3 configurations of 
% fore-aft stifness using a for loop.

% The objectives are:
% a - produce a plot with the time series data of all the configurations. The 
% y axis is of Fore-Aft Moment on the root of the tower (TwrBsMyt) and x axis
% is the Time (s).
% b - find the max of moment for each one of the 10 configurations. Plot the
% inertia vs 
% 
% HINTS:

Fast = 'C:\FAST\bin\FAST_x64.exe';
FASTSimulationToolbox = 'C:\FAST\Utilities\MATLAB_Toolbox';
addpath( genpath( FASTSimulationToolbox ) );
% 1 - Copy and adapt part 4 of the tutorial.

% 1- Add Simulation ToolBox to Matlab Path

% 2 - Change the template to the tower template("C:\FAST-Test\AWT27\AWT_Tower.dat")

% 3 - Create a new template for the ElastoDyn file. Go to MyTest.fst and find
% the name of the Elastodyn File.

% 4 - Open the template and add the "TwrBsMyt" as and output channel

% 5 - Change Output files to your tower file. Ex: C:\FAST-Test\AWT27\MyTempTowerFile.dat

% 6 - Create an output file for your ElastoDyn. Ex: C:\FAST-Test\AWT27\MyElastoDynFile.dat

% 7 - Change the input to FAST2Matlab to adapt to your tower. 

% 8 - Add code to read Elastodyn.

% 9 - Explore the "TowerPars" struct and find the location of the Tower
% Properties. Adapt the code to find in which column corresponds to the ForeAft Stifness.

% 10 - Find the tower file line in the ED struct.

% 11 - Add code to find the elastodyn file line number. Similarly to what was done
% for WindSpeedLine in part 4.

% 12 - Define a range of Inertias varying from the original. Note. If you
% supply values that are too small the simulation may not run.

% 13 - Inside the loop, update the Tower properties. Export the new tower
% file. 

% 14 - Inside the loop, update ElastoDyn file with new tower file name and
% export. 
 
% 15 - Repeat the same idea for the Fast file

% 16 - Modifiy the plot command

 % 17 - Read the outfiles using the ReadFASText function. find the max of
 % each one.

