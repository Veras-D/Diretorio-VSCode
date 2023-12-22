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

// Garantir que a imagem esteja centralizada
for (int x1 = 30; x1 <= 150; x1 += 40) {
   for (int y1 = 30; y1 <= 150; y1 += 40) {
       for (int r1 = 2; r1 <= 7; r1 += 2) {
           for (int h1 = 5; h1 <= 7; h1++) {
                img += 1;

                model.param().set("x1",x1+"[mm]");
                model.param().set("y1",y1+"[mm]");
                model.param().set("r1",r1+"[mm]");
                model.param().set("h1",h1+"[mm]");

                model.component("comp1").geom("geom1").run("fin");

                // Falta o código para salvar imagem, usar variável img

                model.result().export().create("img10", "Image"); // Modificar nome img10 e Image para x1-y1-r1-h1
                model.result().export("img10").set("size", "manualweb");
                model.result().export("img10").set("unit", "px");
                model.result().export("img10").set("height", "224");
                model.result().export("img10").set("width", "224");
                model.result().export("img10").set("lockratio", "on");
                model.result().export("img10").set("resolution", "96");
                model.result().export("img10").set("antialias", "on");
                model.result().export("img10").set("zoomextents", "on");
                model.result().export("img10").set("fontsize", "9");
                model.result().export("img10").set("colortheme", "globaltheme");
                model.result().export("img10").set("customcolor", new double[]{1, 1, 1});
                model.result().export("img10").set("background", "transparent");
                model.result().export("img10").set("gltfincludelines", "on");
                model.result().export("img10").set("title1d", "on");
                model.result().export("img10").set("legend1d", "on");
                model.result().export("img10").set("logo1d", "on");
                model.result().export("img10").set("options1d", "on");
                model.result().export("img10").set("title2d", "on");
                model.result().export("img10").set("legend2d", "on");
                model.result().export("img10").set("logo2d", "on");
                model.result().export("img10").set("options2d", "off");
                model.result().export("img10").set("title3d", "on");
                model.result().export("img10").set("legend3d", "on");
                model.result().export("img10").set("logo3d", "on");
                model.result().export("img10").set("options3d", "off");
                model.result().export("img10").set("axisorientation", "on");
                model.result().export("img10").set("grid", "on");
                model.result().export("img10").set("axes1d", "on");
                model.result().export("img10").set("axes2d", "on");
                model.result().export("img10").set("showgrid", "on");
                model.result().export("img10").set("target", "file");
                model.result().export("img10").set("qualitylevel", "92");
                model.result().export("img10").set("qualityactive", "off");
                model.result().export("img10").set("imagetype", "png");
                model.result().export("img10").set("lockview", "off");
                model.result().export("img10").set("pngfilename", "C:\\Users\\CCT\\Desktop\\Defeitos\\prim.png"); // Mudar caminho, não precisa ser uma pasta que exista
                model.result().export("img10").run();
                model.result().export("img10").set("sourceobject", "pg1");
                model.result().export("img10").run();
           }
       }
   }
}
