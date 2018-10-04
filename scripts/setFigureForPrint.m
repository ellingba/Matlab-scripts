function setFigureForPrint(figure)
% SETFIGUREFORPRINT removes the white space to export in LaTeX more easily
% 
%  FIGURE (string)        : figure handle. Default: current



% Set default values if empty or non existant
setDefaultValue('figure',gcf)

% % Set axes
fig = figure;
figChildren_handle = get(fig,'Children'); % If there was a legend, ...
axes_handle = figChildren_handle(length(figChildren_handle)); % children would be both legend and axes.

% % Remove unnecessary white space
set(axes_handle,'LooseInset',max(get(axes_handle,'TightInset'), 0.02))

end



