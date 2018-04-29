function y = ias_novo(varargin);
    //Cria nova estrutura de dados
    
    //Estrutura vazia
    y = tlist(['IASSTRUCT'
               'dados'
               'params'
               'dft'
               'tempo'
               'freqs'
               'specg']);
        
    if length(varargin) == 0 then
        //Parâmetros de amostragem
        y.params = [0 0 0];  //matriz 1x3: [frequencia, tempo, no. pontos]
        
       //Instantes de tempo
        y.tempo = []; //matrix 1xN
        
    elseif length(varargin) == 1 then
        //Copia parametros
        y0 = varargin(1);
        ias_guard(y0);
        
        y.params = y0.params;
        y.tempo = y0.tempo;
        
    else
        error("ias_novo : esperava-se 0 ou 1 argumentos");
    end
    
    //dados adquiridos
    y.dados = []; //matriz 1xN
    
    //DFT dos dados
    y.dft = []; //matriz 1xN
    
    //Ferquencias da DFT
    y.freqs = []; //matrix 1xN (calculadas em ias_processar)
    
    //Dados de espectrograma
    y.specg = cell(1,3);
endfunction


