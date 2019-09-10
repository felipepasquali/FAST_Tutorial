%%
%%%%%%%%%%%%% PART 1 %%%%%%%%%%%%%
%%%%%%%%%%%%% "INSTALLING" FAST %%%%%%%%%%%%%
% 1 - Download FAST software from UBLearns(or UBBOX) or NWTC https://nwtc.nrel.gov/FAST8 
% 2 - Unzip the FAST.exe in a directory in your C:. In my case is C:\FAST\
% 3 - Inside the ".../FAST/bin", are the executable files to run FAST. There
% are 2 versions of .exe, 32 and 64-bit. Copy the path of the exe and 
% paste as a string in here. as shown below.

Fast = 'C:\FAST\bin\FAST_x64.exe';

% As fast does not have a GUI and works with IO files there is nothing else
% needed and fast is already in your computer.

%%%%%%%%%%%%% RUNNING FAST %%%%%%%%%%%%%

% 1 - FAST works with input files (.fst files). Fortunately, there are 
% examples of input files already shipped with FAST . Those examples are 
% in the folder ".../FAST/CertTest". They are also used to validate FAST in
% your machine.
% 2- Let's try now to run FAST with the one of this examples Test01. Go to
% the CertTest folder and copy the path to that file "Test01.fst" as shown
% below:

FastFile = 'C:\FAST\CertTest\Test01.fst';

% 3 - Now let's run FAST from within Matlab with the aid of the system
% command. 
system([Fast ' ' FastFile]);

% 4 - If FAST ran sucessfully the content similar to below should appear 
% in your Matlab command window:

    % ************************************************************************************************** 
    % FAST (v8.10.00a-bjj, 31-Mar-2015) 
    %  
    % Copyright (C) 2015 National Renewable Energy Laboratory 
    %  
    % This program comes with ABSOLUTELY NO WARRANTY. See the "license.txt" file distributed with this 
    % software for details. 
    % ************************************************************************************************** 
    %  
    %  Running FAST (v8.10.00a-bjj, 31-Mar-2015), compiled as a 64-bit application using single 
    %  precision 
    %  linked with NWTC Subroutine Library (v2.05.02a-bjj, 25-Feb-2015) 
    %  
    %  Heading of the FAST input file: 
    %    FAST Certification Test #01: AWT-27CR2 with many DOFs with fixed yaw error and steady wind 
    %  
    %  Running ElastoDyn (v1.02.00a-bjj, 31-Mar-2015). 
    %  
    %  Running ServoDyn (v1.02.00a-bjj, 31-Mar-2015). 
    %  
    %  Running AeroDyn (v14.03.01a-bjj, 13-Mar-2015). 
    %  
    %  Running InflowWind (v2.01.00a-bjj, 13-Mar-2015). 
    %  
    %    Assuming C:\FAST\CertTest\AWT27/Wind/Shr12_30.wnd is a formatted HH wind file. 
    %    Processed 3 records of HH data 
    %  
    % FAST_InitializeAll:AD_Init:Dynamic inflow will not check for low mean wind speed. 
    %  
    %  Timestep: 0 of 20 seconds.
    %  Timestep: 2 of 20 seconds.  Estimated final completion at 11:26:39.
    %  Timestep: 4 of 20 seconds.  Estimated final completion at 11:26:39.
    %  Timestep: 6 of 20 seconds.  Estimated final completion at 11:26:39.
    %  Timestep: 8 of 20 seconds.  Estimated final completion at 11:26:39.
    %  Timestep: 10 of 20 seconds.  Estimated final completion at 11:26:39.
    %  Timestep: 12 of 20 seconds.  Estimated final completion at 11:26:39.
    %  Timestep: 14 of 20 seconds.  Estimated final completion at 11:26:39.
    %  Timestep: 16 of 20 seconds.  Estimated final completion at 11:26:39.
    %  Timestep: 18 of 20 seconds.  Estimated final completion at 11:26:39.
    %  Timestep: 20 of 20 seconds.  Estimated final completion at 11:26:39.
    %                                                                                                    
    %  
    %  Total Real Time:       2.471 seconds 
    %  Total CPU Time:        2.4375 seconds 
    %  Simulation CPU Time:   2.3906 seconds 
    %  Simulated Time:        20 seconds 
    %  Time Ratio (Sim/CPU):  8.366 
    
