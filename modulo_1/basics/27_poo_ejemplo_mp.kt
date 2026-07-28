// El constructor primario integra la declaración de propiedades
class Docente(val nombre: String, val materia: String)

// Con cuerpo adicional
class Estudiante(val nombre: String, val edad: Int) {
    fun presentarse() = "Soy $nombre y tengo $edad años"
    fun esMayorDeEdad() = edad >= 18
}

fun main() {
    val docente = Docente("Carlos Pérez", "Matemáticas")
    println(docente.nombre)    // Carlos Pérez
    println(docente.materia)   // Matemáticas

    val estudiante = Estudiante("Laura", 16)
    println(estudiante.presentarse())    // Soy Laura y tengo 16 años
    println(estudiante.esMayorDeEdad())  // false
}
