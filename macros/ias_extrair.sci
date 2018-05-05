function varargout = ias_extrair(varargin)
    
    if (length(varargin) <> 2) then
        error("ias_extrair: esperava-se 2 argumentos de entrada");
    end
    
    y = varargin(1);
    param = varargin(2);
    
    ias_guard(y);
    
    valores = ['f', 't', 'n', 'd', 'dft', 'spec'];
   
    select param
    case valores(1) //frequência de aquisição 
        varargout = list(y.params(1));
        
    case valores(2) //tempo de amostragem
        varargout = list(y.params(2));
        
    case valores(3) //número de pontos
        varargout = list(y.params(3));
        
    case valores(4) //dados amostrados
        varargout = list(y.dados);
        
    case valores(5) //transformada de fourier
        varargout = list(y.dft);
        
    case valores(6) //espectigrama
        varargout = list(y.specg{1}, y.specg{2}, y.specg{3});
    
    else
        msg = "ias_extrari: 2o argumento deve ser um string: "
        for i = 1 : size(valores,'r') - 1;
            msg = msg + valores(i) + ', '
        end
        msg = msg + valores($) + '.';
        error(msg);
    end
endfunction
