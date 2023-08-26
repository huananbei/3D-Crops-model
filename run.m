%% ***************Rice_3D_obj*****************
% Rice_3D: generate 3D rice model using sample field measurement data 
%          (LAI,LAD, Height, leaf number, leaf locations, leaf shape, vertical informtion, shoot information)
% Author: Weiwei Liu (weiweiliu@fafu.edu.cn)
% Version: 1.0 (Jan 28 2023)

%% *********************** Initialization parameters for stem&leaf *************** (from bottom to top)
T_start_point = [0,0,0];  % start point of stem
T_axis = [0,0,1];         % start directionof stem
T_faces = 10;             % faces of stem
T_w = 0.008;              % stem width of stem
L_w = 0.0121*2;            % width of sample leaf

% %@@@@@@@@@@@@@@@@@ (Stage 1) @@@@@@@@@@@@@@@@@@
% Stage_num = "Stage-01 ";   % rice growth stage 5
% % *** must be adjusted at each stage
% T_l = 0.09;                                                          % stem length              ***Asjust***
% N_needles = 3;                                                       % leaf number              ***Asjust***
% N_l = [0.25,0.25,0.25];                                              % leaf length of leaf      ***Asjust***
% N_w = [0.0082/L_w,0.0082/L_w,0.0082/L_w];                                                % leaf width of leaf                                     ***Asjust*** 
% N_locations = [0.09/T_l,0.09/T_l,0.09/T_l];                                              % leaf relative height within (0-1) of stem heigth       ***Asjust***                                     
% N_angle_LAD = [-75.0*pi/180,75.0*pi/180,-85.0*pi/180];                                   % leaf inclination angle (0-90) of each leaves           ***Asjust*** 
% % * (Optional)
% N_angle_AZI = [0,pi,0];                                                                  % Fibonacci angle in azimuth around stem                   *Asjust*
% N_angle_AZI_normal = [5*pi/180,5*pi/180,1*pi/180];                                       % normal angle for AZI                                     *Asjust*
% N_angle_LAD_normal = 3;                                                                  % normal angle for LAD                                     *Asjust*
% N_curl = 2.5;                                                                            % curl degree                                              *Asjust*
% % * ear insert
% flag_ear = 0;                                                                                     % ear insert (0:NO,1:YES)                                  *Asjust*
% L_ear = 0.25;                                                                                     % ear length                                               *Asjust*
% D_ear = 0.012;                                                                                    % ear width (half)                                         *Asjust*
% LAD_angle_ear = 80*pi/180;                                                                        % ear LAD at base point                                    *Asjust*
% N_curl_ear = 5;                                                                                   % ear curl degree                                          *Asjust*

% %@@@@@@@@@@@@@@@@@ (Stage 2) @@@@@@@@@@@@@@@@@@
% Stage_num = "Stage-02 ";   % rice growth stage 5
% % *** must be adjusted at each stage
% T_l = 0.16;                                                          % stem length              ***Asjust***
% N_needles = 3;                                                       % leaf number              ***Asjust***
% N_l = [0.31,0.31,0.31];                                              % leaf length of leaf      ***Asjust***
% N_w = [0.0095/L_w,0.0095/L_w,0.0095/L_w];                                                % leaf width of leaf                                     ***Asjust*** 
% N_locations = [0.15/T_l,0.15/T_l,0.16/T_l];                                              % leaf relative height within (0-1) of stem heigth       ***Asjust***                                     
% N_angle_LAD = [-67.0*pi/180,60.0*pi/180,-85.0*pi/180];                                   % leaf inclination angle (0-90) of each leaves           ***Asjust*** 
% % * (Optional)
% N_angle_AZI = [0,pi,0];                                                                  % Fibonacci angle in azimuth around stem                   *Asjust*
% N_angle_AZI_normal = [5*pi/180,5*pi/180,1*pi/180];                                       % normal angle for AZI                                     *Asjust*
% N_angle_LAD_normal = 3;                                                                  % normal angle for LAD                                     *Asjust*
% N_curl = 2.0;                                                                            % curl degree                                              *Asjust*
% % * ear insert
% flag_ear = 0;                                                                                     % ear insert (0:NO,1:YES)                                  *Asjust*
% L_ear = 0.25;                                                                                     % ear length                                               *Asjust*
% D_ear = 0.012;                                                                                    % ear width (half)                                         *Asjust*
% LAD_angle_ear = 80*pi/180;                                                                        % ear LAD at base point                                    *Asjust*
% N_curl_ear = 5;                                                                                   % ear curl degree                                          *Asjust*

% %@@@@@@@@@@@@@@@@@ (Stage 3) @@@@@@@@@@@@@@@@@@
% Stage_num = "Stage-03 ";   % rice growth stage 5
% % *** must be adjusted at each stage
% T_l = 0.38;                                                          % stem length              ***Asjust***
% N_needles = 4;                                                       % leaf number              ***Asjust***
% N_l = [0.32,0.42,0.41,0.35];                                         % leaf length of leaf      ***Asjust***
% N_w = [0.009/L_w,0.009/L_w,0.01058/L_w,0.01058/L_w];                                     % leaf width of leaf                                     ***Asjust*** 
% N_locations = [0.18/T_l,0.25/T_l,0.36/T_l,0.38/T_l];                                     % leaf relative height within (0-1) of stem heigth       ***Asjust***                                     
% N_angle_LAD = [-52.1*pi/180,52.1*pi/180,-70.6*pi/180,70.6*pi/180];                       % leaf inclination angle (0-90) of each leaves           ***Asjust*** 
% % * (Optional)
% N_angle_AZI = [0,pi,0,pi];                                                                      % Fibonacci angle in azimuth around stem                   *Asjust*
% N_angle_AZI_normal = [50*pi/180,50*pi/180,5*pi/180,5*pi/180];                                   % normal angle for AZI                                     *Asjust*
% N_angle_LAD_normal = 3;                                                                         % normal angle for LAD                                     *Asjust*
% N_curl = 2.0;                                                                                   % curl degree                                              *Asjust*
% % * ear insert
% flag_ear = 0;                                                                                     % ear insert (0:NO,1:YES)                                  *Asjust*
% L_ear = 0.25;                                                                                     % ear length                                               *Asjust*
% D_ear = 0.012;                                                                                    % ear width (half)                                         *Asjust*
% LAD_angle_ear = 80*pi/180;                                                                        % ear LAD at base point                                    *Asjust*
% N_curl_ear = 5;                                                                                   % ear curl degree                                          *Asjust*

