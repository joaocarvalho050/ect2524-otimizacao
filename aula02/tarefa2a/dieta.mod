set ALIMENTOS;

param custo {ALIMENTOS} >= 0;

param calorias {ALIMENTOS} >=0;
param proteina {ALIMENTOS} >=0;
param calcio {ALIMENTOS} >=0;
param sodio {ALIMENTOS} >=0;
param ferro {ALIMENTOS} >=0;
param vitamina_A {ALIMENTOS} >=0;
param vitamina_C {ALIMENTOS} >=0;
param vitamina_B1 {ALIMENTOS} >=0;

var x {ALIMENTOS} >= 0;

minimize Custo_Total:
    sum {i in ALIMENTOS} custo[i] * x[i];

subject to Limite_Calorias:
    1800 <= sum {i in ALIMENTOS} calorias[i] * x[i]
    <= 2400;

subject to Limite_Proteina:
    50 <= sum {i in ALIMENTOS} proteina[i] * x[i]
    <= 175;

subject to Limite_Calcio:
    1.0 <= sum {i in ALIMENTOS} calcio[i] * x[i]
    <= 2.5;

subject to Limite_Sodio:
    1.5 <= sum {i in ALIMENTOS} sodio[i] * x[i]
    <= 2.3;

subject to Limite_Ferro:
    0.008 <= sum {i in ALIMENTOS} ferro[i] * x[i]
    <= 0.045;

subject to Limite_Vitamina_A:
    600 <= sum {i in ALIMENTOS} vitamina_A[i] * x[i]
    <= 3000;

subject to Limite_Vitamina_C:
    75 <= sum {i in ALIMENTOS} vitamina_C[i] * x[i]
    <= 2000;

subject to Limite_Vitamina_B1:
    1.1 <= sum {i in ALIMENTOS} vitamina_B1[i] * x[i]
    <= 50;