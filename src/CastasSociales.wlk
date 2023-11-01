object jarl {
	method puedeIrAExpedicion(unVikingo){
		if(unVikingo.tieneArmas()) 
			throw new Exception(message = "El vikingo es un esclavo y tiene armas")
	}
	
	method castaSuperior() = karl
	
	method beneficioPara(_unVikingo){
		//ninguno
	}
}
object karl {
	method puedeIrA(_unVikingo){
		return true
	}
	
	method castaSuperior() = thrall
	
	method beneficioPara(unVikingo){
		unVikingo.bonoPorAscensoAKarl()
	}
	
}
object thrall {
	
	method puedeIrA(_unVikingo){
		return true
	}
	
	method castaSuperior(unVikingo){
	} 	//no hay
	
	method beneficioPara(_unVikingo){
	}	//ninguno
	
}
