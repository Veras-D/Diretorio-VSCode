# Chave-valor
print('\n'*3)
dicio = {
    "chave1": "valor1",
    "chave2": "valor2",
    "chave3": "valor3",
    "chave4": "valor4"
}

# adicionar ou modificar
valorn = dicio["chave3"]
dicio["nova_chave"] = "novo_valor"
print(dicio)
dicio["chave1"] = "novo_valor_chave1"
print(dicio)

# listar
print('\n'*3)
for chave in dicio:
    print(chave)
print('\n'*3)
for chave in dicio:
    print(dicio[chave])

print('\n'*3)
for chave in dicio:
    print(f'{chave}: {dicio[chave]}')

# ou
print('\n'*3)
print(dicio.keys())
print(dicio.values())

# remover
print('\n'*3)
dicio.pop("chave3")
print(dicio)

print('\n'*3)
# procurando por uma chave
if "chave3" in dicio:
    print("existe")
else:
    print("Não existe")

# procurando por um valor
if "valor2" in dicio.values():
    print("existe")
else:
    print("Não existe")
