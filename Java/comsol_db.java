// int i = 0;

// for (int x1 = 30; x1 <= 150; x1 += 40) {
//    for (int y1 = 30; y1 <= 150; y1 += 40) {
//        for (int x2 = 30; x2 <= 150; x2 += 40) {
//            for (int y2 = 30; y2 <= 150; y2 += 40) {
//                for (int r1 = 2; r1 <= 7; r1 += 2) {
//                   for (int h1 = 5; h1 <= 7; h1++) {
//                       for (int r2 = 2; r2 <= 7; r2 += 2) {
//                           for (int h2 = 5; h2 <= 7; h2++) {
//                               if (x1 != x2 || y1 != y2) {
//                                  i++;
//                               }
//                           }
//                       }
//                   }
//                }
//            }
//        }
//    }
// }


// i = i / 250; Usar para 2 furos ou mais

int img = 0;

for (int x1 = 30; x1 <= 150; x1 += 40) {
   for (int y1 = 30; y1 <= 150; y1 += 40) {
       for (int r1 = 2; r1 <= 7; r1 += 2) {
           for (int h1 = 5; h1 <= 7; h1++) {
                img += 1;

                model.param().set("x1",x1+"[mm]");
                model.param().set("y1",y1+"[mm]");
                model.param().set("r1",r1+"[mm]");
                model.param().set("h1",h1+"[mm]");

                model.component("com1").geom("geom1").run(fin);

               // Falta o código para salvar imagem, usar variável img
           }
       }
   }
}
