function [] = ias_graficos(varargin);
    
    y = varargin(1);
    ias_guard(y);
    
    select length(varargin)
    case 1
        scf();
    case 2
        scf(varargin(2));
        clf();
    else
        error("ias_graficos: esperava-se 1 ou 2 argumentos: dados e manipulador de figura");
    end
    
    ts = ias_extrair(y,'tm');   //matriz de tempo
    fs = ias_extrair(y,'fm');   //matriz de frequências
    ds = ias_extrair(y,'d');    //dados
    n  = ias_extrair(y,'n');    //número de pontos
    
    subplot(3,1,1);
    plot2d(ts',ds');
    xtitle('Sinal','Tempo (s)','Amplitude')
    xgrid();
    
    subplot(3,1,2);
    dft = y.dft(:,1:ceil(n/2)); 
    plot2d(fs(1:ceil(n/2))', abs(dft)',logflag="nl");
    xtitle('','Frequência (Hz)', 'Magnitude (dB)');
    xgrid();
    
    [S, ts, fs]  = ias_extrair(y,'spec');
    
    subplot(3,1,3)
    grayplot(ts,fs,log(abs(S)));
    xtitle('Espectrograma','Tempo (s)','Frequência (Hz)');
    
    mapa = flipdim(rainbowcolormap(floor(length(fs)/2)),1);
    
    xname("Fig. %d: Análise de sinais");
    set(gcf(),"color_map",[[0 0 1]; mapa(2:$,:)]);
end
