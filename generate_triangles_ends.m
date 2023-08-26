function [triangles] = generate_triangles_ends(T_faces,N_add)
%GENERATE_TRIANGLES Summary of this function goes here
%   Detailed explanation goes here
 triangles = zeros(T_faces-2,3);
 
 % generate triangles of the ends of twigs or needels
 for i=1:T_faces-2
 
    triangles(i,:)=[1+N_add,i+1+N_add,i+2+N_add];

 end
 
end

