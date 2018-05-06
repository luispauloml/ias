
function y = ias_combinar(a,b,t)
    ias_guard(a);
    ias_guard(b);
    
    //Comparar frequencia de amostragem
    Fs_a = ias_extrair(a,'f');
    Fs_b = ias_extrair(b,'f');
    if Fs_a <> Fs_b then
        error("ias_combinar: os sinais devem ter a mesma frequência de amostragem");
    end
    
    Fs = Fs_a;
    
    //Comparar tempo de amostragem
    T_a = ias_extrair(a,'t');
    T_b = ias_extrair(b,'t');
    t_dif = %F;
    if T_a <> T_b then
        warning("ias_combinar: os sinais possuem tempo de amostragem diferentes");
        t_dif = %T;
    end
    
    //Número de pontos
    N_a = ias_extrair(a,'n');
    N_b = ias_extrair(b,'n');
    
    N_ab = [N_a N_b];
    
    [n,i] = min(N_ab);
    
    
    select i //selecionar os maiores parâmetros
    case 1
        i = 2;
        dados_extra = ias_extrair(b,'d');
    case 2
        i = 1;
        dados_extra = ias_extrair(a,'d');
    end
    
    dados_extra = dados_extra(n+1:N_ab(i));
    
    dados_a = ias_extrair(a,'d');
    dados_b = ias_extrair(b,'d');
    
    select t
    case 's'
        //superposição de sinais
        dados_novo = [dados_a(1:n) + dados_b(1:n), dados_extra];
    case 'm'
        //modulação de sinais
        if t_dif then
            error("ias_combinar: para modulação todos os parâmetros devem ser iguais");
        else
            dados_novo = dados_a .* dados_b;
        end
    end
    
    y = ias_importar(dados_novo,'f',Fs);
endfunction

