function [] = ias_reproduzir(y)
    ias_guard(y);
    
    ds = ias_normalizaLin(y);
    
    Fs = ias_extrair(y,'f');
    
    playsnd(ds, Fs);
endfunction

function ds = ias_normalizaLin(y)
    ias_guard(y);
    
    ds = ias_extrair(y,'d');
    
    ds = ds ./ max(abs(ds));
endfunction
