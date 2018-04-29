//Gerando e combinando sinais
function y = gerar(fs,t,g)
    y = ias_configurar(ias_novo(),'ft',[fs t]);
    y = ias_amostrarf(y,g);
    y = ias_processar(y);
endfunction

function [] = mostrar(y)
    ias_graficos(y);
    ias_reproduzir(y);
    sleep(y.params(2)*1d3);
endfunction

s1 = gerar(44100,2,list(chirp,serra,100,(1000-100)/2))//chirp,serra,100,(1000-100)/2));
mostrar(s1);

s2 = gerar(44100,2,list(seno,3000));
mostrar(s2);

ss = ias_combinar(s1,s2,'s');
ss = ias_processar(ss);
mostrar(ss);

sm = ias_combinar(s1,s2,'m');
sm = ias_processar(sm);
mostrar(sm);
