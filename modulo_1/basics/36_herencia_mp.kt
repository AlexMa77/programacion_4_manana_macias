// Sin open — no se puede heredar (protección por defecto)
class PersonaBase(val nombre: String)
// class Docente : PersonaBase("Ana")  // ERROR — PersonaBase es final

// Con open — la jerarquía está diseñada para ello
open class Persona(val nombre: String, val edad: Int) {
    // open — la subclase PUEDE sobreescribir
    open fun presentarse() = println("Soy $nombre, tengo $edad años")
    open fun descripcion() = "Persona: $nombre"

    // Sin open — la subclase NO puede sobreescribir
    fun saludar() = println("¡Hola! Me llamo $nombre")
}

// HERENCIA: Docente reutiliza todo de Persona y especializa presentarse
class Docente(nombre: String, edad: Int, val materia: String) : Persona(nombre, edad) {
    override fun presentarse() {
        super.presentarse()                          // reutiliza la implementación del padre
        println("Soy docente de $materia")           // añade comportamiento propio
    }
    override fun descripcion() = "${super.descripcion()}, docente de $materia"
}

class Estudiante(nombre: String, edad: Int, val grado: String) : Persona(nombre, edad) {
    override fun descripcion() =
        "${super.descripcion()}, estudiante de $grado"
}

fun main() {
    val docente = Docente("Carlos Pérez", 38, "Matemáticas")
    docente.presentarse()
    // Soy Carlos Pérez, tengo 38 años
    // Soy docente de Matemáticas

    val estudiante = Estudiante("Laura Gómez", 16, "10°A")
    println(estudiante.descripcion())  // Persona: Laura Gómez, estudiante de 10°A

    // Herencia — Docente y Estudiante tienen todo lo de Persona más lo propio
    docente.saludar()  // ¡Hola! Me llamo Carlos Pérez — heredado de Persona
}
