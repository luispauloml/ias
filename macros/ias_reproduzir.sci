function [] = ias_reproduzir(y)
    ias_guard(y);
    
    y.dados = sum(y.dados,'r');
    y = ias_normalizaLin(y);
    
    f_s = y.params(1);
    
    playsnd(y.dados, f_s);
    
endfunction

function y = ias_normalizaLin(y)
    ias_guard(y);
    
    ds = y.dados;
    
    y.dados = ds ./ max(abs(ds));
    
endfunction

function y = ias_normalizaLog(y)
    ias_guard(y);
    
    ds = y.dados;
    ds_l = log(abs(ds));
    
    y.dados = ds * ds_l / max(ds_l);
    
endfunction
