# Listas: Coleção ordenável e mutável, permite membros duplicados
lista = ['Aba', 'Rio', "Dio", 5, 3.5, False]
print(lista[2])
for item in lista:
    print(item)

## Tuplas: coleção ordenada e imutável, permite membros duplicados
tupla = ('Aba', 5, 3.5, True)
print(tupla[3])

## Dicionario: Itens chave-valor, ordenáveis, mutáveis e NÃO permitem membros duplicados
dicionario = {
    "nome": "valor",
    "logica": True,
    "numero": 2,
    "float": 2.5,
}
print(dicionario)
print(dicionario["nome"])

# Conjunto: coleções não ordenadas, não indexadas, não permitem itens duplicados
conjunto = {True, 2, "Teste", 55.4}
print(conjunto)
