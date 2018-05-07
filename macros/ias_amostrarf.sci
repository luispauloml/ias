//Adquirir sinal a partir de uma função
function y1 = ias_amostrarf(y,lf)
    ias_guard(y);
    
    //verifica se é lista de funções
    tipos = [11 13 14 130];
    if (type(lf) == 15) then
        if or( type(lf(1)) == tipos ) then
            args = list(lf(2:$));
            
            function a = func(t)
                a = lf(1)(t,args(:));
            endfunction
        else
            error("ias_amostrarf: o primeiro elemento da lista deve ser uma função.");
        end
    else
        if or( type(lf) == tipos ) then
            func = lf;
            args = list();
        else
            error("ias_amostrarf: o segundo argumento deve ser lista ou função.");
        end
    end
    
    //obter matriz de tempo para amostragem
    ts = ias_extrair(y,'tm');
    
    //avalia a função
    dados_novo = feval(ts,func);
    
    //cria novo objeto
    Fs = ias_extrair(y,'f');
    y1 = ias_vec(dados_novo,'f',Fs);
endfunction


