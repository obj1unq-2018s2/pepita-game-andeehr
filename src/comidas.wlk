object manzana {
	const property imagen = "manzana.png"
	method energia() = 80
	method serRecogido(){
		game.removeVisual(self)
	}
	method come(){}
	method dejarAlimento(){}	
}

object alpiste {
	const property imagen = "alpiste.png"
	method energia() = 5
	method serRecogido(){
		game.removeVisual(self)
	}
	method come(){}
	method dejarAlimento(){}
}
