# Calculadora
import math
import sympy
from sympy import symbols
from sympy.solvers import solve

def add():
    a = float(input("A: "))
    b = float(input("B: "))
    return a + b

def sub():
    a = float(input("A: "))
    b = float(input("B: "))
    return a - b

def mult():
    a = float(input("A: "))
    b = float(input("B: "))
    return a * b

def div():
    a = float(input("A: "))
    b = float(input("B: "))
    return a / b

def is_prime_num():
    a = int(input("A: "))
    for i in range(2, a):
        if a % i != 0:
            return True
        return False

def GPFN(): # Generate prime factors of a number
    PF = [] # prime factors
    a = int(input("A: "))
    for i in range(2, a):
        if a % i == 0:
            PF.append(i)
    return PF

def SSR(): # Simplify square roots
    a = int(input("A: "))
    upper_limit = math.floor(math.sqrt(a)) + 1
    max_factor = 1
    other_factor = 1
    square_root = 1

    for maybe_factor in range(1, upper_limit):
        if a % (maybe_factor**2) == 0:
            max_factor = maybe_factor**2

    other_factor = n/max_factor

    square_root = int(math.sqrt(max_factor))
    other_factor = int(other_factor)
    output = square_root*sympy.sqrt(other_factor)
    return output

def solve_for_x():
    x = symbols('x')
    a = str(input('Eq(x): '))
    return f"x = {solve(a,x)[0]}"

# Write your code here
text = """
===== MENU =====
[ 1 ] - Opção 1
[ 2 ] - Opção 2
[ 3 ] - Opção 3
[ 4 ] - Opção 4
"""
print(text)
op = 0
while op > 4 or op < 1:
    op = int(input('Escolha uma opção: '))
    if op > 4 or op < 1:
        print('Selecione uma opção valida!')

text2 = f'Você escolheu a opção: {op}!'

if op == 1:
    print(f'{text2}')
elif op == 2:
    print(f'{text2}')
elif op == 3:
    print(f'{text2}')
elif op == 4:
    print(f'{text2}')

# This step does not have test

# Write your code here
def add():
    a = float(input("A: "))
    b = float(input("B: "))
    return a + b

def sub():
    a = float(input("A: "))
    b = float(input("B: "))
    return a - b

def mult():
    a = float(input("A: "))
    b = float(input("B: "))
    return a * b

def div():
    a = float(input("A: "))
    b = float(input("B: "))
    return a / b

def is_prime_num():
    a = int(input("A: "))
    for i in range(2, a):
        if a % i != 0:
            return True
        return False

def GPFN(): # Generate prime factors of a number
    PF = [] # prime factors
    a = int(input("A: "))
    for i in range(2, a):
        if a % i == 0:
            PF.append(i)
    return PF

def SSR(): # Simplify square roots
    a = int(input("A: "))
    upper_limit = math.floor(math.sqrt(a)) + 1
    max_factor = 1
    other_factor = 1
    square_root = 1

    for maybe_factor in range(1, upper_limit):
        if a % (maybe_factor**2) == 0:
            max_factor = maybe_factor**2

    other_factor = n/max_factor

    square_root = int(math.sqrt(max_factor))
    other_factor = int(other_factor)
    output = square_root*sympy.sqrt(other_factor)
    return output
    
def solve_for_x():
    x = symbols('x')
    a = str(input('Eq(x): '))
    return f"x = {solve(eq,x)[0]}"

def A_for_B():
    a = float(input('A: '))
    b = float(input('B: '))
    return a**b

# ---------------------------------------------

text = """
===== MENU =====
[ 1 ] - Adição
[ 2 ] - Subtração
[ 3 ] - Multiplicação
[ 4 ] - Divisão
[ 5 ] - Encontre um numero primo
[ 6 ] - Gerador de fatores primos
[ 7 ] - Simplificador de raiz quadrada
[ 8 ] - Solver de Equações
[ 9 ] - Elevar A a B
"""
print(text)
op = 0
while op > 9 or op < 1:
    op = int(input('Escolha uma opção: '))
    if op > 9 or op < 1:
        print('Selecione uma opção valida!')

text2 = f'Você escolheu a opção: {op}!'

if op == 1:
    print(add())
elif op == 2:
    print(sub())
elif op == 3:
    print(mult())
elif op == 4:
    print(div())
elif op == 5:
    print(is_prime_num())
elif op == 6:
    print(GPFN())
elif op == 7:
    print(SSR())
elif op == 8:
    print(solve_for_x())
elif op == 9:
    print(A_for_B())
    
# This step does not have test