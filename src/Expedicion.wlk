class Expedicion {
	const property vikingos = new List()
	const property lugaresAInvadir = new List()
	var botinConseguido = 0
	
	//punto3
	method realizarExpedicion(){
		lugaresAInvadir.forEach{lugar => lugar.serInvadidoPor(self)}
		const racionDelBotin = botinConseguido / self.cantidadDeVikingos()
		vikingos.forEach{vikingo => vikingo.cobrarBotin(racionDelBotin)} //podria delegarlo pero lo dejo para hacer mas rapido
		botinConseguido = 0
	}
	
	method afanarBotin(unBotin){
		botinConseguido += unBotin
	}
	
	method cobrarVidasDeDefensores(){
		vikingos.forEach{vikingo => vikingo.cobrarVidaDe1Defensor()}
	}
	
	method agregarVikingo(unVikingo){
		vikingos.add(unVikingo)
	}
	
	method valeLaPena(){
		return lugaresAInvadir.all{lugar => lugar.valeLaPenaPara(self)}
	}
	
	method llevaAlMenosNVikingos(unaCantidad){
		return self.cantidadDeVikingos() >= unaCantidad
	}
	
	method cantidadDeVikingos() {
		return vikingos.size()
	}

}
