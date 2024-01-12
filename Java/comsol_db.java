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
int tempo = 0;
double contraste = 0;
double contrasteAnterior = 0;


// Garantir que a imagem esteja centralizada
for (int x1 = 30; x1 <= 150; x1 += 40) {
  for (int y1 = 30; y1 <= 150; y1 += 40) {
    for (int r1 = 2; r1 <= 7; r1 += 2) {
      for (int h1 = 4; h1 <= 7; h1++) {
        model.param().set("x1", x1+"[mm]");
        model.param().set("y1", y1+"[mm]");
        model.param().set("r1", r1+"[mm]");
        model.param().set("h1", h1+"[mm]");
        
        model.component("comp1").geom("geom1").run("fin");
        
        // Max value Temperatura
        
        model.result().numerical().create("max"+x1+"-"+y1+"-"+r1+"-"+h1, "MaxSurface");
        model.result().numerical("max"+x1+"-"+y1+"-"+r1+"-"+h1).set("data", "surf1");
        model.result().table().create("maxTemp", "Table");
        model.result().table("maxTemp").comments("Gerado no Application Builder");
        model.result().numerical("max"+x1+"-"+y1+"-"+r1+"-"+h1).set("table", "maxTemp");
        model.result().numerical("max"+x1+"-"+y1+"-"+r1+"-"+h1).setResult();
        model.result().create("plot_table_max", "PlotGroup1D");
        model.result("plot_table_max").set("data", "none");
        model.result("plot_table_max").create("tblp1", "Table");
        model.result("plot_table_max").feature("tblp1").set("source", "table");
        model.result("plot_table_max").feature("tblp1").set("table", "maxTemp");
        model.result("plot_table_max").feature("tblp1").set("linewidth", "preference");
        model.result("plot_table_max").feature("tblp1").set("markerpos", "datapoints");
        model.result("plot_table_max").run();
        
        // Min value Temperatura
        
        model.result().numerical().create("min"+x1+"-"+y1+"-"+r1+"-"+h1, "MinSurface");
        model.result().numerical("min"+x1+"-"+y1+"-"+r1+"-"+h1).set("data", "surf1");
        model.result().table().create("minTemp", "Table");
        model.result().table("minTemp").comments("Gerado no Application Builder");
        model.result().numerical("min"+x1+"-"+y1+"-"+r1+"-"+h1).set("table", "minTemp");
        model.result().numerical("min"+x1+"-"+y1+"-"+r1+"-"+h1).setResult();
        model.result().create("plot_table_min", "PlotGroup1D");
        model.result("plot_table_min").set("data", "none");
        model.result("plot_table_min").create("tblp1", "Table");
        model.result("plot_table_min").feature("tblp1").set("source", "table");
        model.result("plot_table_min").feature("tblp1").set("table", "minTemp");
        model.result("plot_table_min").feature("tblp1").set("linewidth", "preference");
        model.result("plot_table_min").feature("tblp1").set("markerpos", "datapoints");
        model.result("plot_table_min").run();
        
        // Melhor Tempo
        TableBaseFeature tableMax = model.result().table("maxTemp");
        TableBaseFeature tableMin = model.result().table("minTemp");
        
        // Obtendo o número total de linhas na tabela
        int numRows = tableMax.getNRows();
        
        // Percorrendo linhas da tabela
        for (int i = 0; i < numRows; i++) {
          // Obtendo os dados da linha atual
          String[] maxRowData = tableMax.getTableRow(i, false);
          String[] minRowData = tableMin.getTableRow(i, false);
          
          // Transformando para valor real e obtendo a diferença
          double maxValue = Double.parseDouble(maxRowData[1]); // Ver se ess valor é mesmo o valor da temperatura
          double minValue = Double.parseDouble(minRowData[1]);
          
          contraste = maxValue-minValue;
          
          // definindo tempo
          if (i == 0) {
            contrasteAnterior = contraste;
          } else {
            if (contraste > contrasteAnterior) {
              tempo = i+1;
              contrasteAnterior = contraste;
            } else {
              contrasteAnterior = contraste;
              
            }
            
          }
          
        }
        
        // Fim Melhor Tempo
        
        // Plotagem
        model.result("pg3").feature("surf1").setIndex("looplevel", tempo, 0);
        model.result("pg3").run();
        
        // Export de imagem
        
        model.result().export().create(x1+"-"+y1+"-"+r1+"-"+h1, "Image");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("size", "manualweb");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("unit", "px");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("height", "224");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("width", "224");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("lockratio", "on");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("resolution", "96");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("antialias", "on");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("zoomextents", "on");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("fontsize", "9");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("colortheme", "globaltheme");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("customcolor", new double[]{1, 1, 1});
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("background", "transparent");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("gltfincludelines", "on");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("title1d", "on");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("legend1d", "on");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("logo1d", "on");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("options1d", "on");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("title2d", "on");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("legend2d", "on");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("logo2d", "on");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("options2d", "off");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("title3d", "on");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("legend3d", "on");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("logo3d", "on");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("options3d", "off");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("axisorientation", "on");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("grid", "on");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("axes1d", "on");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("axes2d", "on");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("showgrid", "on");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("target", "file");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("qualitylevel", "92");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("qualityactive", "off");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("imagetype", "png");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("lockview", "off");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("pngfilename", "C:\\Users\\USER\\Desktop\\umDefeitos\\"+x1+"-"+y1+"-"+r1+"-"+h1+"-"+tempo+".png");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).run();
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("sourceobject", "pg1");
        model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).run();
        model.result().numerical().remove("max"+x1+"-"+y1+"-"+r1+"-"+h1);
        model.result().table().remove("maxTemp");
        model.result().numerical().remove("min"+x1+"-"+y1+"-"+r1+"-"+h1);
        model.result().table().remove("minTemp");
        model.result().export().remove(x1+"-"+y1+"-"+r1+"-"+h1);
        tempo = 0;
        contraste = 0;
        contrasteAnterior = 0;
      }
    }
  }
}