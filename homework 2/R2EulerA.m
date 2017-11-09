function [ phi_d,theta_d,psi_d ] = R2EulerA( R )

% TODO: Fill with the proper rotation Euler angles computation
%not considering singularities
    d = sqrt(1-R(3,1)^2);
    phi_d=atan2(R(2,1), R(1,1));
    theta_d=atan2(-R(3,1), d);
    psi_d=atan2(R(3,2), R(3,3));
end

