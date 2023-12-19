import FreeCAD as App
import Part
import random

i = 0

for x1 in range(30, 151, 40):
	for y1 in range(30, 151, 40):
		for x2 in range(30, 151, 40):
			for y2 in range(30, 151, 40):
				for r1 in range(2, 8, 2):
					for h1 in range(5, 8):
						for r2 in range(2, 8, 2):
							for h2 in range(5, 8):
								if x1 != x2 and y1 != y2:
									i+=1

i = int(i / 250)

for x1 in range(30, 151, 40):
	for y1 in range(30, 151, 40):
		for x2 in range(30, 151, 40):
			for y2 in range(30, 151, 40):
				for r1 in range(2, 8, 2):
					for h1 in range(5, 8):
						for r2 in range(2, 8, 2):
							for h2 in range(5, 8):
								if x1 != x2 and y1 != y2:
									if 1 == random.randint(1, i+1):
										try:
											# Abrindo o arquivo base
											doc = App.openDocument('/home/veras/Documentos/FreeCAD_Models/FCStd/v1/base.FCStd')
						
											# selecionando o objeto Box
											box = doc.getObjectsByLabel("myBox")[0]
						
											"""
											# Cria um novo objeto Box
											box = doc.addObject("Part::Box", f"myBox{x1}-{y1}-{x2}-{y2}-{r}-{h}")
											box.Length = 180
											box.Width = 180
											box.Height = 10
											doc.recompute()
											"""
											
											# Cria um novo objeto Cylinder para o furo
											hole1 = doc.addObject("Part::Cylinder", f"myHole{x1}-{y1}-{r1}-{h1}")
											hole1.Radius = r1
											hole1.Height = h1
											hole1.Placement = App.Placement(App.Vector(x1, y1, 0), App.Rotation(0, 0, 0, 1))
			
											hole2 = doc.addObject("Part::Cylinder", f"myHole{x2}-{y2}-{r2}-{h2}")
											hole2.Radius = r2
											hole2.Height = h2
											hole2.Placement = App.Placement(App.Vector(x2, y2, 0), App.Rotation(0, 0, 0, 1))
											doc.recompute()
											
											# Obtém as formas dos objetos Box e Hole
											box_shape = box.Shape
											hole_shape1 = hole1.Shape
											hole_shape2 = hole2.Shape
							
											# Faz o 1° furo na peça
											cut_feature = box_shape.cut(hole_shape1)
			
											# Faz o 2° furo na peça
											cut_feature = box_shape.cut(hole_shape2) # testar
											doc.recompute()
							
											# Exporta a forma do objeto Box para um arquivo STL
											cut_feature.exportStl(f"/home/veras/Documentos/FreeCAD_Models/STL/v2/{x1}-{y1}-{x2}-{y2}-{r1}-{h1}-{r2}-{h2}.stl")
							
											# Salva o documento em uma pasta específica
											doc.saveAs(f"/home/veras/Documentos/FreeCAD_Models/FCStd/v2/{x1}-{y1}-{x2}-{y2}-{r1}-{h1}-{r2}-{h2}.FCStd")
											
											# Fechando documento
											App.closeDocument(App.activeDocument().Name)
						
										except Exception as e:
											print(f"Erro ao processar {x1}-{y1}-{x2}-{y2}-{r1}-{h1}-{r2}-{h2}: {e}")
