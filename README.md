# Matlab-scripts README.md	

# Description

Repository of useful Matlab scripts

folder **downloaded functions\** contains functions found on the internet.

folder **scripts\** contains my own Matlab scripts and functions.

Author: BASTIAAN ELLING

Local repository on Bastiaan's laptop\C:\Users\basti\Documents\MATLAB\GitHub

Last change in README file: 17-10-2018

------------------------------------------------------------------------------
# file .gitignore
ignore ETH help folder


------------------------------------------------------------------------------
# folder downloaded functions\

- **Polyfitn**: fits a polynomial function of N-th order to 3D data 
- **contourdata**: creates a line at a certain level
- **linspecer**: creates a colormap of pleasant N spaced colors.
- **magnifyOnFigure**: creates a second figure inside the original with a Zoom


------------------------------------------------------------------------------
# folder scripts\

- **exportFigure**: prints a figure after checking that the name+extension does not exist already.
- **scatter2mesh**: transforms a scatter map to a mesh form, can exclude points out of boundaries for interp.
- **setDefaultValue**: sets an argument in an other function to a default value IFF it has not been setDefaultValue
- **setFigureForPrint**: removes unnecesary white space for export (to LaTeX)
- **setFigurePropreties**: sets figure propreties (text, size, legend) to default if not stated otherwise

- **math\**: folder of math functions (quaternions and rotation matrices mainly)
	- **angularNorm**: computes the "heading" || "segment angle" between two vectors in spherical coor. 
	- **pseudoInverseMat**: computes the pseudo-Inverse of a non-square Matrix according to Moore-Penrose's formula.
	- **quatMult**: multiplies two quaternions.
	- Multiple conversions between quaternions, rotation Matrices and rotation vectors.