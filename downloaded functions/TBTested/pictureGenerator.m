%PICTUREGENERATOR  Rotats the input picture
%
%%% OUTPUT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   rotatedPicture:       Picture rotated by the angle corrupted with noise
%
%%% INPUT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   picture:       A picture
%   angle:         Angle [deg] by which the picture should be turned.
%   noise:         xxx
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% You should not need to edit this file. Please report any bugs back to us.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [rotatedPicture] = pictureGenerator(picture, angle, rel_std_noise)

% convert to gray image
if ndims(picture)==3
    I = rgb2gray(picture);
else
    assert(ndims(picture)==2)
    I = picture;
end
 

% rotate picture with white background
Irot = imrotate(I,angle,'bilinear','crop');
mask = ~(imrotate(ones(size(I)),angle,'bilinear','crop')==1);
Irot(mask) = max(max(I));

% add gaussian noise
rotatedPicture = randn(size(Irot));
rotatedPicture = Irot+rotatedPicture*rel_std_noise*std(Irot(:))/std(rotatedPicture(:));
end