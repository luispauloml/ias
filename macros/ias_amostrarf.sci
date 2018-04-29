//Adquirir sinal a partir de uma função
function y = ias_amostrarf(y,lf)
    ias_guard(y);
    
    //verifica se é lista de funções
    tipos = [11 13 14 130];
    if (type(lf) == 15) then
        if or( type(lf(1)) == tipos ) then
            func = lf(1);
            args = list(lf(2:$));
        else
            error("ias_amostrarf : o primeiro elemento de lf deve ser uma função.");
        end
    else
        if or( type(lf) == tipos ) then
            func = lf;
            args = list();
        else
            error("ias_amostrarf : o segundo argumento deve ser lista ou função.");
        end
    end
    
    ts = y.tempo;
    
    if (length(args) > 0) then
        dados_novo = func(ts,args(:));
    else
        dados_novo = feval(ts,func);
    end
    
    y.dados = dados_novo;
endfunction


