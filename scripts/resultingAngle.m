function delta = resultingAngle(alpha,beta)
%RESULTINGANGLE computes the segment angle after two rotation in azymuth
%and inclination plane (spherical axis)
%ALPHA [rad] is pitch angle from XY plane to final point
%BETA [rad] is yaw angle from XZ plane to final point
%DETA is also in [rad].
%
%NOTE: This is different than from an engineering point of view with angles
%acting one after the others, we do not have any roll information and are
%only concerned with the "heading" direction w.r.t the "original" direction
%
%To compute the angle between two vectors in spherical coordinates one
%needs to set 
% ALPHA = ALPHA_2 - ALPHA_1 
% BETA = BETA_2 - BETA_1

delta = acos(cos(alpha)*cos(beta));

end