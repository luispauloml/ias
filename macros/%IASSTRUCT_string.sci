//Converte %IASSTRUCT para string
function str = %IASSTRUCT_string(y)
    str = [];
    k = 1;
    str(k) = sprintf("Objecto para análise de sinais:\n");
    k = k + 1;
    str(k) = sprintf("==================");
    k = k + 1;
    str(k) = sprintf("Frequência de amostragem : %s Hz", string(y.params(1)));
    k = k + 1;
    str(k) = sprintf("Tempo de amostragem : %s s", string(y.params(2)));
    k = k + 1;
    str(k) = sprintf("Número de pontos : %s", string(y.params(3)));
    k = k + 1;
    str(k) = sprintf("Dados : [%s]", size2str(y.dados));
    k = k + 1;
    str(k) = sprintf("DFT : [%s]", size2str(y.dft));
    k = k + 1;
    str(k) = sprintf("Espectrograma : %s\n", string(y.specg));
endfunction

function str = size2str(y)
    str = string(size(y,'r')) + "x" + string(size(y,'c'));
endfunction
