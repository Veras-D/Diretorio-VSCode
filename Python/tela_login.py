"""
Este é um programa que mostra uma tela de login
Autor: Veras-D
Data: 18/02/23
"""
import PySimpleGUI as sg
sg.theme('Reddit')
layout = [
    [sg.Text('Nome'), sg.Input(key='nome')],
    [sg.Text('Senha'), sg.Input(key='senha', password_char='*')],
    [sg.Checkbox('Lembre-se de min')],
    [sg.Button('Enviar')]
]
tela = sg.Window('Tela de login', layout=layout)
while True:
    eventos, valores = tela.read()
    if eventos == sg.WINDOW_CLOSED:
        break
    elif eventos == 'Enviar':
        if valores['nome'] == 'Veras' and valores['senha'] == '12345678':
            print('Bem-vindo')
