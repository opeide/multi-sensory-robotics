function [iHT] = invHT(HT)

% TODO: Fill with the proper inverse transformation (from the course)
% Do not use the inv function of matlab !
R = HT(1:3, 1:3);
T = HT(1:3, 4);
inverted = cat(1, cat(2, R', -R'*T), [0 0 0 1]);
iHT= inverted;

end

