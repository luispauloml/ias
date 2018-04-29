function [] = ias_graficos(varargin);
    
    y = varargin(1);
    ias_guard(y);
    
    select length(varargin)
    case 1
        scf();
    case 2
        scf(varargin(2));
    else
        error("ias_graficos : devem ser dois argumentos: dados e manipulador de figura");
    end
    
    ts = y.tempo;
    fs = y.freqs
    ds = real(y.dados);
    n = y.params(3);
    
    subplot(2,2,1);
    plot2d(ts',ds');
    xtitle('Sinal','Tempo (s)','Amplitude')
    
    subplot(2,2,2);
    dft = y.dft(:,1:ceil(n/2)); 
    plot2d(fs(1:ceil(n/2))', abs(dft)',logflag="nl");
    xtitle('','Frequência (Hz)', 'Magnitude (dB)');
    
    S  = y.specg{1};
    ts = y.specg{2};
    fs = y.specg{3};
    
    subplot(2,2,3)
    grayplot(ts,fs,log(abs(S)));
    
    mapa = flipdim(rainbowcolormap(floor(length(fs)/2)),1);
    mapa0 = get(gcf(),'color_map');
    
    xname("Fig. %d: Análise de sinais");
    set(gcf(),"color_map",[[0 0 1]; mapa0(3:8,:); mapa(9:size(mapa,'r'),:)]);
end
