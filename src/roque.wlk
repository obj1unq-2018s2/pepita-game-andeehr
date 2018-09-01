import comidas.*
import pepita.*

object roque {
	var property posicion = game.at(0,0)
	var property encontrado = null
	method imagen() = "roque.png"
	
	method encontrarComida(comida){
		if (comida != pepita.soyPepita()){
			game.say(self, "Encontre morfi")
			game.removeVisual(comida)
			encontrado = comida
		}
	}
	method dejarAlimento(){
		encontrado = null
	}
	method alimentar() = encontrado.energia()
}
