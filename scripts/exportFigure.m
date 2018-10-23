function exportFigure(greenLight,name,fig,saveFolder,format)
%EXPORTFIGURE prints a figure in the wanted format after checking that the
%folder doesn't contain a file with the same name and format
%GREENLIGHT: 1 if you want to overwrite, default is 0
%NAME: wanted file name, default is figure's title
%FIG: figure handle
%SAVEFOLDER: Folder location, default is current folder
%FORMAT: extention of file to print, default is png
%Other format include: 'pdf' and 'eps'

%-----------------------------------------------------------------------
% Setting default values
setDefaultValue('fig',gcf);
setDefaultValue('saveFolder',[pwd,'\']);
a = gca;
setDefaultValue('name',a.Title.String);
setDefaultValue('format','png');
setDefaultValue('greenLight',0)

%Check if there's a dot in name
if sum(name == '.')
    error('Name (or Title) has a dot!')
end

%Check extention format
possExt = ["-dpng","-dpdf","-deps"];
printFormat= char(possExt(strcmp(['-d',format],possExt)));
if isempty(printFormat)
    error('Format must be ''png'', ''pdf'', ''eps'' or empty')
end

% Check if name already exists in folder
% greenLight = 0;
nameTemp = name;
while ~greenLight
    check = dir(fullfile(saveFolder,[nameTemp,'.',format]));
    setDefaultValue('k',1)
    if size(check,1) > 0
        nameTemp = [name,'_',num2str(k)];
        k = k +1;
    else
        name = nameTemp;
        greenLight = 1;
    end
end

% Prints in folder
fig.PaperPositionMode   = 'auto';
print([saveFolder name], printFormat, '-r600')

end