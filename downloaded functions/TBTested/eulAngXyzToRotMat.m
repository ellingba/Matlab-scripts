function R = eulAngXyzToRotMat(angles)
% EULANGXYZTOROTMAT(angles) maps XYZ Euler angles to a rotation matrix.

x = angles(1);
y = angles(2);
z = angles(3);

R = rotx(rad2deg(x))*roty(rad2deg(y))*rotz(rad2deg(z));

end