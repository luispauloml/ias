
function %IASSTRUCT_p ( this )
    str = string ( this )
    srows = size(str,"r")
    for i = 1 : srows
        mprintf("%s\n",str(i))
    end
endfunction
