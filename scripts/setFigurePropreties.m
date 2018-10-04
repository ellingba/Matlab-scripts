function [fig, axes_handle, plot_handle] = ...
    setFigurePropreties(figure,width,height,lineWidth,legendLocation,fontSize)
% SETFIGUREPROPRETIES sets the plot for a common pleasant esthetic
% 
%  FIGURE (string)        : figure handle. Default: current
%  WIDTH (integer)        : width (x-axis) in centimeters. Default: 13
%  HEIGHT (integer)       : height (y-axis) in centimeters. Default: 10
%  LINEWIDTH (integer)    : line width. Default: 2
%  LEGENDLOCATION (string): legend location. Default: 'northeast'
%  FONTSIZE (integer)     : font Size, in Times. Default: 12

% Set default values if empty or non existant
setDefaultValue('figure',gcf)
setDefaultValue('width',15);
setDefaultValue('height',10);
setDefaultValue('lineWidth',2);
setDefaultValue('legendLocation','northeast');
setDefaultValue('fontSize',12);

% Set axes
fig = figure;
figChildren_handle = get(fig,'Children'); % If there was a legend, ...
axes_handle = figChildren_handle(length(figChildren_handle)); % children would be both legend and axes.
plot_handle = get(axes_handle,'Children');

% Set Grid on
grid(axes_handle,'on');
% Set minor grid with : grid(axes_handle, 'minor');

% Set Legend location and Line width
set(legend,'Location',legendLocation)
set(plot_handle(:),'LineWidth',lineWidth)

% Scaling
fig.Units               = 'centimeters';
fig.Position(3)         = width;
fig.Position(4)         = height;

% Set text propreties
set(axes_handle, ...
    'FontName',     'Times', ...
    'FontSize',     fontSize);

% Remove unnecessary white space
% set(axes_handle,'LooseInset',max(get(axes_handle,'TightInset'), 0.02))

end



