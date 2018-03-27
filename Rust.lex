%{

    #include <stdio.h>
%}

digit   [0-9]       
letter  [A-Za-z]

%%
if    {printf("<if> ");}
while   {printf("<while");} //?
