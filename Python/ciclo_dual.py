"""
Este código realiza cálculos e gera gráficos para um ciclo termodinâmico.

Parâmetros:
- P1 (float): Pressão inicial (em kPa).
- T1 (float): Temperatura inicial (em K).
- th (float): Valor do ângulo theta em graus.
- r (float): Razão de compressão.
- rc (float): Razão de corte.
- rp (float): Razão de pressão.
- cv (float): Calor específico a volume constante (em kJ / kg * K).
- cp (float): Calor específico a pressão constante (em kJ / kg * K).

Retorna:
Nenhum retorno explícito, mas imprime na saída os resultados de cálculos de eficiência,
trabalho, calor específico, e cria e exibe gráficos P-v.

O código realiza os seguintes cálculos:
1. Calcula a temperatura T5.
2. Realiza cálculos de pressão, temperatura e volume específico para os estados 1 a 5.
3. Calcula rendimento e eficiência.
4. Cria um DataFrame com os valores dos estados e imprime na saída.
5. Calcula e imprime na saída os valores de trabalho e calor específico.
6. Gera e exibe gráficos P-v para diferentes processos termodinâmicos.

O programa não tem interação com o usuário, os valores dos parâmetros são 
fornecidos diretamente no código.

Nota:
- Certifique-se de que as bibliotecas numpy, matplotlib e pandas estejam instaladas 
para executar este código.
- Certifique-se de que as unidades dos parâmetros fornecidos estão corretas para 
garantir os resultados adequados.
"""
from math import pi
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
P1 = 100  # kpa
T1 = 300  # k
# T5 ou q_sai = ???
r = 18  # razão de compressão
rc = 1.2  # razão de corte
rp = 1.5  # razão de pressão
cv = 0.717  # kJ / kg * k
cp = 1.0048  # kJ / kg * k
R = cp - cv  # kJ / kg * k
v1 = (R * T1) / P1
v5 = v1
# P * v = R * T
k = cp / cv
# P1 * v1 ** k = P2 * v2 ** k
# 1-2
P2 = P1 * r ** k
T2 = T1 * r ** (k - 1)
v2 = v1 / r

# 2-3
P3 = P2 * rp
T3 = T2 * rp
v3 = v2

# 3-4
P4 = P3
T4 = T3 * rc
v4 = v3 * rc

# 4-5
P5 = P4 * (rc / r) ** k
T5 = T4 * (rc / r) ** (k - 1)

# final
w12 = cv * (T2 - T1)
w34 = P3 * (v4 - v3)
w45 = abs(cv * (T5 - T4))

q23 = cv * (T3 - T2)
q34 = cp * (T4 - T3)

q_ent = q23 + q34
q_sai = cv * (T5 - T1)
w_liq1 = q_ent - q_sai
w_liq2 = w34 + w45 - w12
nt1 = 1 - (1 / r ** (k - 1)) * ((rp * (rc ** k) - 1) / ((rp - 1) + k * rp * (rc - 1)))
nt2 = 1 - q_sai / q_ent
pme = w_liq1 / (v1 - v2)
print(f'Rendimento = {nt1 * 100:.3f}% = {nt2 * 100:.3f}%\n'
      f'pme = {pme:.3f} kpa\n')
R1 = P1 * v1 / T1
R2 = P2 * v2 / T2
R3 = P3 * v3 / T3
R4 = P4 * v4 / T4
R5 = P5 * v5 / T5
estados = np.array([[P1, T1, v1, R1],
                    [P2, T2, v2, R2],
                    [P3, T3, v3, R3],
                    [P4, T4, v4, R4],
                    [P5, T5, v5, R5]])
df = pd.DataFrame(estados)
df.columns = ["Pressão (kpa)", "Temperatura (k)", "Vol. Especifico (m^3 / kg)", "R (kJ / kg * k)"]
df.index = pd.RangeIndex(1, len(df) + 1)
print(df)
print(f'\nw34 = {w34:.3f} kj/kg\n'
      f'w12 = {w12:.3f} kj/kg\n'
      f'w45 = {w45:.3f} kj/kg\n'
      f'q23 = {q23:.3f} kj/kg\n'
      f'q34 = {q34:.3f} kj/kg\n'
      f'q41 = {q_sai:.3f} kj/kg\n'
      f'q_ent = {q_ent:.3f} kj/kg')
print(f'w_liq2 = {w_liq2:.3f} kj/kg')
print(f'w_liq1 = {w_liq1:.3f} kj/kg')
# fazer gráficos P-v e T-s
P_1 = np.array([P2, P3, P4])
v_1 = np.array([v2, v3, v4])
plt.plot(v_1, P_1)
P_teste1 = np.linspace(P1, P2)
v2 = ((P1 * v1 ** k) / P_teste1) ** (1 / k)
plt.plot(v2, P_teste1)
P_teste2 = np.linspace(P4, P5)
v5 = ((P4 * v4 ** k) / P_teste2) ** (1 / k)
plt.plot(v5, P_teste2)
v_2 = np.linspace(v5, v1)
P_2 = np.linspace(P5, P1)
plt.plot(v_2, P_2)
plt.show()
# tentar fazer um grafico melhor
# Ciclo real??? mistura ar mais combustivel
# L_0 = m_ar / m_c = (1 / 0.23) * ((8 / 3) * x + 8 * y - Oc)
# m_m = m_ar + m_c
# m_m = P1 * V_m / (R * T1)
# ro = m_m / V_m
# cilindrada total = Vd, Vdu = cilindrada unitária, z = numero de cilindros
# Vdu = pi * (D/2)^2 * h
Dian = 0.1  # Diâmetro do cilindro cm
s = 0.1  # altura do cilindro cm
z = 6  # numero de cilindros
Vd = pi * (Dian/2) ** 2 * s * z  # cilindrada cm^3
N = 3200  # rpm
m_m = Vd * 1000 / (v1 - v2)  # kg
# volume morto = v_total - v_cilindrada_unitária = V2
# v_total = V1
