function [ r_traj ] = generateLineTrajectory(r_start, r_end, tf, ts)
% Inputs: 
%		r_start : start position
%		r_end   : end position
%		tf      : total time duration (in sec)
%		ts      : time discretization step-size (in ms)
% Output: Nx3 matrix mapping local rotational velocities to quaternion derivatives
N = floor(tf/ts);
x_traj = linspace(r_start(1),r_end(1),N);
y_traj = linspace(r_start(2),r_end(2),N);
z_traj = linspace(r_start(3),r_end(3),N);
r_traj = [x_traj; y_traj; z_traj].';
end
