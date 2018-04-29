
function y = ias_combinar(a,b,t)
    ias_guard(a);
    ias_guard(b);
    
    //Comparar frequencia de amostragem
    Fs_a = a.params(1);
    Fs_b = b.params(1);
    if Fs_a <> Fs_b then
        error("ias_combinar: os sinais devem ter a mesma frequência de amostragem");
    end
    
    //Comparar tempo de amostragem
    T_a = a.params(2);
    T_b = b.params(2);
    t_dif = %F;
    if T_a <> T_b then
        warning("ias_combinar: os sinais possuem tempo de amostragem diferentes");
        t_dif = %T;
    end
    
    //Número de pontos
    N_a = a.params(3);
    N_b = b.params(3);
    [n,i] = min([N_a N_b]);
    
    select i //selecionar os maiores parâmetros
    case 1
        y = ias_novo(b);
        y.dados = b.dados(n+1:N_b);
    case 2
        y = ias_novo(a);
        y.dados = a.dados(n+1:N_a);
    end

    
    select t
    case 's'
        //superposição de sinais
        y.dados = [a.dados(1:n) + b.dados(1:n), y.dados];
    case 'm'
        //modulação de sinais
        if t_dif then
            error("ias_combinar : para modulação todos os parâmetros devem ser iguais");
        else
            y.dados = a.dados .* b.dados;
        end
    end
endfunction

