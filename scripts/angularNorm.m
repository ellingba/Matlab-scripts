function delta = angularNorm(alpha,beta)
%ANGULARNORM computes the "heading" angle from the X-axis of a unit vector 
%in spherical coordinate. 
%It can also be used to compute the segment angle between two directions 
%ALPHA [rad] is pitch angle from XY plane to final point
%BETA [rad] is yaw angle from XZ plane to final point
%DETA is also in [rad].
%
%To compute the angle between two vectors in spherical coordinates one
%needs to set 
% ALPHA = ALPHA_2 - ALPHA_1 
% BETA = BETA_2 - BETA_1
%
%NOTE: This is different than from an engineering point of view with angles
%acting one after the others, we do not have any roll information and are
%only concerned with the "heading" direction w.r.t the "original" direction
%

delta = acos(cos(alpha)*cos(beta));

end