
function y = ias_importar(varargin)
    
    errormsg = "ias_importar: 1 ou 3 argumentos esperado.";
    
    select length(varargin)
    case 1
        //importar WAV
        if (type(varargin(1)) <> 10) then
            error("ias_importar: 1 argumento: dever ser o caminho para um arquivo WAV.");
        else
            [ds, Fs, bits] = wavread(varargin(1));

        end
    
    case 3
        //importar matriz + parâmetro
        ds = real(varargin(1));
        
        //verificar se é vetor
        if (length(ds) == 0) then
            warning("ias_importar: dados vazios");
        elseif (size(ds,'r') <> 1 & size(ds,'c') <> 1) then
            warning("ias_importar: apenas a primeira linha será adquirida");
            ds = ds(1,:);
        elseif (size(ds,'r') <> 1) then
            ds = ds.';
        end
        
        select varargin(2)
        case 'f'
            Fs  = varargin(3);
        case 't'
            Fs = (length(ds)-1)/varargin(3);
        else
            error("ias_importar: 2o argumento deve ser string: ''f'' ou ''t''");
        end
    else
        error(errormsg);
    end
        
    
    y = ias_novo();
    
    n = length(ds);
    t_max = (n-1)/Fs;
    ts = 0:1/Fs:t_max;
    
    y.tempo = ts;
    y.dados = ds;    
    y.params = [Fs, t_max, n];
    
endfunction
