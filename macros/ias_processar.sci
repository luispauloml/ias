function y = ias_processar(y)
    ias_guard(y);
    
    f_s = y.params(1);
    t_max = y.params(2);
    n = y.params(3);
    
    fs = 0:1/t_max:f_s;
    y.freqs = fs(1:n);
    
    y = ias_procDFT(y);
    y = ias_procSpecg(y);
endfunction


function y = ias_procDFT(y)
    ias_guard(y);
    
    dft = zeros(y.dados);
    
    for i = 1 : size(y.dados, 'r')
        dft(i,:) = fft(y.dados(i,:));
    end
    
    y.dft = dft;
endfunction

function y = ias_procSpecg(y)
    ias_guard(y);
    
    ds = y.dados;
    f_s = y.params(1);
    
    [S,ts,fs] = ias_specgram(ds,f_s);
    
    y.specg = {S, ts, fs}
endfunction
