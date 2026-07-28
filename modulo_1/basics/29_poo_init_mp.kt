class Estudiante(val nombre: String, val codigoEstudiantil: String) {
    val nombreNormalizado: String
    val institucion: String

    init {
        // Encapsulamiento en acción: validamos antes de construir
        require(nombre.isNotBlank()) { "El nombre no puede estar vacío" }
        require(codigoEstudiantil.length >= 4) { "Código estudiantil inválido: $codigoEstudiantil" }

        nombreNormalizado = nombre.trim().lowercase()
        institucion       = codigoEstudiantil.substringBefore("-").uppercase()
    }
}

fun main() {
    val e = Estudiante("  Laura Gómez  ", "IEST-20241")
    println(e.nombreNormalizado)  // laura gómez
    println(e.institucion)        // IEST

    // Estudiante("", "X")        // IllegalArgumentException — require falla
}
