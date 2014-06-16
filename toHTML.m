% TOHTML   Converts strings to their UTF-8 HTML representation
%
% str = TOHTML(str) converts the input string or cell array of strings to 
% its unicode representation in HTML. 
%
% Ther is one exception: any occurrence of char(10) will be converted to 
% the string <br>.
%
% This function is most useful when creating buttons in a GUI, that need
% to contain a multi-line string with unicode characters. For example:
%
% EXAMPLE: 
%
%    uicontrol(...
%        'style'   , 'pushbutton',...
%        'units'   , 'normalized',...
%        'string'  , toHTML([char(937) '·' char(952) char(10) 'A×B']),...
%        'position', [0.05 0.05 0.1 0.1]...
%    );
%
% See also char, uicontrol.


% Please report bugs and inquiries to: 
%
% Name       : Rody P.S. Oldenhuis
% E-mail     : oldenhuis@gmail.com    (personal)
%              oldenhuis@luxspace.lu  (professional)
% Affiliation: LuxSpace sàrl
% Licence    : BSD


% If you find this work useful, please consider a donation:
% https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=6G3S5UYM7HJ3N
function html = toHTML(strings)
    
    %% Initialize
    
    % Basic IO check    
    if ~iscellstr(strings) && ~ischar(strings)
        error(...
            'toHTML:invalid_input',...
            ['Invalid input class: ''%s''.\n',...
            'Supported input types are ''char'' or a ''cell'' containing ''char''.'], class(strings));
    end
    
    % Provide support for
    %  - Single and multiline line char arrays    
    %  - Cellstrings
    wasChar = ischar(strings);
    if wasChar 
        if size(strings,1) > 1            
            strings(:, end+1) = char(10);            
        end
        strings = {strings}; 
    end
    
    %% Convert all strings to their unicode representation in HTML
    
    % Just for abbreviation 
    uf = {'UniformOutput', false};
    
    % Convert all characters to their HTML unicode representation 
    html = cellfun(@transpose, strings, uf{:});
    html = cellfun(@(x) cellstr(num2str(x(:)+0)), html, uf{:});
    html = cellfun(@(x) cellfun(@(y) ['&#' strtrim(y) ';'],x, uf{:}), html, uf{:});
    
    % Include HTML tags
    html = cellfun(@(x) ['<html>' [x{:}] '</html>'], html, uf{:});
    
    % Take care of newlining
    html = regexprep(html, '&#10;', '<br>');
    html = regexprep(html, '<br></html>$', '</html>');
       
    % Make output type consistent with input type
    if wasChar
        html = [html{:}]; end 
    
end