% %@@@@@@@@@@@@@@@@@ (Stage 4) @@@@@@@@@@@@@@@@@@
% Stage_num = "Stage-04 ";   % rice growth stage 5
% % *** must be adjusted at each stage
% T_l = 0.30;                                                          % stem length              ***Asjust***
% N_needles = 5;                                                       % leaf number              ***Asjust***
% N_l = [0.34,0.38,0.49,0.57,0.36];                                    % leaf length of leaf      ***Asjust***
% N_w = [0.009/L_w,0.009/L_w,0.01108/L_w,0.01108/L_w,0.01108/L_w];                                  % leaf width of leaf                                     ***Asjust*** 
% N_locations = [0.16/T_l,0.21/T_l,0.27/T_l,0.30/T_l,0.30/T_l];                                     % leaf relative height within (0-1) of stem heigth       ***Asjust***                                     
% N_angle_LAD = [-48.2*pi/180,48.2*pi/180,-70.6*pi/180,73.6*pi/180,-80.4*pi/180];                   % leaf inclination angle (0-90) of each leaves           ***Asjust*** 
% % * (Optional)
% N_angle_AZI = [0,pi,0,pi,0];                                                                      % Fibonacci angle in azimuth around stem                   *Asjust*
% N_angle_AZI_normal = [50*pi/180,50*pi/180,5*pi/180,5*pi/180,2*pi/180];                            % normal angle for AZI                                     *Asjust*
% N_angle_LAD_normal = 3;                                                                           % normal angle for LAD                                     *Asjust*
% N_curl = 2.0;                                                                                     % curl degree                                              *Asjust*
% % * ear insert
% flag_ear = 0;                                                                                     % ear insert (0:NO,1:YES)                                  *Asjust*
% L_ear = 0.25;                                                                                     % ear length                                               *Asjust*
% D_ear = 0.012;                                                                                    % ear width (half)                                         *Asjust*
% LAD_angle_ear = 80*pi/180;                                                                        % ear LAD at base point                                    *Asjust*
% N_curl_ear = 5;                                                                                   % ear curl degree                                          *Asjust*

%@@@@@@@@@@@@@@@@@ (Stage 5) @@@@@@@@@@@@@@@@@@
Stage_num = "Stage-05 ";   % rice growth stage 5
% *** must be adjusted at each stage
T_l = 0.42;                                                          % stem length              ***Asjust***
N_needles = 6;                                                       % leaf number              ***Asjust***
N_l = [0.30,0.39,0.47,0.54,0.53,0.40];                               % leaf length of leaf      ***Asjust***
N_w = [0.010/L_w,0.010/L_w,0.01248/L_w,0.01248/L_w,0.01248/L_w,0.01248/L_w];                      % leaf width of leaf                                     ***Asjust*** 
N_locations = [0.17/T_l,0.24/T_l,0.32/T_l,0.34/T_l,0.41/T_l,0.43/T_l];                            % leaf relative height within (0-1) of stem heigth       ***Asjust***                                     
N_angle_LAD = [-47.3*pi/180,50.3*pi/180,-61.6*pi/180,63.6*pi/180,-80.6*pi/180,81.6*pi/180];       % leaf inclination angle (0-90) of each leaves           ***Asjust*** 
% * (Optional)
N_angle_AZI = [0,pi,0,pi,0,pi];                                                                   % Fibonacci angle in azimuth around stem                   *Asjust*
N_angle_AZI_normal = [50*pi/180,50*pi/180,5*pi/180,5*pi/180,2*pi/180,2*pi/180];                   % normal angle for AZI                                     *Asjust*
N_angle_LAD_normal = 3;                                                                           % normal angle for LAD                                     *Asjust*
N_curl = 2.0;                                                                                     % curl degree                                              *Asjust*
% * ear insert
flag_ear = 0;                                                                                     % ear insert (0:NO,1:YES)                                  *Asjust*
L_ear = 0.25;                                                                                     % ear length                                               *Asjust*
D_ear = 0.012;                                                                                    % ear width (half)                                         *Asjust*
LAD_angle_ear = 80*pi/180;                                                                        % ear LAD at base point                                    *Asjust*
N_curl_ear = 5;                                                                                   % ear curl degree                                          *Asjust*

