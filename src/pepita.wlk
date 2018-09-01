import ciudades.*
import roque.*

object pepita {
	var property energia = 100
	var property ciudad = buenosAires 

	var property posicion = game.at(3,3)
	method imagen() = "pepita.png"

 	method come() {
 		var alimento = roque.encontrado()
 		if (alimento != null){
			energia = energia + roque.alimentar()
			game.addVisualIn(alimento, game.at(9,9)) // Aca ver como lo llevo a random
		}
	}
	
	method come(comida) {
		energia = energia + comida.energia()
	}
	
	method serRecogido(){
		
	}
	method soyPepita() = self

	method volaHacia(unaCiudad) {
		if (ciudad != unaCiudad && energia > self.energiaQueNecesitoParaVolarA(unaCiudad)) {
			self.move(unaCiudad.posicion())
			ciudad = unaCiudad
		}
		else if(ciudad == unaCiudad){
			game.say(self, "Ya estoy en esa ciudad!") 
		}
		else {
			game.say(self, "Dame de comer primero!")
		}
	}
	
	method energiaQueNecesitoParaVolarA(unaCiudad) = self.energiaParaVolar(posicion.distance(unaCiudad.posicion()))

	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		energia -= self.energiaParaVolar(posicion.distance(nuevaPosicion))
		self.posicion(nuevaPosicion)
	}	
	
}

