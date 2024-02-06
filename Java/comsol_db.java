int tempo = 0;
double contraste = 0;
double contrasteAnterior = 0;
String label1;
String label2;
String label3;

FileWriter writer = new FileWriter("contraste.txt", true);



for (int numDefeitos = 1; numDefeitos <= 4; numDefeitos += 1) {
  if (numDefeitos == 1) {

    // Garantir que a imagem esteja centralizada
    for (int x1 = 30; x1 <= 150; x1 += 40) {
      for (int y1 = 30; y1 <= 150; y1 += 40) {
        for (int r1 = 2; r1 <= 8; r1 += 2) {
          for (int h1 = 4; h1 <= 8; h1++) {
            
            double med1 = (r1 + h1) / 2;
            // Geometria
            model.param().set("x1", x1+"[mm]");
            model.param().set("y1", y1+"[mm]");
            model.param().set("r1", r1+"[mm]");
            model.param().set("h1", h1+"[mm]");
            
            model.component("comp1").geom("geom1").run("fin");
            // Fim Geometria
            
            // Computando
            model.sol("sol1").study("std1");
            model.study("std1").feature("time").set("notlistsolnum", 1);
            model.study("std1").feature("time").set("notsolnum", "auto");
            model.study("std1").feature("time").set("listsolnum", 1);
            model.study("std1").feature("time").set("solnum", "auto");
            model.sol("sol1").feature().remove("t1");
            model.sol("sol1").feature().remove("v1");
            model.sol("sol1").feature().remove("st1");
            model.sol("sol1").create("st1", "StudyStep");
            model.sol("sol1").feature("st1").set("study", "std1");
            model.sol("sol1").feature("st1").set("studystep", "time");
            model.sol("sol1").create("v1", "Variables");
            model.sol("sol1").feature("v1").set("control", "time");
            model.sol("sol1").create("t1", "Time");
            model.sol("sol1").feature("t1").set("tlist", "range(0,1,30)");
            model.sol("sol1").feature("t1").set("plot", "off");
            model.sol("sol1").feature("t1").set("plotgroup", "pg1");
            model.sol("sol1").feature("t1").set("plotfreq", "tout");
            model.sol("sol1").feature("t1").set("probesel", "all");
            model.sol("sol1").feature("t1").set("probes", new String[]{});
            model.sol("sol1").feature("t1").set("probefreq", "tsteps");
            model.sol("sol1").feature("t1").set("atolglobalvaluemethod", "factor");
            model.sol("sol1").feature("t1").set("atolmethod", new String[]{"comp1_T", "global"});
            model.sol("sol1").feature("t1").set("atol", new String[]{"comp1_T", "1e-3"});
            model.sol("sol1").feature("t1").set("atolvaluemethod", new String[]{"comp1_T", "factor"});
            model.sol("sol1").feature("t1").set("atolvaluemethod", new String[]{"comp1_T", "factor"});
            model.sol("sol1").feature("t1").set("reacf", true);
            model.sol("sol1").feature("t1").set("storeudot", true);
            model.sol("sol1").feature("t1").set("endtimeinterpolation", true);
            model.sol("sol1").feature("t1").set("estrat", "exclude");
            model.sol("sol1").feature("t1").set("maxorder", 2);
            model.sol("sol1").feature("t1").set("control", "time");
            model.sol("sol1").feature("t1").create("fc1", "FullyCoupled");
            model.sol("sol1").feature("t1").feature("fc1").set("jtech", "once");
            model.sol("sol1").feature("t1").feature("fc1").set("damp", 0.9);
            model.sol("sol1").feature("t1").feature("fc1").set("stabacc", "aacc");
            model.sol("sol1").feature("t1").feature("fc1").set("aaccdim", 5);
            model.sol("sol1").feature("t1").feature("fc1").set("aaccmix", 0.9);
            model.sol("sol1").feature("t1").feature("fc1").set("aaccdelay", 1);
            model.sol("sol1").feature("t1").create("d1", "Direct");
            model.sol("sol1").feature("t1").feature("d1").set("linsolver", "pardiso");
            model.sol("sol1").feature("t1").feature("d1").set("pivotperturb", 1.0E-13);
            model.sol("sol1").feature("t1").feature("d1").label("Direct, heat transfer variables (ht)");
            model.sol("sol1").feature("t1").create("i1", "Iterative");
            model.sol("sol1").feature("t1").feature("i1").set("linsolver", "gmres");
            model.sol("sol1").feature("t1").feature("i1").set("prefuntype", "left");
            model.sol("sol1").feature("t1").feature("i1").set("itrestart", 50);
            model.sol("sol1").feature("t1").feature("i1").set("rhob", 20);
            model.sol("sol1").feature("t1").feature("i1").set("maxlinit", 10000);
            model.sol("sol1").feature("t1").feature("i1").set("nlinnormuse", "on");
            model.sol("sol1").feature("t1").feature("i1").label("AMG, heat transfer variables (ht)");
            model.sol("sol1").feature("t1").feature("i1").create("mg1", "Multigrid");
            model.sol("sol1").feature("t1").feature("i1").feature("mg1").set("prefun", "saamg");
            model.sol("sol1").feature("t1").feature("i1").feature("mg1").set("mgcycle", "v");
            model.sol("sol1").feature("t1").feature("i1").feature("mg1").set("maxcoarsedof", 50000);
            model.sol("sol1").feature("t1").feature("i1").feature("mg1").set("strconn", 0.01);
            model.sol("sol1").feature("t1").feature("i1").feature("mg1").set("nullspace", "constant");
            model.sol("sol1").feature("t1").feature("i1").feature("mg1").set("usesmooth", false);
            model.sol("sol1").feature("t1").feature("i1").feature("mg1").set("saamgcompwise", true);
            model.sol("sol1").feature("t1").feature("i1").feature("mg1").set("loweramg", true);
            model.sol("sol1").feature("t1").feature("i1").feature("mg1").feature("pr").create("so1", "SOR");
            model.sol("sol1").feature("t1").feature("i1").feature("mg1").feature("pr").feature("so1").set("iter", 2);
            model.sol("sol1").feature("t1").feature("i1").feature("mg1").feature("pr").feature("so1").set("relax", 0.9);
            model.sol("sol1").feature("t1").feature("i1").feature("mg1").feature("po").create("so1", "SOR");
            model.sol("sol1").feature("t1").feature("i1").feature("mg1").feature("po").feature("so1").set("iter", 2);
            model.sol("sol1").feature("t1").feature("i1").feature("mg1").feature("po").feature("so1").set("relax", 0.9);
            model.sol("sol1").feature("t1").feature("i1").feature("mg1").feature("cs").create("d1", "Direct");
            model.sol("sol1").feature("t1").feature("i1").feature("mg1").feature("cs").feature("d1")
              .set("linsolver", "pardiso");
            model.sol("sol1").feature("t1").feature("i1").feature("mg1").feature("cs").feature("d1")
              .set("pivotperturb", 1.0E-13);
            model.sol("sol1").feature("t1").feature("fc1").set("linsolver", "d1");
            model.sol("sol1").feature("t1").feature("fc1").set("jtech", "once");
            model.sol("sol1").feature("t1").feature("fc1").set("damp", 0.9);
            model.sol("sol1").feature("t1").feature("fc1").set("stabacc", "aacc");
            model.sol("sol1").feature("t1").feature("fc1").set("aaccdim", 5);
            model.sol("sol1").feature("t1").feature("fc1").set("aaccmix", 0.9);
            model.sol("sol1").feature("t1").feature("fc1").set("aaccdelay", 1);
            model.sol("sol1").feature("t1").feature().remove("fcDef");
            model.sol("sol1").attach("std1");
            model.sol("sol1").runAll();
            model.result("pg1").run();
            // Fim Computando
            
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
            // int numRows = tableMax.getNRows();
            
            // Percorrendo linhas da tabela --> Transformar em função?
            for (int i = 0; i < 30; i++) {
              // Obtendo os dados da linha atual
              String[] maxRowData = tableMax.getTableRow(i, false);
              String[] minRowData = tableMin.getTableRow(i, false);
              
              // Transformando para valor real e obtendo a diferença
              double maxValue = Double.parseDouble(maxRowData[1]); 
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
            model.result("pg1").setIndex("looplevel", tempo, 0);
            model.result("pg1").run();
            
            
            // Export de imagem
            
            model.result().export().create(x1+"-"+y1+"-"+r1+"-"+h1, "Image");
            model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("size", "manualweb");
            model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("unit", "px");
            model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("height", "300");
            model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("width", "300");
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

            if (med1 <= 4) {
              label1 = "Leve";
            } else if (med1 > 4 && med1 < 6) {
              label1 = "Moderado";
            } else if (med1 >= 6) {
              label1 = "Severo";
            } else {
              label1 = "Error";
            }

            model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("pngfilename", "C:\\Users\\USER\\Desktop\\umDefeitos30\\"+label1+"\\"+x1+"-"+y1+"-"+r1+"-"+h1+"-"+tempo+"-"+label1+".png");

            model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).run();
            model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("sourceobject", "pg1");
            model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).run();
            model.result().numerical().remove("max"+x1+"-"+y1+"-"+r1+"-"+h1);
            model.result().table().remove("maxTemp");
            model.result().numerical().remove("min"+x1+"-"+y1+"-"+r1+"-"+h1);
            model.result().table().remove("minTemp");
            model.result().export().remove(x1+"-"+y1+"-"+r1+"-"+h1);

            writer.write(x1+"-"+y1+"-"+r1+"-"+h1+"-"+tempo+"-"+label1": "+contraste+" K"+"\n");
            writer.close();
            tempo = 0;
            contraste = 0;
            contrasteAnterior = 0;
          }
        }
      }
    }

  } else if (numDefeitos == 2) {

    int i = 0;

    for (int x1 = 30; x1 <= 150; x1 += 40) {
       for (int y1 = 30; y1 <= 150; y1 += 40) {
           for (int x2 = 30; x2 <= 150; x2 += 40) {
               for (int y2 = 30; y2 <= 150; y2 += 40) {
                   for (int r1 = 2; r1 <= 7; r1 += 2) {
                      for (int h1 = 5; h1 <= 7; h1++) {
                          for (int r2 = 2; r2 <= 7; r2 += 2) {
                              for (int h2 = 5; h2 <= 7; h2++) {
                                  if (x1 != x2 || y1 != y2) {
                                     i++;
                                  }
                              }
                          }
                      }
                   }
               }
           }
       }
    }

    i = i / 250;

    for (int x1 = 30; x1 <= 150; x1 += 40) {
      for (int y1 = 30; y1 <= 150; y1 += 40) {
          for (int x2 = 30; x2 <= 150; x2 += 40) {
              for (int y2 = 30; y2 <= 150; y2 += 40) {
                  for (int r1 = 2; r1 <= 7; r1 += 2) {
                     for (int h1 = 5; h1 <= 7; h1++) {
                         for (int r2 = 2; r2 <= 7; r2 += 2) {
                             for (int h2 = 5; h2 <= 7; h2++) {
                                 if (x1 != x2 || y1 != y2) {
                                    int int_random = (int)(Math.random() * (i) + 1);
                                    if (int_random == 1) {

                                      double med1 = (r1 + h1) / 2;
                                      double med2 = (r2 + h2) / 2;

                                      if (med1 <= 4) {
                                        label1 = "Leve";
                                      } else if (med1 > 4 && med1 < 6) {
                                        label1 = "Moderado";
                                      } else if (med1 >= 6) {
                                        label1 = "Severo";
                                      } else {
                                        label1 = "Error";
                                      }    

                                      if (med2 <= 4) {
                                        label2 = "Leve";
                                      } else if (med2 > 4 && med2 < 6) {
                                        label2 = "Moderado";
                                      } else if (med2 >= 6) {
                                        label2 = "Severo";
                                      } else {
                                        label2 = "Error";
                                      }

                                  /* Pastas serão: label1+"-"+label2, portanto ignorar o que esta embaixo
                                        6 Pastas:
                                          Leve-Leve; 
                                          Leve-Moderado; 
                                          Leve-Severo; 
                                          Moderado-Moderado; 
                                          Moderado-Severo; 
                                          Severo-Severo
                                  */

                                      model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("pngfilename", "C:\\Users\\USER\\Desktop\\doisDefeitos30\\"+label1+"-"+label2+"\\"+x1+"-"+y1+"-"+r1+"-"+h1+"-"+tempo+"-"+label1+"-"+label2+".png");

                                      writer.write(x1+"-"+y1+"-"+r1+"-"+h1+"-"+tempo+"-"+label1+"-"+label2+": "+contraste+" K"+"\n");
                                      writer.close();
                                      tempo = 0;
                                      contraste = 0;
                                      contrasteAnterior = 0;
                                    }
                                 }
                             }
                         }
                     }
                  }
              }
          }
      }
   }

  } else if (numDefeitos == 3) {

    int i = 0;

    i = i / 250;


    double med1 = (r1 + h1) / 2;
    double med2 = (r2 + h2) / 2;
    double med3 = (r3 + h3) / 2;

    if (med1 <= 4) {
      label1 = "Leve";
    } else if (med1 > 4 && med1 < 6) {
      label1 = "Moderado";
    } else if (med1 >= 6) {
      label1 = "Severo";
    } else {
      label1 = "Error";
    }    

    if (med2 <= 4) {
      label2 = "Leve";
    } else if (med2 > 4 && med2 < 6) {
      label2 = "Moderado";
    } else if (med2 >= 6) {
      label2 = "Severo";
    } else {
      label2 = "Error";
    }

    if (med3 <= 4) {
      label3 = "Leve";
    } else if (med3 > 4 && med3 < 6) {
      label2 = "Moderado";
    } else if (med3 >= 6) {
      label3 = "Severo";
    } else {
      label3 = "Error";
    }

/* Pastas vão ter o nome: label1+"-"+label2+"-"label3, portanto ignorar o que esta embaixo
    10 Pastas:
        Leve-Leve-Leve; 
        Leve-Leve-Moderado; 
        Leve-Leve-Severo; 
        Leve-Moderado-Moderado; 
        Leve-Moderado-Severo;
        Leve-Severo-Severo;
        Moderado-Moderado-Moderado; 
        Moderado-Moderado-Severo; 
        Moderado-Severo-Severo; 
        Severo-Severo-Severo; 
*/

    model.result().export(x1+"-"+y1+"-"+r1+"-"+h1).set("pngfilename", "C:\\Users\\USER\\Desktop\\tresDefeitos30\\"+label1+"-"+label2+"-"+label3+"\\"+x1+"-"+y1+"-"+r1+"-"+h1+"-"+tempo+"-"+label1+"-"+label2+"-"+label3+".png");


    writer.write(x1+"-"+y1+"-"+r1+"-"+h1+"-"+tempo+label1+"-"+label2+"-"+label3": "+contraste+" K"+"\n");
    writer.close();
    tempo = 0;
    contraste = 0;
    contrasteAnterior = 0;
  }
}