% %@@@@@@@@@@@@@@@@@ (Stage 6) @@@@@@@@@@@@@@@@@@
% Stage_num = "Stage-06 ";   % rice growth stage 5
% % *** must be adjusted at each stage
% T_l = 0.59;                                                          % stem length              ***Asjust***
% N_needles = 6;                                                       % leaf number              ***Asjust***
% N_l = [0.35,0.46,0.51,0.54,0.52,0.39];                               % leaf length of leaf      ***Asjust***
% N_w = [0.010/L_w,0.010/L_w,0.01248/L_w,0.01248/L_w,0.01546/L_w,0.01546/L_w];                      % leaf width of leaf                                     ***Asjust*** 
% N_locations = [0.19/T_l,0.26/T_l,0.34/T_l,0.45/T_l,0.53/T_l,0.59/T_l];                            % leaf relative height within (0-1) of stem heigth       ***Asjust***                                     
% N_angle_LAD = [-57.4*pi/180,57.4*pi/180,-73.5*pi/180,73.5*pi/180,-83.5*pi/180,83.5*pi/180];       % leaf inclination angle (0-90) of each leaves           ***Asjust*** 
% % * (Optional)
% N_angle_AZI = [0,pi,0,pi,0,pi];                                                                   % Fibonacci angle in azimuth around stem                   *Asjust*
% N_angle_AZI_normal = [50*pi/180,50*pi/180,5*pi/180,5*pi/180,2*pi/180,2*pi/180];                   % normal angle for AZI                                     *Asjust*
% N_angle_LAD_normal = 3;                                                                           % normal angle for LAD                                     *Asjust*
% N_curl = 2.0;                                                                                     % curl degree                                              *Asjust*
% % * ear insert
% flag_ear = 0;                                                                                     % ear insert (0:NO,1:YES)                                  *Asjust*
% L_ear = 0.05;                                                                                     % ear length                                               *Asjust*
% D_ear = 0.012;                                                                                    % ear width (half)                                         *Asjust*
% LAD_angle_ear = 80*pi/180;                                                                        % ear LAD at base point                                    *Asjust*
% N_curl_ear = 5;                                                                                   % ear curl degree                                          *Asjust*

% %@@@@@@@@@@@@@@@@@ (Stage 7) @@@@@@@@@@@@@@@@@@
% Stage_num = "Stage-07_Constant ";   % rice growth stage 5
% % *** must be adjusted at each stage
% T_l = 0.84;                                                          % stem length              ***Asjust***
% N_needles = 7;                                                       % leaf number              ***Asjust***
% N_l = [0.35,0.39,0.47,0.56,0.55,0.49,0.35];                          % leaf length of leaf      ***Asjust***
% N_w = [0.010/L_w,0.010/L_w,0.01248/L_w,0.01248/L_w,0.01500/L_w,0.01500/L_w,0.01562/L_w];                      % leaf width of leaf                                     ***Asjust*** 
% N_locations = [0.16/T_l,0.21/T_l,0.29/T_l,0.38/T_l,0.52/T_l,0.68/T_l,0.84/T_l];                               % leaf relative height within (0-1) of stem heigth       ***Asjust***                                     
% %N_angle_LAD = [-40.2*pi/180,40.2*pi/180,-69.5*pi/180,69.5*pi/180,-69.5*pi/180,80.0*pi/180,-80.0*pi/180];      % leaf inclination angle (0-90) of each leaves           ***Asjust*** 
% N_angle_LAD = [-57.4*pi/180,57.4*pi/180,-73.5*pi/180,73.5*pi/180,-73.5*pi/180,83.5*pi/180,-83.5*pi/180];      % 
% % * (Optional)
% N_angle_AZI = [0,pi,0,pi,0,pi,0];                                                                 % Fibonacci angle in azimuth around stem                   *Asjust*
% N_angle_AZI_normal = [45*pi/180,45*pi/180,10*pi/180,10*pi/180,4*pi/180,4*pi/180,2*pi/180];          % normal angle for AZI                                     *Asjust*
% N_angle_LAD_normal = 3;                                                                           % normal angle for LAD                                     *Asjust*
% N_curl = 2.0;                                                                                     % curl degree                                              *Asjust*
% % * ear insert
% flag_ear = 1;                                                                                     % ear insert (0:NO,1:YES)                                  *Asjust*
% L_ear = 0.05;                                                                                     % ear length                                               *Asjust*
% D_ear = 0.006;                                                                                    % ear width (half)                                         *Asjust*
% LAD_angle_ear = 85*pi/180;                                                                        % ear LAD at base point                                    *Asjust*
% N_curl_ear = 0.8;                                                                                 % ear curl degree                                          *Asjust*

% %@@@@@@@@@@@@@@@@@ (Stage 8) @@@@@@@@@@@@@@@@@@
% Stage_num = "Stage-08_Constant ";   % rice growth stage 5
% % *** must be adjusted at each stage
% T_l = 1.05;                                                          % stem length              ***Asjust***
% N_needles = 6;                                                       % leaf number              ***Asjust***
% N_l = [0.38,0.52,0.59,0.52,0.44,0.32];                               % leaf length of leaf      ***Asjust***
% N_w = [0.010/L_w,0.01248/L_w,0.01248/L_w,0.01500/L_w,0.01500/L_w,0.01521/L_w];                                % leaf width of leaf                                     ***Asjust*** 
% N_locations = [0.24/T_l,0.32/T_l,0.39/T_l,0.53/T_l,0.73/T_l,1.05/T_l];                                        % leaf relative height within (0-1) of stem heigth       ***Asjust***                                     
% %N_angle_LAD = [-40.6*pi/180,63.4*pi/180,-63.4*pi/180,63.4*pi/180,-68.4*pi/180,78.4*pi/180];                   % leaf inclination angle (0-90) of each leaves           ***Asjust*** 
% N_angle_LAD = [-57.4*pi/180,73.5*pi/180,-73.5*pi/180,73.5*pi/180,-80.5*pi/180,85.5*pi/180];      %
% % * (Optional)
% N_angle_AZI = [0,pi,0,pi,0,pi];                                                                   % Fibonacci angle in azimuth around stem                   *Asjust*
% N_angle_AZI_normal = [50*pi/180,15*pi/180,15*pi/180,10*pi/180,10*pi/180,2*pi/180];                % normal angle for AZI                                     *Asjust*
% N_angle_LAD_normal = 3;                                                                           % normal angle for LAD                                     *Asjust*
% N_curl = 2.0;                                                                                     % curl degree                                              *Asjust*
% % * ear insert
% flag_ear = 1;                                                                                     % ear insert (0:NO,1:YES)                                  *Asjust*
% L_ear = 0.22;                                                                                     % ear length                                               *Asjust*
% D_ear = 0.008;                                                                                    % ear width (half)                                         *Asjust*
% LAD_angle_ear = 80*pi/180;                                                                        % ear LAD at base point                                    *Asjust*
% N_curl_ear = 4.7;                                                                                 % ear curl degree                                          *Asjust*

