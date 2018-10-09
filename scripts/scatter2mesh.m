function [X,Y,Z,F] = scatter2mesh(M,resolution,limits)
%SCATTER2MESH(M,RESOLUTION,LIMITS) brings a map M = [X,Y,Z,F] of scatter 
%points  to a more conventional view with a meshgrid of RESOLUTION points 
%and the values of F interpolated between the LIMITS, at the mesh points.
%RESOLUTION can be a scalar for a cubic mesh or a 3x1 vector for a
%rectangular one.
%Both RESOLUTION and LIMITS are optional 

% -----------------------------------------
%Set default values
setDefaultValue('resolution',[50;50;50]);
setDefaultValue('limits',...
    [min(M(:,1)),max(M(:,1)); ...
    min(M(:,2)),max(M(:,2));...
    min(M(:,3)),max(M(:,3))]);

% -----------------------------------------
%Checks if inputs are of the right form
%resolution
if length(resolution) == 1
    resolution(1:3) = resolution;
elseif length(resolution) ~= 3
    warning('Input *resolution* must be scalar or 3x1 vector!');
end
%M
if size(M,2) ~= 4
    warning('Input *M* must be of size nx4!')
end
%limits
if size(limits) ~= [3 2]
    warning('Input *limits* is not 3x2!')
end
idx = sum(limits');
for i = 1:3
    if idx(i) == 0
        limits(i,:) = min(M(:,i)),max(M(:,i))
    end
end

% -----------------------------------------
% Exclude points outside of limits
M = M(M(:,1)>= limits(1,1),:);
M = M(M(:,1)<= limits(1,2),:);
M = M(M(:,2)>= limits(2,1),:);
M = M(M(:,2)<= limits(2,2),:);
M = M(M(:,3)>= limits(3,1),:);
M = M(M(:,3)<= limits(3,2),:);

% -----------------------------------------
%Interpolate the F data into a function
fun = scatteredInterpolant(M(:,1),M(:,2),M(:,3),M(:,4),'natural');

% -----------------------------------------
%Set X,Y,Z as meshes
x = linspace(min(M(:,1)),max(M(:,1)),resolution(1));
y = linspace(min(M(:,2)),max(M(:,2)),resolution(2));
z = linspace(min(M(:,3)),max(M(:,3)),resolution(3));

[X,Y,Z] = meshgrid(x,y,z);

% -----------------------------------------
%Finds the correct F, interpolated at meshpoints.
F = fun(X,Y,Z);

end