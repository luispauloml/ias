//Funções para gerar sinais

//Seno: frequencia, fase e tempo
function y = seno(t,f);
    y = sin(2*%pi*f.*t);
endfunction

//Cosseno: frequencia, fase e tempo
function y = cosseno(t,f)
    y = cos(2*%pi*f.*t);
endfunction

//Chirp: variação linear da frequencia de um seno
function y = chirp(t,g,f0,k)
    fs = f0 + k.*t;
    y = g(t,fs);
endfunction

//Onda quadrada
function y = quadrada(t,f)
    y = - sign(serra(t,f));
endfunction

//Onda serra
function y = serra(t,f)
    y = modulo(t,1./f) - 1./(2*f);
endfunction

