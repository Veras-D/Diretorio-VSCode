var num = parseInt(Math.random() * 101);
numPessoa = -1;
cont = 1
while (num != numPessoa) {
    var numPessoa = prompt('Digite um numero entre 1 e 100: ');
    if (num == numPessoa) {
        alert('Acertou!');
    }
    else {
        alert('Errou!')
        if (num > numPessoa) {
            alert('O numero secreto é maior que seu chute, '+numPessoa);
        }
        else {
            alert('O numero secreto é menor que seu chute, '+numPessoa);
        }
    }
    alert('Seu numero de tentativas é: '+cont)
    cont++
}