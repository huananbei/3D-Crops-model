function [triangles] = generate_triangles(T_faces,N_add)
%GENERATE_TRIANGLES Summary of this function goes here
%   Detailed explanation goes here
 triangles = zeros(2*T_faces,3);
 
 % generate the first part of triangles 
 for i=1:T_faces
  if i ~= T_faces  
    triangles(i,:)=[i+N_add,i+1+N_add,i+T_faces+N_add];
  elseif i== T_faces
    triangles(i,:)=[i+N_add,1+N_add,i+T_faces+N_add];  
  end
 end
 
  % generate the second part of triangles 
 for i=1:T_faces
  if i ~= T_faces  
    triangles(i+T_faces,:)=[i+1+N_add,i+T_faces+N_add,i+T_faces+1+N_add];
  elseif i== T_faces
    triangles(i+T_faces,:)=[1+N_add,i+T_faces+N_add,i+1+N_add]; 
  end
 end
 
end