% 5- If your FAST did NOT run an aborted message should appear. In this
% case I misspelled the name of the input file. So an error appeared as
% seen below:

    % ************************************************************************************************** 
    % FAST (v8.10.00a-bjj, 31-Mar-2015) 
    %  
    % Copyright (C) 2015 National Renewable Energy Laboratory 
    %  
    % This program comes with ABSOLUTELY NO WARRANTY. See the "license.txt" file distributed with this 
    % software for details. 
    % ************************************************************************************************** 
    %  
    %  Running FAST (v8.10.00a-bjj, 31-Mar-2015), compiled as a 64-bit application using single 
    %  precision 
    %  linked with NWTC Subroutine Library (v2.05.02a-bjj, 25-Feb-2015) 
    %  
    %  
    % FAST_InitializeAll:FAST_Init:FAST_ReadPrimaryFile:The input file, "C:\FAST\CertTest\Test011.fst", 
    % was not found. 
    %  
    %  FAST encountered an error during module initialization. 
    %  Simulation error level: FATAL ERROR 
    %  
    %  Aborting FAST. 
    
% 6 - If your program ran sucessfully, as step 4, you now have an output file
% in the same folder as your input file. In this case the file is located
% in "C:\FAST\CertTest\Test01.out". You can open this file and take a look
% at the results. Each column corresponds to one channel. The chanel could be
% position, acceleration, loads etc. More (or less) channels can be selected to
% be displayed based on the based on the type of analysis.


%%
%%%%%%%%%%%%% PART 2 %%%%%%%%%%%%%
% FAST is made by different packages that are linked together. Examples of this 
% packages are AeroDyn and ElastoDyn which simulate the aerodynamics and
% structural dynamics, respectively. Each package has its input files which 
% contain simulation parameters, turbine properties and paths to other files 
% with more properties. For example Elastodyn contains a series of parameters 
% of the simulation, turbine and paths to additional files that contain the 
% stifness, damping and mass properties of the tower and blades.
% 
% 1 - Open the file: C:\FAST\CertTest\AWT27\Test01_ElastoDyn.dat using your 
% text editor (Notepad, Notepad++, Atom, Emacs...)
% 2 - Take a moment to recognize the data present in this file. Each data
% has its parameters on the furthermost left and the respective label in 
% the second column.
% 3 - Note that on lines 88, 89 and 90 there is a path to the .dat files. 
% 4 - Open the DAT files ("C:\FAST\CertTest\AWT27\AWT_Blades.dat") and note 
% the information it contains.
% 5 - On Lines 17 to 37 you can find the structural properties of the blades
% distributed in 21 stations.

%%
%%%%%%%%%%%%% PART 3 %%%%%%%%%%%%%
% Now let's create our own turbine built upon one of the CertTest files.
% 
% 1 - Create a directory in your C: called FAST-Test
% 2 - Copy all the contents of C:\FAST\CertTest to this folder. We are 
% building our simulation based in one of this turbines.
% 3 - Let's Clean up this directory and leave only files: "Test01.fst" and
% folder AWT27. Rename "Test01.fst" to "MyTest.fst".
% 4 - Enter the AWT27 folder and  find AWT-Tower.dat.
% 5 - Modify the stiffness of the tower on line 20 to 1.7640000E+10 and 
% save the file.
% 6 - Similarly to what was done in Part 1 let's now Run fast. For that, we
% need to modify the FastFile Path. If you followed the instructions above
% your new FAST input File path is: 

