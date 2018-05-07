
function [] = %IASSTRUCT_p (y)
    str = [];
    k = 1;
    str(k) = sprintf("Objecto para análise de sinais:\n");
    k = k + 1;
    str(k) = sprintf("==================");
    k = k + 1;
    str(k) = sprintf("Frequência de amostragem : %s Hz", string(ias_extrair(y,'f')));
    k = k + 1;
    str(k) = sprintf("Tempo de amostragem : %s s", string(ias_extrair(y,'t')));
    k = k + 1;
    str(k) = sprintf("Número de pontos : %s", string(ias_extrair(y,'n')));
    k = k + 1; tmp = ias_extrair(y,'d');
    str(k) = sprintf("Dados : [%sx%s]", string(size(tmp,'r')), string(size(tmp,'c')));
    k = k + 1; temp = ias_extrair(y,'dft');
    str(k) = sprintf("DFT : [%sx%s]", string(size(temp,'r')), string(size(tmp,'c')));
    k = k + 1;
    str(k) = sprintf("Espectrograma : %s\n", string(y.specg));
    
    srows = size(str,"r")
    for i = 1 : srows
        mprintf("%s\n",str(i))
    end
endfunction
