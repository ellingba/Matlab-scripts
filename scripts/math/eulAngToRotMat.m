function R = eulAngToRotMat(angles, format)
% EULANGXYZTOROTMAT(angles, format) maps Euler angles to a rotation matrix.
% Make sure to write format in 'XYZ' form.
%
% ANGLES [rad]: angles in the same order as FORMAT
% FORMAT [char]: optional, default: 'XYZ'

% -----------------------------------------------------------
% example: 
% R = eulAngToRotMat([pi pi pi],'ZYX');
% -----------------------------------------------------------


% check and setDefaultValue
if length(angles) ~= length(format)
    error('ANGLES and FORMAT have different length!')
end
if sum(format ~= 'X' & format ~= 'Y' & format ~= 'Z')
    error('FORMAT must be a CHAR array of Xs,Ys and Zs')
end

setDefaultValue('format','XYZ')


% initialize
R = eye(3);

% computes R
for i = 1:length(format)
    if format(i) == 'X'
        R = R*rotx(rad2deg(angles(i)));
    elseif format(i) == 'Y'
        R = R*roty(rad2deg(angles(i)));
    else
        R = R*rotz(rad2deg(angles(i)));
    end
end


end