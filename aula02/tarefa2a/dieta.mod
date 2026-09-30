set ALIMENTOS;
set NUTRIENTES;

param custo {ALIMENTOS} >= 0;

param a {ALIMENTOS, NUTRIENTES} >= 0;

param minimo {NUTRIENTES} >= 0;
param maximo {NUTRIENTES} >= 0;

var x {ALIMENTOS} >= 0;

minimize Custo_Total:
    sum {i in ALIMENTOS} custo[i] * x[i];

subject to Limite_Nutrientes {j in NUTRIENTES}:
    minimo[j] <= sum {i in ALIMENTOS} a[i,j] * x[i]
    <= maximo[j];