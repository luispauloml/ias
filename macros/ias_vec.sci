function y = ias_vec(ds,param,valor)
    
    //verificar se é vetor
    if (length(ds) == 0) then
        warning("ias_vec: dados vazios");
    elseif (size(ds,'r') <> 1) then
        warning("ias_vec: apenas a primeira linha será adquirida");
        ds = ds(1,:);
    elseif (size(ds,'r') <> 1) then
        ds = ds.';
    end
    
    n = length(ds);
    
    select param
    case 'f'
        Fs  = valor;
    case 't'
        Fs = (length(ds)-1)/valor;
    else
        error("ias_vec: 2o argumento deve ser string: ''f'' ou ''t''");
    end
    
    y = ias_configurar(ias_novo(),'fn',[Fs n]);
    y.dados = ds;
    
endfunction
