object neo {
    var energia = 100

    method esELElegido() = true

    method saltar() {
        energia = energia/2
    }

    method vitalidad() = 10

}

object morfeo {
    var vitalidad = 8
    var estaCansado = false

    method satar(){
        //empieza descansado y al saltar se cansa
        estaCansado = not estaCansado
        vitalidad = (vitalidad-1).max(0)
    }

    //Pero si salta estando cansado, vuelve a quedar descansando
    method vitalidad() = vitalidad
}

object trinity {
    method vitalidad() = 0
    method esElElegido() = false
    method saltar(){} 
}

object nave {
    const pasajeros = []
    method pasajeros() = pasajeros
    method subirPasajeros(unPasajero){
        pasajeros.add(unPasajero)
    }

    method bajarPasajeros(unPasajero) {
      pasajeros.remove(unPasajero)
    }

    //neo
    method cantidadPasajeros() {
        return pasajeros.size()
    }

    //100
    method elPasajeroConMasVitalidad() {
      return pasajeros.max({unPasajero => unPasajero.vitalidad()})
  }

  method laMayorVitalidad() {
    return self.elPasajeroConMasVitalidad().vitalidad()
  }

  method estaEquilibrada(){
    return self.elPasajeroConMasVitalidad().vitalidad() <= min*2 
    }

    method estaElElegido() {
        return pasajeros.any({unPasajero => unPasajero.esELElegido()})
    }

    method chocar() {  
        pasajeros.forEach({p => p.saltar()})
        pasajeros.clear()
    }

    method acelerar() {
        pasajeros.forEach({p => not p.esElElegido()}).forEach({p => p.saltar()})
    }
}