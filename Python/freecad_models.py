import FreeCAD as App
import Part

for x in range(30, 151, 40):
	for y in range(30, 151, 40):
		for r in range(2, 9, 2):
			for h in range(5, 9):
				try:
					# Abrindo o arquivo base
					doc = App.openDocument('/home/veras/Documentos/FreeCAD_Models/FCStd/base.FCStd')

					# selecionando o objeto Box
					box = doc.getObjectsByLabel("myBox")[0]

					"""
					# Cria um novo objeto Box
					box = doc.addObject("Part::Box", f"myBox{x}-{y}-{r}-{h}")
					box.Length = 180
					box.Width = 180
					box.Height = 10
					doc.recompute()
					"""
					
					# Cria um novo objeto Cylinder para o furo
					hole = doc.addObject("Part::Cylinder", f"myHole{x}-{y}-{r}-{h}")
					hole.Radius = r
					hole.Height = h
					hole.Placement = App.Placement(App.Vector(x, y, 0), App.Rotation(0, 0, 0, 1))
					doc.recompute()
					
					# Obtém as formas dos objetos Box e Hole
					box_shape = box.Shape
					hole_shape = hole.Shape
	
					# Faz o furo na peça
					cut_feature = box_shape.cut(hole_shape)
					doc.recompute()
	
					# Exporta a forma do objeto Box para um arquivo STL
					cut_feature.exportStl(f"/home/veras/Documentos/FreeCAD_Models/STL/{x}-{y}-{r}-{h}.stl")
	
					# Salva o documento em uma pasta específica
					doc.saveAs(f"/home/veras/Documentos/FreeCAD_Models/FCStd/{x}-{y}-{r}-{h}.FCStd")

				except Exception as e:
					print(f"Erro ao processar {x}-{y}-{r}-{h}: {e}")
