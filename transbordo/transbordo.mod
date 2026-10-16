# CONJUNTOS
set DEPOSITOS;
set CENTROS;
set CIDADES;

# PARAMETROS
param capacidade {DEPOSITOS} >= 0;
param demanda {CIDADES} >= 0;

param custo_entrada {DEPOSITOS, CENTROS} >= 0;
param custo_saida {CENTROS, CIDADES} >= 0;

# VARIAVEIS
var entrada {DEPOSITOS, CENTROS} >= 0;
var saida {CENTROS, CIDADES} >= 0;

# FUNCAO OBJETIVO
minimize Custo_Total:
    sum {i in DEPOSITOS, k in CENTROS}
        custo_entrada[i,k] * entrada[i,k]
    +
    sum {k in CENTROS, j in CIDADES}
        custo_saida[k,j] * saida[k,j];

# CAPACIDADE DOS DEPOSITOS
subject to Limite_Capacidade {i in DEPOSITOS}:
    sum {k in CENTROS} entrada[i,k]
    <= capacidade[i];

# CONSERVACAO DE FLUXO NOS CENTROS
subject to Conservacao_Fluxo {k in CENTROS}:
    sum {i in DEPOSITOS} entrada[i,k]
    =
    sum {j in CIDADES} saida[k,j];

# DEMANDA DAS CIDADES
subject to Atender_Demanda {j in CIDADES}:
    sum {k in CENTROS} saida[k,j]
    = demanda[j];