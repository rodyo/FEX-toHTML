[![View toHTML - convert Unicode string(s) to HTML on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/44204-tohtml-convert-unicode-string-s-to-html)

[![Donate to Rody](https://i.stack.imgur.com/bneea.png)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=4M7RMVNMKAXXQ&source=url)

# FEX-toHTML

TOHTML Converts strings to their UTF-8 HTML representation
str = TOHTML(str) converts the input string or cell array of strings to its Unicode representation in HTML. All characters but one: any occurrence of the newline character (char(10)) will be converted to the string '<br>'.
This function is most useful when creating buttons in a GUI, that need to contain a multi-line string with Unicode characters. For example:

EXAMPLE:

uicontrol(...
'style' , 'pushbutton',...
'units' , 'normalized',...
'string' , toHTML(['θ·Ω' char(10) 'A×B']),...
'position', [0.05 0.05 0.1 0.1]...
);

If you find this work useful, please consider [a donation](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=4M7RMVNMKAXXQ&source=url).
