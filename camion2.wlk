object camion {

    const cosas = []

    method cargar(algo) { cosas.add(algo) 
                          algo.sufrirCambio()
    }
    
    method descargar(algo) { cosas.remove(algo) }

    method pesoTotal() = cosas.sum({c => c.peso()}) + 1000

    method pesoEsImpar() = cosas.all({c => c.peso().odd()})

    method hayCosaDePeso(unPeso) = cosas.any({c=> c.peso() == unPeso})

    method cosaConPeligrosidad(nivel) {
        cosas.find({c=> c.peligrosidad() == nivel})
    }    

    method cosasConPeligrosidadSuperiorA(nivel){
      return  cosas.filter({c=> c.peligrosidad() > nivel})
    }

    method cosasMasPeligrosasQue(unaCosa){
        cosas.filter(
            {c => c.peligrosidad() > unaCosa.peligrosidad()})
    }

    method estaExcedidoDelPesoMaximo() = self.pesoTotal() > 2500 
    
    method puedeCircularEnRuta(valor) = 

        not self.estaExcedidoDelPesoMaximo() and 
        self.cosasConPeligrosidadSuperiorA(valor).isEmpty()

    method tieneAlgoDePesoEntre(min,max) = 
            cosas.any({ c => c.peso().between(min, max) })

    method cosaMasPesada() = cosas.max({ c => c.peso() })
}

