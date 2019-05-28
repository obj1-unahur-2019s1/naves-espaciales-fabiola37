class NaveEspacial {
	var velocidad = 0
	var direccion =0
	
	method velocidad(cuanto){ velocidad = cuanto}
	method acelerar(cuanto){ velocidad = (velocidad + cuanto).min(100000)}
	method desacelerar(cuanto){ velocidad -= cuanto}
	
	method irHaciaElSol(){ direccion = 10}
	method escaparElSol(){ direccion = -10}
	method ponerseParaleloAlSol(){ direccion = 0}
	
	method acercarseUnPocoAlSol(){direccion = 10.min(direccion +1) }
	method alejarseUnPocoDelSol(){ direccion = -10.max(direccion -1) }
	
}
class NaveBaliza inherits NaveEspacial{
	var property colorBaliza = "verde"
	
	method cambiarColorBaliza(colorNuevo){ colorBaliza = colorNuevo }
	method color(){ return colorBaliza }
}
class NavePasajeros inherits NaveEspacial{
	var property cantidadDePasajeros = 0
	var property racionesDeComida = 0
	var property cuantasDeBebida = 0
	
	method cargarComida(raciones){ racionesDeComida += raciones}
	method descargarComida(raciones){ racionesDeComida -= raciones}
	method cargarBebida(cuantas){ cuantasDeBebida += cuantas}
	method descargarBeBida(cuantas){cuantasDeBebida -= cuantas}
}
class NaveDeComvate inherits NaveEspacial {
	var property visible = false
	var property desplegados = true
	
	method ponerseVisible(){ visible = true}
	method ponerseInvisible(){ visible = false}
	method estaInvisible(){ return visible }
	
	method desplegarMisiles(){ desplegados = true }
	method replegarMisiles(){desplegados = false }
	method misilesDesplegados(){ return desplegados }
	
	method emitirMensaje(mensaje){}
}