% %@@@@@@@@@@@@@@@@@ (Stage 9) @@@@@@@@@@@@@@@@@@
% Stage_num = "Stage-09_Constant ";   % rice growth stage 5
% % *** must be adjusted at each stage
% T_l = 1.00;                                                          % stem length              ***Asjust***
% N_needles = 6;                                                       % leaf number              ***Asjust***
% N_l = [0.37,0.48,0.48,0.58,0.49,0.36];                               % leaf length of leaf      ***Asjust***
% N_w = [0.006/L_w,0.006/L_w,0.01248/L_w,0.01500/L_w,0.01535/L_w,0.01535/L_w];                                % leaf width of leaf                                     ***Asjust*** 
% N_locations = [0.18/T_l,0.27/T_l,0.36/T_l,0.48/T_l,0.66/T_l,1.00/T_l];                                        % leaf relative height within (0-1) of stem heigth       ***Asjust***                                     
% %N_angle_LAD = [-41.9*pi/180,64.1*pi/180,-64.1*pi/180,64.1*pi/180,-67.4*pi/180,79.4*pi/180];                   % leaf inclination angle (0-90) of each leaves           ***Asjust*** 
% N_angle_LAD = [-57.4*pi/180,73.5*pi/180,-73.5*pi/180,73.5*pi/180,-78.5*pi/180,85.5*pi/180];                   %
% % * (Optional)
% N_angle_AZI = [0,pi,0,pi,0,pi];                                                                   % Fibonacci angle in azimuth around stem                   *Asjust*
% N_angle_AZI_normal = [50*pi/180,28*pi/180,28*pi/180,20*pi/180,20*pi/180,2*pi/180];                % normal angle for AZI                                     *Asjust*
% N_angle_LAD_normal = 3;                                                                           % normal angle for LAD                                     *Asjust*
% N_curl = 2.0;                                                                                     % curl degree                                              *Asjust*
% % * ear insert
% flag_ear = 1;                                                                                     % ear insert (0:NO,1:YES)                                  *Asjust*
% L_ear = 0.15;                                                                                     % ear length                                               *Asjust*
% D_ear = 0.012;                                                                                    % ear width (half)                                         *Asjust*
% LAD_angle_ear = 80*pi/180;                                                                        % ear LAD at base point                                    *Asjust*
% N_curl_ear = 9;                                                                                   % ear curl degree                                          *Asjust*

% %@@@@@@@@@@@@@@@@@ (Stage 10) @@@@@@@@@@@@@@@@@@
% Stage_num = "Stage-10_Constant ";   % rice growth stage 5
% % *** must be adjusted at each stage
% T_l = 1.03;                                                          % stem length              ***Asjust***
% N_needles = 5;                                                       % leaf number              ***Asjust***
% N_l = [0.48,0.57,0.54,0.50,0.37];                                    % leaf length of leaf      ***Asjust***
% N_w = [0.00248/L_w,0.00348/L_w,0.01435/L_w,0.01435/L_w,0.01607/L_w];                                          % leaf width of leaf                                     ***Asjust*** 
% N_locations = [0.30/T_l,0.36/T_l,0.50/T_l,0.69/T_l,1.03/T_l];                                                 % leaf relative height within (0-1) of stem heigth       ***Asjust***                                     
% %N_angle_LAD = [-41.9*pi/180,68.4*pi/180,-68.4*pi/180,69.4*pi/180,-79.7*pi/180];                               % leaf inclination angle (0-90) of each leaves           ***Asjust*** 
% N_angle_LAD = [-57.4*pi/180,73.5*pi/180,-73.5*pi/180,73.5*pi/180,-83.5*pi/180];                               %
% % * (Optional)
% N_angle_AZI = [0,pi,0,pi,0];                                                                      % Fibonacci angle in azimuth around stem                   *Asjust*
% N_angle_AZI_normal = [30*pi/180,28*pi/180,20*pi/180,20*pi/180,2*pi/180];                          % normal angle for AZI                                     *Asjust*
% N_angle_LAD_normal = 3;                                                                           % normal angle for LAD                                     *Asjust*
% N_curl = 2.0;                                                                                     % curl degree                                              *Asjust*      
% % * ear insert
% flag_ear = 1;                                                                                     % ear insert (0:NO,1:YES)                                  *Asjust*
% L_ear = 0.12;                                                                                     % ear length                                               *Asjust*
% D_ear = 0.008;                                                                                    % ear width (half)                                         *Asjust*
% LAD_angle_ear = 80*pi/180;                                                                        % ear LAD at base point                                    *Asjust*
% N_curl_ear = 10;                                                                                  % ear curl degree                                          *Asjust*

