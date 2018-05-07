function y = ias_reamostrar(y,ts)
    ias_guard(y);
    
    ts_antigo = ias_extrair(y,'tm');
    dados_antigo = ias_extrair(y,'d');
    
    ts_novo = [];
    dados_novo = [];
    
    for i = 1 : length(ts)
        ind = find(ts_antigo == ts(i));
        
        if ind <> []
            ts_novo = [ts_novo, ts(i)];
            dados_novo = [dados_novo, dados_antigo(:,ind)];
        end
    end
    
    y = ias_vec(dados_novo,'f',Fs);
    
endfunction
