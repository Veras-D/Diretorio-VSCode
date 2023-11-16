var listaFilmes = [];
listaFilmes[0] = 'https://br.web.img2.acsta.net/pictures/20/08/03/10/14/5958342.jpg';
listaFilmes[1] = 'https://upload.wikimedia.org/wikipedia/pt/3/3b/A_Viagem_de_Chihiro.JPG';
listaFilmes[2] = 'https://br.web.img3.acsta.net/pictures/15/02/27/10/34/568526.jpg';
listaFilmes[3] = 'https://play-lh.googleusercontent.com/tmtH2fxJX13P337vB-b8ax_8-bUzpcEF0xVjRCNN4vZVcaroW8u_2NmFdSnE6MTBkgDtYz2QdgMlO8h3-xs=w240-h480-rw';
listaFilmes[4] = 'https://scontent.fthe11-1.fna.fbcdn.net/v/t1.6435-9/136055808_1260381507664254_4657343592133219703_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=0bb214&_nc_eui2=AeGkVwrouMMxaiyB567-d3xCecc1tfiBIxh5xzW1-IEjGCSoTnAALu2jsmfD7EzKFeCmA8ZXxI_Ih3GjVSN9D660&_nc_ohc=cNgE0RB41jkAX_akTkK&_nc_ht=scontent.fthe11-1.fna&oh=00_AfCE897CV-qArLOJJLaO8h8gD9lm_8Ijb392lqj2qWvbIw&oe=657D8AE4';

for (let n = 0; n < listaFilmes.length; n++) {
    document.write('<img src=' + listaFilmes[n] + '>');
    
}