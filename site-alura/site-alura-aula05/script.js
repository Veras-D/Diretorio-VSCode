var paulo = {
    nome: 'Paulo',
    vitorias: 0,
    empates: 0,
    derrotas: 0,
    pontos: 0
}

var rafa = {
    nome: 'Rafael',
    vitorias: 0,
    empates: 0,
    derrotas: 0,
    pontos: 0
}

var elementoTabela = document.getElementById('tabelaJogadores')

function displayOnScreen() {
    elementoTabela.innerHTML = `
        <tr>
            <td>${paulo.nome}</td>
            <td>${paulo.vitorias}</td>
            <td>${paulo.empates}</td>
            <td>${paulo.derrotas}</td>
            <td>${paulo.pontos}</td>
            <td><button onClick="adicionarVitoria(paulo)">Vitória</button></td>
            <td><button onClick="adicionarEmpate(paulo)">Empate</button></td>
            <td><button onClick="adicionarDerrota(paulo)">Derrota</button></td>
        </tr>
    `;
}

displayOnScreen();

function adicionarVitoria(jogador) {
    jogador.vitorias++;
    jogador.pontos ++;
    displayOnScreen();
}

function adicionarEmpate(jogador) {
    jogador.empates++;
    displayOnScreen();
}

function adicionarDerrota(jogador) {
    jogador.derrotas++;
    jogador.pontos--;
    displayOnScreen();
}