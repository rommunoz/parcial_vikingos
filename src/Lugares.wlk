import Expedicion.*
import Iglesia.*

class Lugar {
	//punto3
	method serInvadidoPor(unaExpedicion){
		unaExpedicion.afanarBotin(self.botin(unaExpedicion))
		self.perderBotin(unaExpedicion)
	}
	method perderBotin(unaExpedicion)
	method botin(unaExpedicion)
	
	method valeLaPenaPara(unaExpedicion)
}

class Aldea inherits Lugar {
	const cantidadDeDefensores = 0
	var property iglesias = new List()
	
	override method perderBotin(_unaExpedicion){
		iglesias.forEach{iglesia => iglesia.serAfanada()}
	}
	
	override method valeLaPenaPara(unaExpedicion){
		return sedDeSaqueos.esSaciadaPor(self.botin(unaExpedicion))
	}
	
	override method botin(_unaExpedicion) {
		return self.iglesias().sum{iglesia => iglesia.cantidadDeCrucifijos()}
	}
	
	method agregarIglesia(unaIglesia){
		iglesias.add(unaIglesia)
	}
}

class Capital inherits Lugar{
	var cantidadDeDefensores
	const factorDeRiqueza
	
	//punto3
	override method perderBotin(unaExpedicion){
		unaExpedicion.cobrarVidasDeDefensores()
		self.perderDefensoresPor(unaExpedicion)
	}
	
	method perderDefensoresPor(unaExpedicion){
		cantidadDeDefensores -= self.defensoresDerrotadosPor(unaExpedicion)
	}
	
	override method valeLaPenaPara(unaExpedicion){
		return self.botin(unaExpedicion) / 3 >= unaExpedicion.cantidadDeVikingos()
	}
	
	override method botin(unaExpedicion) {
		return self.defensoresDerrotadosPor(unaExpedicion) * factorDeRiqueza
	}
	
	method defensoresDerrotadosPor(unaExpedicion){
		return unaExpedicion.cantidadDeVikingos().min(cantidadDeDefensores) 
	}
	
}

class Amurallada inherits Aldea {
	const cantidadMinimaDeInvasores
	
	override method valeLaPenaPara(unaExpedicion){
		return super(unaExpedicion) and unaExpedicion.llevaAlMenosNVikingos(cantidadMinimaDeInvasores)
	}
}

object sedDeSaqueos {
	method esSaciadaPor(unaCantidadDeMonedas){
		return unaCantidadDeMonedas >= 15
	}
}