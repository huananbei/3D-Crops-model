%% ***************DART_RICE*****************
% DART_RICE: generate 3D rice model using sample field measurement data 
%          (LAI,LAD, Height, leaf number, leaf locations, leaf shape, vertical informtion, shoot information)
% Author: Weiwei Liu (weiweiliu@fafu.edu.cn)
% Version: 1.0 (Feb 28 2023)

%% >>>>>>>>>>>>>>>>> Initialization parameters for rice fields in DART
Scene_X = 0.9;
Scene_Y = 1.0;
Space_ridge = 0.3; % X
Space_cluster = 0.25; % Y
Diameter_cluster = 0.05;
Min_stems = 0.018;
N_stems = 15;

X_ALL = [];
Y_ALL = [];

% x = linspace(-sqrt(10),sqrt(10));
% y1 = sqrt(10-x.^2);
% y2 = -sqrt(10-x.^2);
% plot(x,y1,x,y2)
% axis equal
% hold on

x = linspace(-Diameter_cluster,Diameter_cluster);
y1 = sqrt(Diameter_cluster.^2-x.^2);
y2 = -sqrt(Diameter_cluster.^2-x.^2);
plot(x+Space_ridge/2,y1+Space_cluster/2,x+Space_ridge/2,y2+Space_cluster/2)
axis equal
hold on
xlim([0 0.9])
ylim([0 1.0])
%% >>>>>>>>>>>>>>>>> Generate rice fields 
for i_X = 1:Scene_X/Space_ridge   % X
    for i_Y =1:Scene_Y/Space_cluster  % Y
        X_base = (i_X-0.5)*Space_ridge;
        Y_base = (i_Y-0.5)*Space_cluster;
        n_target = N_stems;
        X_base_all = [];
        Y_base_all = [];
        X_base_all = [X_base_all,X_base];
        Y_base_all = [Y_base_all,Y_base];
        k = 1;        % base point as first point
        
        x = linspace(-Diameter_cluster,Diameter_cluster);
        y1 = sqrt(Diameter_cluster.^2-x.^2);
        y2 = -sqrt(Diameter_cluster.^2-x.^2);
        plot(x+X_base,y1+Y_base,x+X_base,y2+Y_base)        
        
        for i_Points = 1:15*N_stems
            if k < N_stems
                r = rand(1)*Diameter_cluster; %produces a random vector whose length is <=radius
                theta = rand(1)*2*pi; % produces a random angle 
                x_coord = r*cos(theta); % calculate x coord
                y_coord = r*sin(theta); % calculate y coord
                x_coord_temp = X_base + x_coord;
                y_coord_temp = Y_base + y_coord;                
                
                n_distance_two = 0;     % compare previous points for min distances
                for j_points = 1:length(X_base_all)
                    distance_two = sqrt((x_coord_temp - X_base_all(j_points))^2 +  (y_coord_temp - Y_base_all(j_points))^2); % calculate distance
                    disp(distance_two);
                    if distance_two > Min_stems
                        n_distance_two = n_distance_two +1;                  
                    end
                end
                
                if n_distance_two == length(X_base_all)
                    X_base_all  = [X_base_all,x_coord_temp];
                    Y_base_all  = [Y_base_all,y_coord_temp];
                    k = k+1;
                end
                
            end
        end
        
        for j = 1:length(X_base_all)
            plot(X_base_all(j),Y_base_all(j), 'x')
        end
        X_ALL = [X_ALL,X_base_all];
        Y_ALL = [Y_ALL,Y_base_all];
    end
end

disp(length(X_ALL));
%% output data under DART FORMAT .TXT

fp=fopen('D:\Rice_fields.txt','a');
for h=1:length(X_ALL)
    angle_x = rand(1)*6-3;
    angle_y = rand(1)*6-3;
    angle_z = rand(1)*360;
    type = rand(1)*3;
    scale_x = (rand(1)*0.2-0.1)+1;
    scale_y = (rand(1)*0.2-0.1)+1;
    scale_z = (rand(1)*0.2-0.1)+1;
    fprintf(fp,'%2.0f %4.2f %4.2f %1d %4.2f %4.2f %4.2f %2.0f %2.0f %2.0f\t\n',type,X_ALL(h),Y_ALL(h),0,scale_x,scale_y,scale_z,angle_x,angle_y,angle_z);
end
fclose(fp);


