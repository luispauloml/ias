# ias
Um conjunto de ferramentas simples para análise de sinais no Scilab.

Tudo é feito em listas `tlist`. Cada objeto contém um único sinal, seus parâmetros de aquisição e dados processados.

1. Parâmetros de amostragem (dois de três são necessários):
	 - Frequência de amostragem,
	 - Tempo de amostragem,
	 - Número de pontos.

2. Amostragem:
	 - Importar sinal WAV,
     - Importar vetor real de valores,
	 - Amostrar sinal determinístico.

3. O resultado do processamento:
	 - Transformada Discreta de Fourier (DFT),
	 - Espectograma (três matrizes: tempo, frequência e DFT).

4. Outras ferramentas:
	 - Combinação de sinais (superposição e modulação por amplitude),
	 - Visualização de gráficos;
     - Extração de parâmetros.

---

***Nota***
Este é o resultado de um trabalho da disciplina de Instrumentação e Análise de Sinais, da Faculdade de Engenharia de Ilha Solteira, da UNESP (2018).
