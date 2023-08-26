function [points_base_final,axis_base_final] = generate_basepoints(start_point,axis,T_l,T_w,N_needles,N_angle_LAD,N_angle_AZI,N_angle_normal,N_locations)
    %Generate twigs connecting leaves around the branch with the
    %Fibonacci sequence.
    %Atuhor: Weiwei Liu (22 Dec 2017)
    
    % Initialize return values.
    points_base_final = zeros(N_needles,3);
    axis_base_final = zeros(N_needles,3);   
    
    % Direction of first side point
     PointSideBase = [0,1,0]; 
  
%     % First side point of start&end point
%     points_base(1,:) = start_point + PointSideBase * T_w/2/norm(PointSideBase);
%     axis_base(1,:) = points_base(1,:) - start_point;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% Iterate over faces.
    for i_needels = 1:N_needles  

       % calculate the angle around the stem for each leaf
       t_angle= N_angle_AZI(i_needels)+(2*rand-1)*N_angle_normal(i_needels);
       h_roate1 = makehgtform('axisrotate',axis,t_angle); 
       TwigSideBase_R = h_roate1(1:3,1:3)*PointSideBase';

       
       % Compute needel base point.
       points_base_final(i_needels,:) = start_point ...
                          + axis*(N_locations(i_needels)+(2*rand-1)*0.05)*T_l ...   
                          + TwigSideBase_R' *T_w/2/norm(TwigSideBase_R');
       % adjust direction of basepoint               
       if mod(i_needels,2) == 0
           adj_LAD = -N_angle_LAD(i_needels);
       elseif mod(i_needels,2) == 1
           adj_LAD = -N_angle_LAD(i_needels);
       end
       
       axis_cross = cross(TwigSideBase_R,axis); 
       h_roate2 = makehgtform('axisrotate',axis_cross,adj_LAD);      
       axis_base_final(i_needels,:) = h_roate2(1:3,1:3)*PointSideBase';
    end

end