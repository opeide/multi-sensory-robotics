function T = DH2T(theta,d,a,alpha)
%DH2T Summary of this function goes here
%   Detailed explanation goes here
T=[cos(theta) -sin(theta) 0 0;
   sin(theta)  cos(theta) 0 0;
   0           0          1 d;
   0           0          0 1;];
T= T*[1 0           0          a;
      0 cos(alpha) -sin(alpha) 0;
      0 sin(alpha)  cos(alpha) 0;
      0 0           0          1]; 
end



