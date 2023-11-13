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