% %@@@@@@@@@@@@@@@@@ (Stage 11) @@@@@@@@@@@@@@@@@@
% Stage_num = "Stage-11_Constant ";   % rice growth stage 5
% % *** must be adjusted at each stage
% T_l = 1.05;                                                          % stem length              ***Asjust***
% N_needles = 4;                                                       % leaf number              ***Asjust***
% N_l = [0.57,0.54,0.50,0.37];                                         % leaf length of leaf      ***Asjust***
% N_w = [0.00250/L_w,0.00265/L_w,0.01035/L_w,0.01307/L_w];                                                      % leaf width of leaf                                     ***Asjust*** 
% N_locations = [0.36/T_l,0.50/T_l,0.69/T_l,1.03/T_l];                                                          % leaf relative height within (0-1) of stem heigth       ***Asjust***                                     
% %N_angle_LAD = [-25.4*pi/180,65.5*pi/180,-74.5*pi/180,80.7*pi/180];                                            % leaf inclination angle (0-90) of each leaves           ***Asjust*** 
% N_angle_LAD = [-57.4*pi/180,73.5*pi/180,-81.5*pi/180,85.7*pi/180];                                            % Constant
% % * (Optional)
% N_angle_AZI = [0,pi,0,pi];                                                                        % Fibonacci angle in azimuth around stem                   *Asjust*
% N_angle_AZI_normal = [28*pi/180,15*pi/180,15*pi/180,2*pi/180];                                    % normal angle for AZI                                     *Asjust*
% N_angle_LAD_normal = 5;                                                                           % normal angle for LAD                                     *Asjust*
% N_curl = 4.5;                                                                                     % curl degree                                              *Asjust*  
% % * ear insert
% flag_ear = 1;                                                                                     % ear insert (0:NO,1:YES)                                  *Asjust*
% L_ear = 0.12;                                                                                     % ear length                                               *Asjust*
% D_ear = 0.008;                                                                                    % ear width (half)                                         *Asjust*
% LAD_angle_ear = 80*pi/180;                                                                        % ear LAD at base point                                    *Asjust*
% N_curl_ear = 12;                                                                                  % ear curl degree                                          *Asjust*

%% Generation flow of 3D rice                                            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%% ********************************* Generate face points of stem *************************************
[T_starts, T_ends, T_end_point] = generate_facepoints(T_start_point,...
                                T_axis,...
                                T_l,...
                                T_w,...
                                T_faces);    
                            
%% ******************************* Generate base points of each leaf ***********************************
[points_base,axis_base] = generate_basepoints(T_start_point,...
                                T_axis,...
                                T_l,...
                                T_w,...
                                N_needles,...
                                N_angle_LAD,...
                                N_angle_AZI,...
                                N_angle_AZI_normal,...
                                N_locations);   

%% ***************************************** leaf shape setup ********************************************
leaf_vertices_1 = [  
0	0	0;
-0.0068  1/11   0; -0.0096  2/11   0; -0.0103  3/11   0; -0.0109  4/11   0; -0.0120  5/11   0; 
-0.0121  6/11   0; -0.0111  7/11   0; -0.0116  8/11   0; -0.0100  9/11   0; -0.0075  10/11	0;
0   11/11	0;
0.0075  10/11	0; 0.0100  9/11   0; 0.0116  8/11   0; 0.0111  7/11   0; 0.0121  6/11   0;
0.0120  5/11   0; 0.0109  4/11   0; 0.0103  3/11   0; 0.0096  2/11   0; 0.0068  1/11   0
];

tris_1 = [
1, 2, 22;2, 3, 22;3, 21, 22;...
3, 4, 21;4, 20, 21;4, 5, 20;...
5, 19, 20;5, 6, 19;6, 18, 19;...
6, 7, 18;7, 17, 18;7, 8, 17;...
8, 16, 17;8, 9, 16;9, 15, 16;...
9, 10, 15;10, 14, 15;10, 11, 14;...
11, 13, 14;11, 12, 13
];

%% ***************************************** leaf curl setup ********************************************
leaf_curl_1 = [0,1*N_curl*pi/180,2*N_curl*pi/180,3*N_curl*pi/180,4*N_curl*pi/180,5*N_curl*pi/180,6*N_curl*pi/180,7*N_curl*pi/180,8*N_curl*pi/180,9*N_curl*pi/180,10*N_curl*pi/180,11*N_curl*pi/180,10*N_curl*pi/180,9*N_curl*pi/180,8*N_curl*pi/180,7*N_curl*pi/180,6*N_curl*pi/180,5*N_curl*pi/180,4*N_curl*pi/180,3*N_curl*pi/180,2*N_curl*pi/180,1*N_curl*pi/180];
leaf_curl_0 = zeros(length(leaf_curl_1));  % no curl
leaf_curl_2 = [0,1*N_curl*pi/180,2*N_curl*pi/180,3*N_curl*pi/180,4*N_curl*pi/180,5*N_curl*pi/180,9*N_curl*pi/180,10*N_curl*pi/180,11*N_curl*pi/180,12*N_curl*pi/180,13*N_curl*pi/180,14*N_curl*pi/180,13*N_curl*pi/180,12*N_curl*pi/180,11*N_curl*pi/180,10*N_curl*pi/180,9*N_curl*pi/180,5*N_curl*pi/180,4*N_curl*pi/180,3*N_curl*pi/180,2*N_curl*pi/180,1*N_curl*pi/180];
% leaf_curl_1 means Arc-shaped leaf for green leaf
% leaf_curl_2 means dry leaf shape (ONLY for final stage)
% leaf_curl_0 means no curl
%% ************************************ Generate face points of each leaf ********************************
N_Notes= length(leaf_vertices_1(:,1));
N_leaf = zeros(N_Notes*N_needles,3);

