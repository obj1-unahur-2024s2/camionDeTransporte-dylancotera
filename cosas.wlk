object knightRider {
    method peso() = 500
    method peligrosidad() = 10 
}

object bumblebee {
    var estado = auto
    
    method peso() = 800
    method peligrosidad() = estado.peligrosidad() 
    method transformar(unEstado) { estado = unEstado }
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
}

object arena {
    var property peso = 0

    method peligrosidad() = 1
}

object bateriaAntiaerea {
    var property estaConMisiles = true

    method peso() = if (estaConMisiles){ 300 } else { 200 }

    method peligrosidad() = if (estaConMisiles) { 100 } else { 0 }

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
}

object residuosRadioactivos {
    var property peso = 0

    method peligrosidad() = 200 
}

object embalajeDeSeguridad {
    var property cosaEnvuelta = residuosRadioactivos

    method peso() = cosaEnvuelta.peso()
    
    method peligrosidad() = cosaEnvuelta.peligrosidad() / 2
}