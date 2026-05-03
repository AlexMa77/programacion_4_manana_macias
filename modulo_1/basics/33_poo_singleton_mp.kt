object ConfiguracionSistema {
    val institucion: String = "Instituto Técnico Superior"
    val cicloActual: String = "2024-1"
    private val claveAdmin: String = "admin-secreto-123"   // privado — nunca expuesto

    fun encabezado() = "$institucion — Ciclo: $cicloActual"
    fun esAdmin(clave: String) = clave == claveAdmin
}

class Docente private constructor(val id: Int, val nombre: String) {
    companion object {
        private var contadorId = 0

        // Factory function — encapsulamiento del constructor
        fun crear(nombre: String, email: String): Docente? {
            if (nombre.isBlank() || !email.contains("@")) return null
            return Docente(++contadorId, nombre.trim())
        }

        const val ROL_DEFECTO = "docente"
    }
}

fun main() {
    println(ConfiguracionSistema.encabezado())  // Instituto Técnico Superior — Ciclo: 2024-1
    // ConfiguracionSistema.claveAdmin           // ERROR — privado

    val docente = Docente.crear("Carlos Pérez", "carlos@escuela.edu")
    println(docente?.nombre)  // Carlos Pérez
}