for i_needels = 1:N_needles
    % calculate the angle around the stem for each leaf
    axis = cross(T_axis,axis_base(i_needels,1:3));
    LAD_angle = N_angle_LAD(i_needels)+(2*rand-1)*N_angle_LAD_normal*pi/180;       % normal variation of LAD
    AZI_angle = N_angle_AZI(i_needels)+(2*rand-1)*N_angle_AZI_normal(i_needels);   % normal variation of AZI
    leaf_vertices_1(:,2) = leaf_vertices_1(:,2)*N_l(i_needels);   % scale leaf using leaf length   >>>>>>>>>>>>>>>
    leaf_vertices_1(:,1) = leaf_vertices_1(:,1)*N_w(i_needels);   % scale leaf using leaf width    >>>>>>>>>>>>>>>
    
    % curl setup of leaf (only two bottom leaves)              
    if i_needels == 1
        leaf_curl = leaf_curl_1;
    elseif i_needels == 2
        leaf_curl = -leaf_curl_1;
%     elseif i_needels == 3
%         leaf_curl =  leaf_curl_2;        
    elseif i_needels > 2
        leaf_curl =leaf_curl_0;
    end
    
    % face points of each leaf
    for i_Notes =1:N_Notes
        temp_vertices = leaf_vertices_1(i_Notes,1:3)+points_base(i_needels,1:3);    % elevate leaf point from bottom to relative height
        [x1,y1,z1] = MyRotate(temp_vertices(1),temp_vertices(2),temp_vertices(3),T_axis,AZI_angle,points_base(i_needels,1:3));      % rolate around stem using AZI
        [x,y,z] = MyRotate(x1,y1,z1,axis,LAD_angle+leaf_curl(i_Notes),points_base(i_needels,1:3));                                  % rolate around basepoint using LAD
        N_leaf((i_needels-1)*N_Notes+i_Notes,1:3) = [x,y,z];                        
    end
    
    leaf_vertices_1(:,2) = leaf_vertices_1(:,2)/N_l(i_needels);   % scale leaf using leaf length    <<<<<<<<<<<<<<<<
    leaf_vertices_1(:,1) = leaf_vertices_1(:,1)/N_w(i_needels);   % scale leaf using leaf width     <<<<<<<<<<<<<<<<   
end

%% ********************************* Generate ear of each rice stem (specified stages) ********************************
%****************** ear shape setup ********************
leaf_vertices_ear = [  
0	0	0;
-D_ear/2  1*L_ear/6   D_ear/2/0.58; -D_ear  1*L_ear/6   0; -D_ear/2  1*L_ear/6   -D_ear/2/0.58; D_ear/2  1*L_ear/6   -D_ear/2/0.58; D_ear  1*L_ear/6   0; D_ear/2  1*L_ear/6   D_ear/2/0.58;
-D_ear/2  2*L_ear/6   D_ear/2/0.58; -D_ear  2*L_ear/6   0; -D_ear/2  2*L_ear/6   -D_ear/2/0.58; D_ear/2  2*L_ear/6   -D_ear/2/0.58; D_ear  2*L_ear/6   0; D_ear/2  2*L_ear/6   D_ear/2/0.58;
-D_ear/2  3*L_ear/6   D_ear/2/0.58; -D_ear  3*L_ear/6   0; -D_ear/2  3*L_ear/6   -D_ear/2/0.58; D_ear/2  3*L_ear/6   -D_ear/2/0.58; D_ear  3*L_ear/6   0; D_ear/2  3*L_ear/6   D_ear/2/0.58;
-D_ear/2  4*L_ear/6   D_ear/2/0.58; -D_ear  4*L_ear/6   0; -D_ear/2  4*L_ear/6   -D_ear/2/0.58; D_ear/2  4*L_ear/6   -D_ear/2/0.58; D_ear  4*L_ear/6   0; D_ear/2  4*L_ear/6   D_ear/2/0.58;
-D_ear/2  5*L_ear/6   D_ear/2/0.58; -D_ear  5*L_ear/6   0; -D_ear/2  5*L_ear/6   -D_ear/2/0.58; D_ear/2  5*L_ear/6   -D_ear/2/0.58; D_ear  5*L_ear/6   0; D_ear/2  5*L_ear/6   D_ear/2/0.58;
0   L_ear	0
];

tris_ear = [
1, 2, 3; 1, 3, 4; 1, 4, 5; 1, 5, 6; 1, 6, 7; 1, 2, 7;...
2, 7, 8; 7, 8, 13; 2, 3, 8; 3, 8, 9; 3, 9, 10; 3, 4, 10; 4, 5, 10; 5, 10, 11; 5, 6, 11; 6, 11, 12; 6, 7, 12; 7, 12, 13;...
1*6+2, 1*6+7, 1*6+8; 1*6+7, 1*6+8, 1*6+13; 1*6+2, 1*6+3, 1*6+8; 1*6+3, 1*6+8, 1*6+9; 1*6+3, 1*6+9, 1*6+10; 1*6+3, 1*6+4, 1*6+10; 1*6+4, 1*6+5, 1*6+10; 1*6+5, 1*6+10, 1*6+11; 1*6+5, 1*6+6, 1*6+11; 1*6+6, 1*6+11, 1*6+12; 1*6+6, 1*6+7, 1*6+12; 1*6+7, 1*6+12, 1*6+13;...
2*6+2, 2*6+7, 2*6+8; 2*6+7, 2*6+8, 2*6+13; 2*6+2, 2*6+3, 2*6+8; 2*6+3, 2*6+8, 2*6+9; 2*6+3, 2*6+9, 2*6+10; 2*6+3, 2*6+4, 2*6+10; 2*6+4, 2*6+5, 2*6+10; 2*6+5, 2*6+10, 2*6+11; 2*6+5, 2*6+6, 2*6+11; 2*6+6, 2*6+11, 2*6+12; 2*6+6, 2*6+7, 2*6+12; 2*6+7, 2*6+12, 2*6+13;...
3*6+2, 3*6+7, 3*6+8; 3*6+7, 3*6+8, 3*6+13; 3*6+2, 3*6+3, 3*6+8; 3*6+3, 3*6+8, 3*6+9; 3*6+3, 3*6+9, 3*6+10; 3*6+3, 3*6+4, 3*6+10; 3*6+4, 3*6+5, 3*6+10; 3*6+5, 3*6+10, 3*6+11; 3*6+5, 3*6+6, 3*6+11; 3*6+6, 3*6+11, 3*6+12; 3*6+6, 3*6+7, 3*6+12; 3*6+7, 3*6+12, 3*6+13;...
26, 27, 32; 27, 28, 32; 28, 29, 32; 29, 30, 32; 30, 31, 32; 26, 31, 32
];

