object knightRider {
    method peso() = 500
    method peligrosidad() = 10 

    method bulto() = 1

    method sufrirCambio() {  }
}

object bumblebee {
    var estado = auto
    
    method peso() = 800
    method peligrosidad() = estado.peligrosidad() 
    method transformar(unEstado) { estado = unEstado }

    method bulto() = 2

    method sufrirCambio() { self.transformar(robot) }
}

object auto {
  method peligrosidad() = 15
}

object robot {
  method peligrosidad() = 30
}

object ladrillos {
    var property cantidad = 0
    
    method peso() = cantidad * 2
    method peligrosidad() = 2

    method bulto() = if ( cantidad <= 100 ) { 1 }
    else if ( cantidad.between(101, 300)  ) { 2 }
    else { 3 }

    method sufrirCambio() { cantidad = cantidad + 12 }
}

object arena {
    var property peso = 0

    method peligrosidad() = 1

    method bulto() = 1

    method sufrirCambio() { peso = (peso - 10).max(0)  }
}

object bateriaAntiaerea {
    var property estaConMisiles = true

    method peso() = if (estaConMisiles){ 300 } else { 200 }

    method peligrosidad() = if (estaConMisiles) { 100 } else { 0 }

    method bulto() = if ( estaConMisiles ) {2} else {1}

    method sufrirCambio() { self.estaConMisiles(true) }

}

object contenedorPortuario {
    const cosas = []

    method agregarCosa(unaCosa) = cosas.add(unaCosa)

    method peso() = 100 + cosas.sum({c => c.peso()})

    method peligrosidad() = 
    if ( not cosas.isEmpty() ) { self.peligrosidadDeLasCosas().max() }
    else { 0 }

    method peligrosidadDeLasCosas() { 
        return cosas.map({c => c.peligrosidad()}) }

    method bulto() = 1 + self.bultoDeCosas()

    method bultoDeCosas() = cosas.sum({b => b.bulto()})

    method sufrirCambio() { cosas.forEach({c => c.sufrirCambio()}) }
}

object residuosRadioactivos {
    var property peso = 0

    method peligrosidad() = 200 
    method bulto() = 1

    method sufrirCambio() { peso = peso + 15 }

}

object embalajeDeSeguridad {
    var property cosaEnvuelta = residuosRadioactivos

    method peso() = cosaEnvuelta.peso()
    
    method peligrosidad() = cosaEnvuelta.peligrosidad() / 2

    method bulto() = 2

    method sufrirCambio() {  }
}