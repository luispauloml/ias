function [] = ias_guard(y)
    if (type(y) <> 16) & (y(1)(1) <> 'IASSTRUCT') then
        error('as_guard: Argumento de entrada não é apropriado');
    else
        return
    end
endfunction