ear_curl = [0,1*N_curl_ear*pi/180,1*N_curl_ear*pi/180,1*N_curl_ear*pi/180,1*N_curl_ear*pi/180,1*N_curl_ear*pi/180,1*N_curl_ear*pi/180,2*N_curl_ear*pi/180,2*N_curl_ear*pi/180,2*N_curl_ear*pi/180,2*N_curl_ear*pi/180,2*N_curl_ear*pi/180,2*N_curl_ear*pi/180,5*N_curl_ear*pi/180,5*N_curl_ear*pi/180,5*N_curl_ear*pi/180,5*N_curl_ear*pi/180,5*N_curl_ear*pi/180,5*N_curl_ear*pi/180,8*N_curl_ear*pi/180,8*N_curl_ear*pi/180,8*N_curl_ear*pi/180,8*N_curl_ear*pi/180,8*N_curl_ear*pi/180,8*N_curl_ear*pi/180,10*N_curl_ear*pi/180,10*N_curl_ear*pi/180,10*N_curl_ear*pi/180,10*N_curl_ear*pi/180,10*N_curl_ear*pi/180,10*N_curl_ear*pi/180,11.5*N_curl_ear*pi/180];
N_Notes_ear= length(leaf_vertices_ear(:,1));
N_ears = zeros(N_Notes_ear,3);

% calculate the angle around the stem for each leaf
axis_ear = cross(T_axis,axis_base(N_needles,1:3));
AZI_angle = N_angle_AZI(N_needles-1)+(2*rand-1)*N_angle_AZI_normal(N_needles);   % normal variation of AZI

if mod(N_needles,2) == 1
    P_M = 1;
else
    P_M = -1;
end    

%% ear add if needed
if flag_ear == 1
    for i_Notes =1:N_Notes_ear
        temp_vertices = leaf_vertices_ear(i_Notes,1:3)+points_base(N_needles,1:3);    % elevate leaf point from bottom to relative height
        [x1,y1,z1] = MyRotate(temp_vertices(1),temp_vertices(2),temp_vertices(3),T_axis,AZI_angle,points_base(N_needles,1:3));      % rolate around stem using AZI
        [x,y,z] = MyRotate(x1,y1,z1,axis_ear,P_M*(LAD_angle_ear-ear_curl(i_Notes)),points_base(N_needles,1:3));                          % rolate around basepoint using LAD
        N_ears(i_Notes,1:3) = [x,y,z];                        
    end
end
 
%% needel add (no needed now)
% %% Generate face points of needels
% N_starts = zeros(N_faces*N_needles,3);
% N_ends = zeros(N_faces*N_needles,3);
% N_end_point = zeros(N_needles,3);
% for i_needels = 1:N_needles    
%     AZI_angle = N_angle_AZI(i_needels)+(2*rand-1)*N_angle_normal(i_needels);
%     [x1,y1,z1] = MyRotate(axis_base(i_needels,1),axis_base(i_needels,2),axis_base(i_needels,3),T_axis,AZI_angle,points_base(i_needels,1:3));
%     [a1,b1,c1] = generate_facepoints(points_base(i_needels,1:3),...
%                                         [x1,y1,z1],...
%                                         0.05,...
%                                         N_w(i_needels),...
%                                         N_faces);
% 
%      N_starts((i_needels-1)*N_faces+1:i_needels*N_faces,1:3) = a1;                                            
%      N_ends((i_needels-1)*N_faces+1:i_needels*N_faces,1:3) = b1;      
% end


output_time = string(datetime, 'yyyy-MM-dd-HH-mm-ss');
output_filename = 'C:/Users/dell/DART/database/3D_Objects/Rice_3D/Rice3D_'+Stage_num+'('+output_time+')'+'.obj';

% type of obj parts from 0
n_type = 0;
Type_obj = 'Type_' + string(n_type);
%% ************************************ Rice stem saving ********************************
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% stem 
vertices = [T_starts;T_ends];
% Rolate -90 around X axis >>>>>>>>>>
vertices_new = zeros(length(vertices(:,1)),3);
for h=1:length(vertices(:,1))
    [vertices_new(h,1),vertices_new(h,2),vertices_new(h,3)] = MyRotate(vertices(h,1),vertices(h,2),vertices(h,3),[1,0,0],-90*pi/180,[0,0,0]);
end
vertices= vertices_new;
% Rolate -90 around X axis <<<<<<<<<<
[faces] = generate_triangles(T_faces,0);
obj_write(output_filename,vertices',faces',Type_obj);

%add_num = 2*T_faces+ i_needels*2*T_faces; %%%%%%%%%%%%%Update
add_num = 2*T_faces; %%%%%%%%%%%%%Update

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% stem bottom
%------------ Twig
vertices = T_starts;
% Rolate -90 around X axis >>>>>>>>>>
vertices_new = zeros(length(vertices(:,1)),3);
for h=1:length(vertices(:,1))
    [vertices_new(h,1),vertices_new(h,2),vertices_new(h,3)] = MyRotate(vertices(h,1),vertices(h,2),vertices(h,3),[1,0,0],-90*pi/180,[0,0,0]);
