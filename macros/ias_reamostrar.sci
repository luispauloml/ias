function y = ias_reamostrar(y,ts)
    ias_guard(y);
    
    ts_antigo = y.tempo;
    dados_antigo = y.dados;
    
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
    
    f_s = 1/diff(ts_novo(1:2));
    t_max = ts_novo($);
    n = length(ts_novo);
    
    y.params = [f_s, t_max, n];
endfunction
