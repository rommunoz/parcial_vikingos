class CastaSocial {
	
	method puedeIrA(_unVikingo) = true
}

object jarl inherits CastaSocial {
	
	override method puedeIrA(unVikingo) = unVikingo.tieneArmas()
	
	method castaSuperior() = karl

	method beneficioPara(unVikingo){
		unVikingo.bonoPorAscensoAKarl()
	}
}

object karl {
	
	method castaSuperior() = thrall
	
	method beneficioPara(unVikingo){
		unVikingo.bonoPorAscensoAThrall()
	}
	
}

object thrall {
	
	method castaSuperior(unVikingo){
	} 	//no hay
	
	
}
