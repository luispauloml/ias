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
    
    drawlater();
    
    ts = ias_extrair(y,'tm');   //matriz de tempo
    fs = ias_extrair(y,'fm');   //matriz de frequências
    ds = ias_extrair(y,'d');    //dados
    n  = ias_extrair(y,'n');    //número de pontos
    dft = ias_extrair(y,'dft'); //dft
    [S, ts_spec, fs_spec]  = ias_extrair(y,'spec'); //espectrograma
    
    isProcessado = %T;
    
    if or([length(dft) length(S) length(ts) length(fs)] == 0) then
        isProcessado = %F;
        warning("ias_graficos: dados processados incompletos");
    end
    
    if isProcessado then
        subplot(3,1,2);
    
        plot2d(fs(1:ceil(n/2))', abs(dft(1:ceil(n/2)))',logflag="nl");
        xtitle('','Frequência (Hz)', 'Magnitude (dB)');
        xgrid();
        
        n_spec = length(fs_spec);
        
        subplot(3,1,3)
        grayplot( ts_spec ...
                , fs_spec(1:ceil(n_spec/2)) ...
                , log10( abs( S(:,1:ceil(n_spec/2)) ) ) );
        xtitle('Espectrograma','Tempo (s)','Frequência (Hz)');
        
        mapa = flipdim(rainbowcolormap(floor(n_spec/2)),1);
        
        xname("Fig. %d: Análise de sinais");
        set(gcf(),"color_map",[[0 0 1]; mapa(2:$,:)]);
    
        subplot(3,1,1);
    end
    
    plot2d(ts',ds');
    xtitle('Sinal','Tempo (s)','Amplitude')
    xgrid();
    
    drawnow();
end
