function adicionarFilme() {
    var filmeFavorito = document.getElementById('filme').value
    var elementoListaFilme = document.getElementById('listaFilmes')
    elementoListaFilme.innerHTML = elementoListaFilme.innerHTML + '<img src=' + filmeFavorito + '>'
    document.getElementById('filme').value = null
}
// https://m.media-amazon.com/images/I/71DOGFSR6bL._AC_UF894,1000_QL80_.jpg