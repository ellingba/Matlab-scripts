%% Script to export Matlab figure for LaTex reports
% from Manuel Gehlen


% Instructions:
% 1) Call 'fig' the figure you want to export. | fig = gcf;
% 2) Change the name of the figure and the folder if needed.
% 3) Comment the lines you don't want to edit, i.e. xlabel or ylim
% 4) Do not forget to change the name of the file or it will overwrite !!
% 5) CTRL + ENTER or copy the code below in the command window 
% =============================================================

% DEFINE FIGURE PROPRETIES
opts.Colors     = get(groot,'defaultAxesColorOrder');
opts.saveFolder = 'C:\Users\basti\Documents\Hyperthermia Project\VNA experiment\Gaze study\';
opts.name = 'S(12) All 6';
opts.width      = 15;
opts.height     = 10;
opts.fontType   = 'Times';
opts.fontSize   = 12;
opts.format = '-dpng'; %'-dpdf' for PNG file, doc print for other formats

% ADD AXIS AND LABEL, COMMENT IF UNWANTED

% axis tight
% xlabel('Current [mA]')
% ylabel('Flow [L/min]')
% hleg = legend('Flow from 0 to 100','Flow from 100 to 0','2nd order model','2nd order model');
% set(hleg,'Location','southeast')
% ylim([-3 74])
% xlim([220 570])
% grid on

% USEFUL COMMAND

set(legend,'Location','northeast')

% SCALING
fig.Name                = opts.name;
fig.Units               = 'centimeters';
fig.Position(3)         = opts.width;
fig.Position(4)         = opts.height;

% SET TEXT PROPRETIES
set(fig.Children, ...
    'FontName',     opts.fontType, ...
    'FontSize',     opts.fontSize);

% REMOVE UNNECESSARY WHITE SPACE
set(gca,'LooseInset',max(get(gca,'TightInset'), 0.02))

% ======================================
%% EXPORT TO PNG
opts.saveFolder = 'C:\Users\basti\Documents\Hyperthermia Project\VNA experiment\Gaze study\';
opts.name = 'S(22) Gaze_std vs Control';

fig.PaperPositionMode   = 'auto';
print([opts.saveFolder opts.name], opts.format, '-r600')









