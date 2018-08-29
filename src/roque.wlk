import comidas.*

object roque {
	var property posicion = game.at(0,0)
	var energiaEncontrada = 0
	method imagen() = "roque.png"
	
	method encontrarComida(comida){
		game.say(self, "Encontre morfi")
		game.removeVisual(comida)
		energiaEncontrada += comida.energia()
	}
	method alimentar() = energiaEncontrada
}