end
vertices= vertices_new;
% Rolate -90 around X axis <<<<<<<<<<
[faces] = generate_triangles_ends(T_faces,add_num);
obj_write(output_filename,vertices',faces',Type_obj);

%add_num = 2*T_faces+ i_needels*2*T_faces + T_faces;  %%%%%%%%%%%%%Update
add_num = 2*T_faces + T_faces;  %%%%%%%%%%%%%Update

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% stem up
vertices = T_ends;
% Rolate -90 around X axis >>>>>>>>>>
vertices_new = zeros(length(vertices(:,1)),3);
for h=1:length(vertices(:,1))
    [vertices_new(h,1),vertices_new(h,2),vertices_new(h,3)] = MyRotate(vertices(h,1),vertices(h,2),vertices(h,3),[1,0,0],-90*pi/180,[0,0,0]);
end
vertices= vertices_new;
% Rolate -90 around X axis <<<<<<<<<<
[faces] = generate_triangles_ends(T_faces,add_num);
obj_write(output_filename,vertices',faces',Type_obj);

%add_num = 2*T_faces+ i_needels*2*T_faces + 2*T_faces;  %%%%%%%%%%%%%Update
add_num = 2*T_faces + 2*T_faces;  %%%%%%%%%%%%%Update
n_type = n_type+1;
Type_obj = 'Type_' + string(n_type);

%% ************************************ Rice leaf saving ********************************
for i_needels = 1:N_needles                                                           
    vertices = N_leaf(N_Notes*(i_needels-1)+1:N_Notes*(i_needels),:);
    % Rolate -90 around X axis >>>>>>>>>>
    vertices_new = zeros(length(vertices(:,1)),3);
    for h=1:length(vertices(:,1))
        [vertices_new(h,1),vertices_new(h,2),vertices_new(h,3)] = MyRotate(vertices(h,1),vertices(h,2),vertices(h,3),[1,0,0],-90*pi/180,[0,0,0]);
    end
    vertices= vertices_new;
    % Rolate -90 around X axis <<<<<<<<<<
    %[faces] = generate_triangles_ends(N_Notes,N_Notes*(i_needels-1)+add_num);
    [faces] = N_Notes*(i_needels-1)+ tris_1 + add_num;
    obj_write(output_filename,vertices',faces',Type_obj);
    n_type = n_type+1;
    Type_obj = 'Type_' + string(n_type);
end

add_num = 2*T_faces + 2*T_faces + N_Notes*N_needles;
%% ************************************ Rice ear saving ********************************
if flag_ear == 1                                                        
    vertices = N_ears;
    % Rolate -90 around X axis >>>>>>>>>>
    vertices_new = zeros(length(vertices(:,1)),3);
    for h=1:length(vertices(:,1))
        [vertices_new(h,1),vertices_new(h,2),vertices_new(h,3)] = MyRotate(vertices(h,1),vertices(h,2),vertices(h,3),[1,0,0],-90*pi/180,[0,0,0]);
    end
    vertices= vertices_new;
    % Rolate -90 around X axis <<<<<<<<<<
    %[faces] = generate_triangles_ends(N_Notes,N_Notes*(i_needels-1)+add_num);
    [faces] = tris_ear + add_num;
    obj_write(output_filename,vertices',faces',Type_obj);
    n_type = n_type+1;
    Type_obj = 'Type_' + string(n_type);
end

%% Functions obj_write
function obj_write(filename,vertices,faces,obj_type)
%TEST Summary of this function goes here  
%  write matrix to file  

vertices=vertices';
faces=faces';
fid=fopen(filename,'a');  
  
[x,y]=size(vertices);  
  
 for i=1:x
    fprintf(fid,'v ');
    for j=1:y-1  
        fprintf(fid,'%f ',vertices(i,j));  
    end  
    fprintf(fid,'%f\r\n',vertices(i,y));%?????\n    
    %fprintf(fid,'\n');%?????\n   
 end 

fprintf(fid,'g %s\n',obj_type);%?????\n  
fprintf(fid,'\n');%?????\n  

[x,y]=size(faces);  
  
 for i=1:x
    fprintf(fid,'f ');
    for j=1:y-1  
        fprintf(fid,'%d ',faces(i,j));  
    end  
    fprintf(fid,'%d\r\n',faces(i,y));%?????\n  
    %fprintf(fid,'\n');%?????\n  
end 
  
fclose(fid);  
  
  
end

%% Functions MyRotate
function [VnewX,VnewY,VnewZ]=MyRotate(X,Y,Z,r,alpha,origin)
    %
    if numel(r) == 2
        r_theta = pi*r(1)/180;
        r_phi   = pi*r(2)/180;
        r     = [cos(r_phi)*cos(r_theta); cos(r_phi)*sin(r_theta); sin(r_phi)];
    elseif numel(r) == 3
        r = r(:)/norm(r);
    end
 
    %
    %theta=deg2rad(alpha);
    theta=alpha;
 
    %
    XYZ=[X(:),Y(:),Z(:)];
    %
    Vnew=zeros(size(XYZ));
    %罗德里格旋转公式
    for i=1:1:size(XYZ,1)
        V=XYZ(i,:);
        V=[V(1,1)-origin(1), V(1,2)-origin(2), V(1,3)-origin(3)];
        Vnew(i,:) = cos(theta)*V + (1-cos(theta))*dot(r,V)*r' + sin(theta)*cross(r,V);
    end
    %
    VnewX = origin(1) + reshape(Vnew(:,1),size(X));
    VnewY = origin(2) + reshape(Vnew(:,2),size(Y));
    VnewZ = origin(3) + reshape(Vnew(:,3),size(Z));
end
