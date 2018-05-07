function varargout = ias_processar(varargin)
    
    y = varargin(1);
    args = list(varargin(2:$));
    ias_guard(y);
    
    valores = ['dft', 'spec'];
    
    //processamento completo
    if length(args) == 0 then
        y.dft = ias_processar(y,'dft');
        
        [S,ts,fs] = ias_processar(y,'spec');
        y.specg   = {S, ts, fs};
        
        Fs    = ias_extrair(y,'f');
        t_max = ias_extrair(y,'t');
        n     = ias_extrair(y,'n');
        
        fs      = 0:1/t_max:Fs;
        y.freqs = fs(1:n);
        
        varargout = list(y);
    
    //processamento individual
    elseif length(args) == 1 then
        
        if type(args(1)) <> 10 then
            error("ias_processar: argumento 2 deve ser um string: ''dft'' ou ''spec''");
        end
        
        select args(1)
        case valores(1) //processar dft
            varargout = list(fft(ias_extrair(y,'d')));
            
        case valores(2) //processar espectrograma
            [S,ts,fs] = ias_specgram(ias_extrair(y,'d'),...
                                     ias_extrair(y,'f'));
            varargout = list(S,ts,fs);
        end
    else
        errormsg = "ias_processar: esperava-se 1 ou 2 argumentos";
        error(errormsg);
    end

endfunction

function varargout = ias_specgram(x,Fs)
    
    if size(x,'c') <> 1 & size(x,'r') <> 1 then
        error ("ias_specgram: o primeiro argumento deve ser um vetor");
    end
    
    if size(x,'r') <> 1 then
        x = x'
    end
    
    n = min([256 length(x)]);
    
    wind = window('hm',n);
    pace = n - ceil(n/2);
    
    Np = length(x);
    timebins = 1:pace:Np;
    
    //para números ímpares
    if ~modulo(Np,2) then
        timebins = [timebins Np];
    end
    
    S = zeros(length(timebins)-2,n-1);
    
    for i = 2 : length(timebins)-1
        xs = x(timebins(i-1) : timebins(i+1)-1);
        xs =  xs .* wind(1:length(xs));
        s = fft(xs);
        S(i-1, :) = s(1:n-1);
    end
    
    ts = 0:1/Fs:(length(x)-1)/Fs;
    ts = ts(timebins);
    ts = ts(2:$-1);
    
    fs = linspace(0,(n-1)/n*Fs,n-1);
    
    varargout = list(S,ts,fs);
endfunction
