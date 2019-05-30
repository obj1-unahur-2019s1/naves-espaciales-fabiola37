class NaveEspacial {
	var velocidad = 0
	var direccion = 0
	var property conbustible = 0 
	
	
	method velocidad(cuanto){ velocidad = cuanto}
	method acelerar(cuanto){ velocidad = (velocidad + cuanto).min(100000)}
	method desacelerar(cuanto){ velocidad -= cuanto}
	
	method irHaciaElSol(){ direccion = 10}
	method escaparElSol(){ direccion = -10}
	method ponerseParaleloAlSol(){ direccion = 0}
	
	method acercarseUnPocoAlSol(){direccion = 10.min(direccion +1) }
	method alejarseUnPocoDelSol(){ direccion = -10.max(direccion -1) }
	
	method prepararViaje(){self.agregarConbustible(30000) self.acelerar(5000)}
	
	method agregarConbustible(cuanto){ conbustible += cuanto}
	method descargarConbustible(cuanto){ conbustible -= cuanto}
	method escapar(){}
	method avisar(){}
	method recibirAmenaza(){ self.avisar() self.escapar()}
	
	method estaTranquila(){return conbustible <= 4000 and velocidad <= 12000 }
}
class NaveBaliza inherits NaveEspacial{
	var property colorBaliza = "verde"
	
	method cambiarColorBaliza(colorNuevo){ colorBaliza = colorNuevo }
	override method prepararViaje() { super() self.cambiarColorBaliza("verde")
					self.ponerseParaleloAlSol()}
	override method escapar(){ self.irHaciaElSol() }
	override method avisar(){ self.cambiarColorBaliza("rojo")}
	override method estaTranquila(){ return super()and self.colorBaliza() != "rojo"}
	
}
class NavePasajeros inherits NaveEspacial{
	var property cantidadDePasajeros = 0
	var property racionesDeComida = 0
	var property cuantasDeBebida = 0
	
	
	method cargarComida(raciones){ racionesDeComida += raciones}
	method descargarComida(raciones){ racionesDeComida -= raciones}
	method cargarBebida(cuantas){ cuantasDeBebida += cuantas}
	method descargarBebida(cuantas){cuantasDeBebida -= cuantas}
	override method prepararViaje(){ super() self.cargarComida(4)  self.cargarBebida(6)
							self.acercarseUnPocoAlSol()}
	override method escapar(){self.velocidad(velocidad * 2)}
	override method avisar(){self.descargarComida(cantidadDePasajeros) self.descargarBebida(cantidadDePasajeros * 2)}
							
}
class NaveDeCombate inherits NaveEspacial {
	var property estaInvisible = true
	var property desplegados = true
	var property menEmitidos = []
	
	
	method ponerseVisible(){ estaInvisible = false}
	method ponerseInvisible(){estaInvisible = true }
	
	method desplegarMisiles(){ desplegados = true }
	method replegarMisiles(){desplegados = false }
	method misilesDesplegados(){ return desplegados }
	
	method emitirMensaje(mensaje){menEmitidos.add(mensaje)}
	method mensajesEmitidos(){ return menEmitidos }
	method primerMensajeEmitido(){ return menEmitidos.first()}
	method ultimoMensajeEmitido(){ return menEmitidos.last()}
	method esEscueta(){return not menEmitidos.any({ mensaje => mensaje.size() >= 30})}
	method emitioMensaje(mensaje){ return menEmitidos.cointains(mensaje) }
	
	override method prepararViaje(){ super() self.replegarMisiles() self.acelerar(1500) 
											self.emitirMensaje("Saliendo en mision")}
	
	override method escapar(){self.acercarseUnPocoAlSol() self.acercarseUnPocoAlSol()}
	override method avisar(){ self.emitirMensaje("AmenazaRecibida")}
	override method estaTranquila(){ return  super() and not self.misilesDesplegados()}
}
class NaveHospital inherits NavePasajeros{
	var  quirofanosPreparados = true
	
	method prepararQuirofano(){ quirofanosPreparados = true}
	override method recibirAmenaza(){ super() self.prepararQuirofano() }
	override method estaTranquila(){ return  super() and not quirofanosPreparados}
	
	
}
class NaveDeCombateSigilosa inherits NaveDeCombate {
	
	override method escapar(){ super() self.desplegarMisiles() self.ponerseInvisible()}
	override method estaTranquila(){ return  super() and not estaInvisible }
}
