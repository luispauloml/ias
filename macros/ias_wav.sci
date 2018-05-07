function y = ias_wav(arquivo)
    //importar WAV
    
    if (type(arquivo) <> 10) then
        error("ias_wav: esperava-se 1 argumento: dever ser o caminho para um arquivo WAV");
    else
        [ds, Fs, bits] = wavread(arquivo);
        
        if (size(ds,'r') <> 1) then
            warning("ias_wav: apenas o primeiro canal será importado");
            ds = ds(1,:);
        end
    end
    
    n = length(ds);
    
    y = ias_vec(ds,'f',Fs);
endfunction
