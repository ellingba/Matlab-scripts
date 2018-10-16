function [quat, angle, axis] = rotMatToQuat(C)
  % Input: rotation matrix
  % Output: Quaternion [w x y z]
  % Or: angle of rotation (can be computed from quaternion)
  % and axis of rotation (same)
  
  quat = 0.5*[sqrt((1+trace(C)));
              sign(C(3,2)-C(2,3)) * sqrt(C(1,1) - C(2,2) - C(3,3) + 1);
              sign(C(1,3)-C(3,1)) * sqrt(C(2,2) - C(3,3) - C(1,1) + 1);
              sign(C(2,1)-C(1,2)) * sqrt(C(3,3) - C(1,1) - C(2,2) + 1)];
          
  angle = 2*acos(quat(1));
  axis = quat(2:4)/sin(angle/2);
          
end