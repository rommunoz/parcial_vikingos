import CastasSociales.*

class Vikingo {
	var riqueza = 0
	var property castaSocial = jarl //jaja, arrancaba re en la miseria
	var cantidadDeArmas = 0
	var vidasCobradas = 0 //se decidio que vaya acá porque los granjeros tmb matan en las expd
	
	
	//punto5
	method escalarSocialmente(){
		self.ascenderA(castaSocial.castaSuperior())
	}
	
	method ascenderA(nuevaCasta){
		castaSocial = nuevaCasta
		castaSocial.beneficioPara(self)
	}
	
	method bonoPorAscensoAKarl()
	
	//punto3
	method cobrarBotin(unaCantidad){
		riqueza += unaCantidad
	}
	
	method intentarSubirAExpedicion(unaExpedicion) {
		self.validarIrAExpedicion()
		self.subirA(unaExpedicion)
	}
	
	method subirA(unaExpedicion){
		unaExpedicion.agregarVikingo(self)
	}
	
	method validarIrAExpedicion(){
		castaSocial.puedeIrAExpedicion(self)
		self.esProductivo()
	}
	
	method esProductivo()
	
	method adquirirCantDeArmas(unaCantidad) {
		cantidadDeArmas += unaCantidad
	}
	
	method tieneArmas(){
		return cantidadDeArmas >= 1
	}
	
	method cobrarVidaDe1Defensor(){ //tmb por enunciado los traje aca **
		vidasCobradas++
	}
	
	method asesinoAMasDe(unaCantidad){// ** antes era solo de los soldados
		return vidasCobradas > unaCantidad
	}
}

class Soldado inherits Vikingo {
	
	override method esProductivo(){
		if (not self.tieneArmas()) throw new Exception(message = "El soldado no tiene armas")
		if (not self.asesinoAMasDe(20)) throw new Exception(message = "El soldado no asesino a mas de 20 defensores")
		return true
	}
	//punto 5
	override method bonoPorAscensoAKarl(){
		self.adquirirCantDeArmas(10)
	}
}

class Granjero inherits Vikingo {
	var hijos = 0
	var hectareasPropias = 0
	
	override method esProductivo(){
		if (! self.hectareasPropias()/2 >= self.hijos()) throw new Exception(message = "El granjero no puede alimentar a sus hijos, no es productivo")
		return true
	}
	
	//punto 5
	override method bonoPorAscensoAKarl(){
		self.aumentarHijosEn(2)
		self.aumentarHectareasEn(2)
	}
	
	method aumentarHijosEn(unaCantidad) {
		hijos += unaCantidad
	}
	method aumentarHectareasEn(unaCantidad){
		hectareasPropias += unaCantidad
	}
	
	method hectareasPropias() = hectareasPropias
	
	method hijos() = hijos
}
