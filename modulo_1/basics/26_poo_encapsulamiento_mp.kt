class RegistroAcademico(nombreEstudiante: String, notaInicial: Double) {

    val nombreEstudiante: String = nombreEstudiante   // público — cualquiera puede leer

    private var nota: Double = notaInicial            // privado — solo esta clase lo modifica

    internal val codigoRegistro: String =             // internal — visible en el mismo módulo
        "REG${(10000..99999).random()}"

    protected open fun calcularEstado(): String =     // protected — visible en subclases
        if (nota >= 6.0) "Aprobado" else "Reprobado"

    // La nota solo cambia a través de estos métodos — NUNCA directamente
    fun registrarNota(nuevaNota: Double) {
        require(nuevaNota in 0.0..10.0) { "La nota debe estar entre 0 y 10" }
        nota = nuevaNota
        println("Nota registrada: ${"%.2f".format(nuevaNota)} | Estado: ${calcularEstado()}")
    }

    fun aplicarBono(puntos: Double): Boolean {
        require(puntos > 0) { "El bono debe ser positivo" }
        if (nota + puntos > 10.0) {
            println("El bono excede la nota máxima permitida")
            return false
        }
        nota += puntos
        println("Bono aplicado: +${"%.2f".format(puntos)} | Nueva nota: ${consultarNota()}")
        return true
    }

    fun consultarNota(): String = "${"%.2f".format(nota)}"
}

fun main() {
    val registro = RegistroAcademico("Luis Martínez", 5.0)

    registro.registrarNota(7.5)      // Nota registrada: 7.50 | Estado: Aprobado
    registro.aplicarBono(1.0)        // Bono aplicado: +1.00 | Nueva nota: 8.50
    registro.aplicarBono(5.0)        // El bono excede la nota máxima permitida

    println(registro.nombreEstudiante)  // Luis Martínez — acceso público permitido
    println(registro.consultarNota())   // 8.50
    // registro.nota = 10.0             // ERROR — nota es privada
}
