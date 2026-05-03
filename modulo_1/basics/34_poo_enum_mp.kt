enum class EstadoMatricula(val descripcion: String, val esTerminal: Boolean) {
    PREINSCRITO ("Esperando confirmación",      false),
    ACTIVO      ("Matriculado y cursando",      false),
    GRADUADO    ("Programa completado",         true),
    RETIRADO    ("Retirado voluntariamente",    true),
    SUSPENDIDO  ("Suspendido por reglamento",   true);

    fun puedeTransicionarA(siguiente: EstadoMatricula): Boolean = when (this) {
        PREINSCRITO -> siguiente == ACTIVO    || siguiente == RETIRADO
        ACTIVO      -> siguiente == GRADUADO  || siguiente == RETIRADO || siguiente == SUSPENDIDO
        else        -> false
    }
}

fun main() {
    val estado = EstadoMatricula.ACTIVO
    println(estado.descripcion)  // Matriculado y cursando
    println(estado.esTerminal)   // false

    // when exhaustivo — sin else porque el compilador conoce todos los casos
    val icono = when (estado) {
        EstadoMatricula.PREINSCRITO -> "📋"
        EstadoMatricula.ACTIVO      -> "📚"
        EstadoMatricula.GRADUADO    -> "🎓"
        EstadoMatricula.RETIRADO    -> "🚪"
        EstadoMatricula.SUSPENDIDO  -> "⛔"
    }
    println(icono)  // 📚

    println(estado.puedeTransicionarA(EstadoMatricula.GRADUADO))  // true
}
