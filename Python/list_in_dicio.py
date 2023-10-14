from typing import List, Dict

pessoas: List[Dict[str, str]] = [
    {"nome": "Danilo", "sobrenome": "Veras"},
    {"nome": "Antonio", "sobrenome": "José"},
    {"nome": "Maria", "sobrenome": "Eduarda"},
    {"nome": "Sergio", "sobrenome": "Louro"}
]

def busca(
    pessoas: List[Dict[str, str]], nome_buscado: str
) -> Dict[str, str]:
    for pessoa in pessoas:
        nome, sobrenome = pessoa.values()
        
        if nome_buscado == f'{nome} {sobrenome}':
            return pessoa
        return {}

nome_var = 'Danilo Veras'
if __name__== "__main__":
    pessoa_1 = busca(pessoas, nome_var)
print(pessoa_1)
