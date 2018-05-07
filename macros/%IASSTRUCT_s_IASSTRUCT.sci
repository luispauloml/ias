function y  = %IASSTRUCT_s_IASSTRUCT(a,b)
    //Overloading (-)
    
    Fs_b2    = ias_extrair(b,'f');
    dados_b2 = (-1) .* ias_extrair(b,'d');
    
    b2 = ias_vec(dados_b2,'f',Fs_b2);
    
    y = ias_combinar(a,b2,'s');
    
endfunction
