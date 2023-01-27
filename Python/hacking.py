import requests
alvo = 'http://www.google.com/'
work_list = ['login', 'admin', 'responsive', 'css', 'portal', 'system']
for work in work_list:
    try:
        alvo_teste = alvo + work
        print(alvo_teste)
        r = requests.get(alvo_teste)
        print(r.status_code)
    except:
        print('404')


