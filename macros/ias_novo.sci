function varargout = ias_novo(varargin);
    //Cria nova estrutura de dados
    
    //Estrutura vazia
    y = tlist(['IASSTRUCT'
               'dados'
               'params'
               'dft'
               'tempo'
               'freqs'
               'specg']);
               
    //Parâmetros de amostragem
    y.params = [0 0 0];  //matriz 1x3: [frequencia, tempo, no. pontos]
    
   //Instantes de tempo
    y.tempo = []; //matrix 1xN
    
    //dados adquiridos
    y.dados = []; //matriz 1xN
    
    //DFT dos dados
    y.dft = []; //matriz 1xN
    
    //Ferquencias da DFT
    y.freqs = []; //matrix 1xN (calculadas em ias_processar)
    
    //Dados de espectrograma
    y.specg = cell(1,3);    
    
    select length(varargin)
        
    //estrutura em branco
    case 0

        //não faz nada
    
    //Copia parametros de estrutura antiga
    case 1
        
        y0 = varargin(1);
        ias_guard(y0);
        
        Fs = ias_extrair(y0,'f');
        t_max = ias_extrair(y0,'t');
        
        y = ias_configurar(y,'ft',[Fs t_max]);
        
    //Estrutura em branco com parâmetros configurados
    case 2
        param = varargin(1);
        valor = varargin(2);
        
        y = ias_configurar(ias_novo(), param, valor);
        
    //Exceção    
    else
        error("ias_novo: esperava-se 0, 1 ou 2 argumentos");
    end
    
    varargout = list(y);
endfunction


