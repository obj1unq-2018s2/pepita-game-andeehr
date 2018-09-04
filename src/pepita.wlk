import ciudades.*
import roque.*
import comidas.*

object pepita {
	var property energia = 100
	var property ciudad = buenosAires 
	var property posicion = game.at(3,3)
	var x = 1.randomUpTo(10)
	var y = 1.randomUpTo(10)
	method imagen() {
		if (energia < 10){
			return "pepita.png"
		}
		else if(energia > 100){
			return "pepita2.png"
		}
		else{
			return "pepita1.png"
		}
	}
	method teEncontro(alguien) {
		if (alguien.encontrado() != null) {
			self.come(alguien.encontrado())
			alguien.dejarAlimento()
		}
	}
		
	method come(comida) {
		energia = energia + comida.energia()
		game.addVisualIn(comida, game.at(x, y))
		x = 1.randomUpTo(10) // Vuelvo a cambiar el valor de x, y para que no aparezca
		y = 1.randomUpTo(10) // el otro objeto en el mismo lugar random
	}
	
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
	// Podia pasar todo este metodo como argumento, pero lo preferi asi por cuestiones de legibilidad

	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		energia -= self.energiaParaVolar(posicion.distance(nuevaPosicion))
		self.posicion(nuevaPosicion)
	}	
	
}

