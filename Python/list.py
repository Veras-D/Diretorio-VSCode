list = []
cont = 0
while True:
    print('Type exit to close the program.')
    if cont >= 2:
        print('Type "remove" to remove last name')
    name = str(input('Type a name: '))
    if name == 'exit':
        break
    elif cont >= 2 and name == 'remove':
        if list == []:
            print('No names logs')
        else:
            list.pop()
            cont += 1
    else:
        list.append(name)
        cont += 1
print(f'The names in list are: {list}')
# Pesq list.insert vs list.opened
