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
    
    y.dados = dados_novo;
    y.tempo = ts_novo;
    
    Fs = 1/(ts_novo(2) - ts_novo(1));
    t_max = ts_novo($);
    n = length(ts_novo);
    
    y.params = [Fs, t_max, n];
endfunction
