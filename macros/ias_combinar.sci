
function y = ias_combinar(a,b,t)
    ias_guard(a);
    ias_guard(b);
    
    //Extração de dados
    dados_a = ias_extrair(a,'d');
    dados_b = ias_extrair(b,'d');
    
    //Comparar frequencia de amostragem
    Fs_a = ias_extrair(a,'f');
    Fs_b = ias_extrair(b,'f');
    if Fs_a <> Fs_b then
        error("ias_combinar: os sinais devem ter a mesma frequência de amostragem");
    end
    
    //Comparar tempo de amostragem
    T_a = ias_extrair(a,'t');
    T_b = ias_extrair(b,'t');
    t_dif = T_a <> T_b;
    
    select t
    case 's' //superposição de sinais
        if t_dif then
            warning("ias_combinar: os sinais possuem tempo de amostragem diferentes");
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
        

        
        dados_novo = [dados_a(1:n) + dados_b(1:n), dados_extra];
        
    case 'm' //modulação de sinais
        if t_dif then
            error("ias_combinar: para modulação todos os parâmetros devem ser iguais");
        else
            dados_novo = dados_a .* dados_b;
        end
        
    case 'c' //concatenar sinais
        dados_novo = [dados_a dados_b];
    end
    
    y = ias_vec(dados_novo,'f',Fs_a);
endfunction

