function T = DH2T(row)
%DH2T Summary of this function goes here
%   Detailed explanation goes here
theta = row(1);
d = row(2);
a = row(3);
alpha = row(4);

T=[cos(theta) -sin(theta) 0 0;
   sin(theta)  cos(theta) 0 0;
   0           0          1 d;
   0           0          0 1];
T= T*[1 0           0          a;
      0 cos(alpha) -sin(alpha) 0;
      0 sin(alpha)  cos(alpha) 0;
      0 0           0          1]; 
end



