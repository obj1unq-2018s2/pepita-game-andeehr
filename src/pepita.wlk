import ciudades.*
import roque.*

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

 	method come() {
 		var alimento = roque.encontrado()
 		if (alimento != null){
			energia = energia + roque.alimentar()
			game.addVisualIn(alimento, game.at(x,y))
			x = 1.randomUpTo(10) //Vuelvo a cambiar el valor de x, y para que no aparezca
			y = 1.randomUpTo(10) //el otro objeto en el mismo lugar random
		}
	}
	
	method come(comida) {
		energia = energia + comida.energia()
	}
	
	method serRecogido(){
		
	}
	method soyPepita() = self
	//Lo utilizo asi, porque de otra forma no me dejaba comparar con el objeto el if
	//Se puede hacer algo mejor?

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
	// Que es mejor?

	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		energia -= self.energiaParaVolar(posicion.distance(nuevaPosicion))
		self.posicion(nuevaPosicion)
	}	
	
}

