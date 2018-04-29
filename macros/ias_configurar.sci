//Configurar objeto de estudo
function y = ias_configurar(y,params,valores)
    ias_guard(y);
    
    if (type(params)<>10 | length(params) <> 2) then
        error("ias_configurar : segundo argumento deve ser string de tamanho 2");
    elseif (length(valores) <> 2) then
        error("ias_configurar : terceiro argumento deve ter comprimento igual a 2");
    end
    
    select params
    case "ft" //frequência e tempo de amostragem
        f_s = valores(1);
        t_max = valores(2);
        
        ts = 0 : 1/f_s : t_max;
        n = length(ts);
    case "fn" //frequência e número de pontos
        f_s = valores(1);
        n = valores(2);
        
        ts = 0 : 1/f_s : (n-1)/f_s;
        t_max = ts($);
    case "tn" //número de pontos e tempo
        t_max = valores(1); 
        n = valores(2);
        
        ts = linspace(0,t_max,n);
        f_s = 1/(ts(2) - ts(1));
    else
        error("ias_configurar : segundo argumento deve ser string: ft, fn, ou tn");    
    end
    
    if size(y.dados,'c') > 0 then
        //reamostrar se já contiver dados
        if f_s > y.params(1) then
            warning("ias_configurar : reamostragem para maiores frequências não é recomendada");
        end
        y = ias_reamostrar(y,ts);
    else
        //não reamostrar, apenas atualizar parâmetros
        y.params = [f_s, t_max, n];
        y.tempo = ts;
    end

endfunction
