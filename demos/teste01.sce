//Importando sinal
y = ias_importar('iuna');

y = ias_processar(y);
ias_graficos(y,clf(0));
ias_reproduzir(y);
sleep(y.params(2));
