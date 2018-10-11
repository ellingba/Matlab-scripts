function R = eulAngToRotMat(angles, format)
% EULANGXYZTOROTMAT(angles) maps XYZ Euler angles to a rotation matrix.
% TO DO: check for format among 6 possibilities and use a switch? faster?

% check and setDefaultValue
if sum(format ~= 'X' & format ~= 'Y' & format ~= 'Z')
    error('FORMAT must be char array of Xs,Ys and Zs')
end    
% setDefaultValue('format','XYZ')

R = eye(3);

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