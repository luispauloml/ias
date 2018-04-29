
function y = ias_importar(nome)
    
    y = ias_novo();
    
    [ds, f_s, bits] = wavread(nome);
    
    n = length(ds);
    t_max = (n-1)/f_s;
    ts = 0:1/f_s:t_max;
    
    y.tempo = ts;
    y.dados = ds;
    y.params = [f_s, t_max, n];
    
endfunction
