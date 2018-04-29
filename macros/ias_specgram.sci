function varargout = ias_specgram(x,Fs,varargin)
    
    if size(x,'c') <> 1 & size(x,'r') <> 1 then
        error ("specgram data must be a vector");
    end
    
    if size(x,'r') <> 1 then
        x = x'
    end
    
    select length(varargin)
    case 0
        n = min([256 length(x)]);
    case 1
        n = min([varargin(1) length(x)]);
    else
        error('specgram : 2 ou 3 argumentos esperados');
    end
    
    wind = window('hm',n);
    pace = n - ceil(n/2);
    
    timebins = 1:pace:length(x);
    nFreqbins = ceil(n/2);
    
    S = zeros(length(timebins),nFreqbins);
    
    for i = 2 : length(timebins)-1
        xs = x(timebins(i-1) : timebins(i+1)-1) .* wind;
        s = fft(xs);
        S(i, :) = s(1:nFreqbins);
    end
    
    ts = 0:1/Fs:(length(x)-1)/Fs;
    ts = ts(timebins);
    
    fs = [0:ceil(n/2)-1] .* Fs/n;
    
    varargout = list(S,ts,fs);
endfunction
