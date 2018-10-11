%TEXT2PICTURE  Rotats the input picture
%
%%% OUTPUT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   picture:       Picture of given text
%   line_space:    Line Space in pixels
%
%%% INPUT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   filename:      Name of text file to be read, e.g. 'text.txt'
%   M:             Height of picture in pixels
%   N:             Width of picture in pixels
%   fontSize_in:   Font size in points (1 point = 1/72 inches)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% You should not need to edit this file. Please report any bugs back to us.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [picture, line_space] = text2picture(filename, M, N, fontSize_in)

% make an empty image
I = ones(M,N);
border = 10; %[pixels]

% read text
fileID = fopen(filename);
formatSpec = '%s';
C_text = textscan(fileID, formatSpec);
fclose(fileID);

fontSize = fontSize_in;

x_width = 0.7; %x-width for given font

% calculate line spacing using the golden ratio
% get pixels per inch for your system, windows ppi=96, mac ppi=72
set(0,'units', 'pixels')
Pix_SS = get(0,'screensize');
set(0,'units','inches');
Inch_SS=get(0,'screensize');
Res = Pix_SS./Inch_SS;
ppi = Res(3); %windows ppi=96; mac ppi=72;

% calculate line spacing using the golden ratio
line_space = round(1.618*fontSize*72/ppi);

% calculate max number of lines
max_num_line = floor((M-2*border)/line_space);

% calculate max number of chars per line
av_char_width = fontSize*72/ppi*x_width;
max_num_char = floor((N-2*border)/av_char_width);

% number of words
num_word = length(C_text{1,1});

% print to picture
l_num = 1;
char_num = 0;
string = [];
for i = 1:num_word
    if char_num+length(C_text{1,1}{i}) < max_num_char
        char_num = char_num+length(C_text{1,1}{i})+1;
        string = strcat(string, C_text{1,1}{i},{' '});
    else
        I = insertText(I, [border,(l_num-1)*line_space+border], string,'FontSize', fontSize, 'BoxOpacity',0);
        char_num = length(C_text{1,1}{i})+1;
        string = [];
        string = strcat(string, C_text{1,1}{i},{' '});
        l_num = l_num + 1;
    end
    if i == num_word
        I = insertText(I, [border,(l_num-1)*line_space+border], string,'FontSize',fontSize, 'BoxOpacity',0);
        break;
    end
    if l_num > max_num_line
        break;
    end
end

% convert to grayscale image
picture = rgb2gray(I);
end