FastFile = 'C:\FAST-Test\MyTest.fst'; 

% 7 - Now let's run FAST. Note that the Fast path is the same already
% defined before. 
system([Fast ' ' FastFile]);

% 8 - Note that there is an output file now with in the C:\FAST-Test File

%%
%%%%%%%%%%%%% PART 4 %%%%%%%%%%%%%
% Now that you completed this part and have a better understanding of FAST,
% let's try creating parametric studies by loading the data from the input 
% files in matlab, rewriting some of the parameters and running FAST 
% automatically. For that we will make use of some Matlab utilities that
% are supplied with FAST. These utilities are located in the folder: 
% "C:\FAST\Utilities\MATLAB_Toolbox"

% 1- Add Simulation ToolBox to Matlab Path
FASTSimulationToolbox = 'C:\FAST\Utilities\MATLAB_Toolbox';
addpath( genpath( FASTSimulationToolbox ) );

% 2 - Define Template Names
%Template Names and Paths for Inflow wind file and FAST. The templates are
%the baseline files. The Command used below will import all the data in
%into a struct in Matlab. Nothing will be written to these files.
InWindtemplateName = 'C:\FAST-Test\AWT27\Test01_InflowWind.dat';
FastTemplate = 'C:\FAST-Test\MyTest.fst';

% 3 - Define the output files
%Output Files' Path. This path receives the files after modification, it is
%important to have name different from the template above.
InflowFile = 'C:\FAST-Test\AWT27\Test01_MyInflowWindFile.dat';
FastFilePath = 'C:\FAST-Test\';


% 4 - Import template as a Cell Structure in Matlab
InFlowPars = FAST2Matlab(InWindtemplateName,2);
FastPars = FAST2Matlab(FastTemplate,1);

% 5 -Find Lines and Columns to be modified. In this case we want to modify 
% the wind speed. So we will find in the Inflow wind file
%"Test01_InflowWind.dat", using the label "HWindSpeed", the line number of
%the parameter Horizontal Wind Speed.
WindSpeedLine = find(strcmpi(InFlowPars.Label,'HWindSpeed'));
InFlowWindFileLine = find(strcmpi(FastPars.Label,'InflowFile'));

% 6 - Define a range of wind speeds to evaluate the test.
WindSpeed = 10.0:2.0:18.0;

% 7 - Loop Through Intervals and run fast each time

for i=1:length(WindSpeed)
    
    %Write InflowWind File w/ wind speed from Intervals.
    InFlowPars.Val(WindSpeedLine,:) = {WindSpeed(i)}; % change the value inside the struct to the desired value
    Matlab2FAST(InFlowPars,InWindtemplateName,InflowFile,2) %write the new data to ADFile
    
    %Write Fast Input File with new modified Inflow wind file
    FastFile = strcat(FastFilePath,'Test01_',num2str(WindSpeed(i)),'mps.ipt');
    FastPars.Val(InFlowWindFileLine,:) = {strcat('"',InflowFile,'"')};
    Matlab2FAST(FastPars,FastTemplate,FastFile,1); %write the new data to Fast File
    
    %Run FAST
    system([Fast ' ' FastFile]);
    
end

% 8 - If sucessfull it should run FAST 5 times. In the "C:\FAST-Test\",
% there should be 5 fast output files for the different wind speeds.

% 9 - Let's plot the some of the data. In this case the RootMyc1 - Moment on the Root:
[outData] = PlotFASToutput({'Test01_10mps.out','Test01_12mps.out','Test01_14mps.out','Test01_16mps.out'},...
    {'10mps','12mps','14mps','16mps'},...
     [],{'RootMyc1'} );

% 10 - After this you should be able to adapt the codes above to your needs
% and the type of simulation or optimization you are conducting.

% Some additional resources:
% This forum has users of FAST. https://wind.nrel.gov/forum/wind/ 
















