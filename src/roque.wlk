import comidas.*
import pepita.*

object roque {
	var property posicion = game.at(0,0)
	var property encontrado = null
	var x = 1.randomUpTo(10)
	var y = 1.randomUpTo(10)

	method imagen() = "roque.png"
	
	method encontrarComida(comida) {
		if (encontrado != null) {
			game.addVisualIn(encontrado, game.at(x, y))
			x = 1.randomUpTo(10)
			y = 1.randomUpTo(10)
		}
		encontrado = comida 
	}
	method dejarAlimento(){
		encontrado = null
	}
}
