function [Points_Start, Points_End, end_point] = generate_facepoints(start_point,axis,l,w,N_faces)
    %Generate twigs connecting leaves around the branch with the
    %Fibonacci sequence.
    %Atuhor: Weiwei Liu (22 Dec 2017)
    
    % Initialize return values.
    Points_Start = zeros(N_faces,3);
    Points_End   = zeros(N_faces,3);
    
    % End point 
    end_point = start_point + axis * l/norm(axis);
    
    % Direction of first side point
    PointSideBase = cross([1 1 1],axis); 
    
    % First side point of start&end point
    Points_Start(1,:) = start_point + PointSideBase * w/2/norm(PointSideBase);
    Points_End(1,:) = end_point + PointSideBase * w/2/norm(PointSideBase);
    
    % Fibonacci angle unit
    t_angle_unit=2*pi/N_faces;

    % Iterate over faces.
    for i_faces = 2:N_faces   

       % calculate the angle around the stem for each leaf
       t_angle= t_angle_unit * (i_faces-1);
       h_roate = makehgtform('axisrotate',axis,t_angle); 
       TwigSideBase_R = h_roate(1:3,1:3)*PointSideBase';


       % Compute points around start point.
       Points_Start(i_faces,:) = start_point...
                          + TwigSideBase_R' * w/2/norm(TwigSideBase_R');
                      
       % Compute points around end point.
       Points_End(i_faces,:) = end_point...
                          + TwigSideBase_R' * w/2/norm(TwigSideBase_R');       

    end
    
    
end