console.log("Hello word JavaScript!")

// console
console.error('Esse é um erro.')
console.warn('Esse é um aviso.')
console.log('Essa é uma mensagem.')

// Variáveis
var x = 10
// Maneiras mais modernas
let y = 15
const z = 20

if (1){
    let y = 55
    console.log(y)
}

console.log(x)
console.log(y)
console.log(z)

y = 25

console.log(y)

// tipos de dados

const name = 'Danilo'
console.log(name)
console.log(typeof name)

const shirtsQty = 22
console.log(typeof shirtsQty)

const decimal = 12.5
console.log(typeof decimal)

const isApproved = false // true or false
console.log(typeof isApproved)

let surname = null
console.log(typeof surname)

surname = 'Veras'
console.log(typeof surname)

let age 
console.log(age)
console.log(typeof age)

age = 30
console.log(age)
console.log(typeof age)

const languages = ['Java', 'Python', 'C++']
console.log(languages)
console.log(typeof languages)

const user = {email: 'dveras@teste.com', password: 'teste123', age: 55} // object literals

// Métodos de string
const fullName = 'Danilo Veras'
console.log(fullName.length)

// control + : comenta texto selecionado

const stringToArray = fullName.split(' ')
console.log(stringToArray)

console.log(fullName.toLocaleLowerCase())
console.log(fullName.toUpperCase())
console.log(fullName.indexOf('Veras'))
console.log(fullName.slice(0, 6))

// Métodos de Array
const list = ['a', 'b', 'c', 'd', 'e']
console.log(list.length)
console.log(list[2])
list[5] = 'f'
console.log(list)
console.log(list[list.length - 1])
list.push('g')
console.log(list)
list.pop()
console.log(list)
list.shift()
console.log(list)
list.unshift('a')
console.log(list)

//objects
const product = {
    name: 'camisa',
    price: '15.99',
    inStock: true,
    sizes: ['EP', 'P', 'M', 'G', 'EG'],
    'main color': 'blue'
}
console.log(product.name)
console.log(product['name'])

// console.log(main color) // Errado
console.log(product['main color'])

// Destructuring
const {price, inStock} = product
console.log(price)
console.log(inStock)

const [n1, n2] = list
console.log(n1)
console.log(n2)

// JSON - JavaScript Object Notation
const dog = {
    name: 'Joui',
    age: 4
}

const json =JSON.stringify(dog)
console.log(json)

const obj = JSON.parse(json)
console.log(obj)

// Estruturas condicionais
const a = 10
if(a == 10) {
    console.log('a é igual a 10')
}

// >, <, >=, <= e ==

b = 'Danilo'
if(b === 'João') {
    console.log('b é João')
} else if(b === 'Marcos') {
    console.log('b é Marcos')
} else {
    console.log('nome não encontrado')
}
// === valida se o tipo e o valor dos dados são iguais

// if ternário
const someNumber = 14
let testingANumber = someNumber < 20 ? 'yes': 'no'
console.log(testingANumber)

// Estruturas de repetição - Loop 
const myList = [1, 2, 3, 4, 5, 6]
let counter = 0

while(counter < myList.length) {
    console.log('Imprimindo: ', myList[counter])
    counter++ // counter = counter + 1
}
const mySecondList = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
for(let counter = 0; counter < mySecondList.length; counter++) {
    console.log(`Imprimindo: ${mySecondList[counter]}`) // Template literals
}

// métodos de array -> repetição
const names = ['Marcos', 'João', 'Alex', 'Costa', 'Silva']

names.forEach(function(name){
    console.log(`Imprimindo: ${name}`)
})

const modifiedNames = names.map(function(name){
    if(name === 'Marcos'){
        return (name = 'Sr. Marcos')
    } else{
        return name 
    }
})
console.log(modifiedNames)

const bigNumbers = [2, 4, 8, 16, 32, 64, 128, 256, 512, 1024].filter(function(number){
    return number > 100
})
console.log(bigNumbers)

const sumAll = [1, 10, 100, 1000, 10000, 100000].reduce(function(total, number){
    return total + number
})
console.log(sumAll)

// function
function myFunction(a, b){
    return a + b
}
console.log(myFunction(1,2))

function prodAndPrice(product, price){
    return `O produto ${product} custa ${price} reais`
}

console.log(prodAndPrice('Calça', 15.00))

const prod = 'sabão'
const preço = 4.99
console.log(prodAndPrice(prod, preço))

// arrow function
const myArrowFunction = (a, b) => {
    return a**b
}
console.log(myArrowFunction(2, 5))
const sumAll2 = [1, 10, 100, 1000, 10000, 100000].reduce((total, number) => {
    return total + number
})
const mySimpleArrowFunction = (a, b) => a + b
console.log(mySimpleArrowFunction(1, 1))

// Classes 
class productClass {
    constructor(name, price) {
        this.name = name
        this.price = price
    }
    productDetails(){
        return `O produto ${this.name} custa R$${this.price} reais`
    }
}

const socks = new productClass('Meia branca', 9.99)
console.log(socks.name)
console.log(socks.price)

const shirt = new productClass('Camisa listrada', 17.99)
console.log(shirt.name)
console.log(shirt.price)

console.log(shirt.productDetails())

//herança 

class superProducts extends productClass{
    constructor(name, price, size){
        super(name, price)
        this.size = size
    }
    showAdjective(adjective){
        return `O ${this.name} é muito ${adjective}`
    }
    // static
    static sayHello(){
        console.log('Hello')
    }
}

const tênis = new superProducts('tênis vermelho', 99.90, '44' )
console.log(tênis.name)
console.log(tênis.size)

console.log(tênis.showAdjective('bom'))

superProducts.sayHello()

// DOM - Document object model
// Seleção de elementos
const title = document.getElementById('title') //#title
console.log(title)

// query selector
const sameTitle = document.querySelector('#title')
console.log(sameTitle)

const texts = document.querySelectorAll('.text')
console.log(texts)
console.log(texts[2])

texts.forEach((text) => {
    console.log(text.textContent.toUpperCase())
})

// Manipulação de elementos
title.textContent = 'Mudei o texto'
texts[0].innerHTML = '<span>Alteramos o HTML deste elemento</span>'
texts[1].style.backgroundColor = 'blue' // background-color: red - CSS
texts[2].classList.add('my-class')
texts[2].classList.remove('text')
texts[3].remove()

// Eventos
const btn =document.querySelector('#btn')
btn.addEventListener('click', function(){
    texts[2].style.color = 'purple'
})