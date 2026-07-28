// ABSTRACCIÓN: sealed class define los tipos posibles de evento escolar
sealed class EventoEscolar(val titulo: String, val descripcion: String) {
    abstract fun formatear(): String  // cada tipo formatea de forma distinta

    data class NuevaInscripcion(
        val estudiante: String,
        val curso:      String,
        val ciclo:      String
    ) : EventoEscolar("Nueva Inscripción", "Inscripción de $estudiante en $curso") {
        override fun formatear() =
            "📋 Inscripción → $estudiante\n   Curso: $curso | Ciclo: $ciclo"
    }

    data class NotaRegistrada(val estudiante: String, val curso: String, val nota: Double)
        : EventoEscolar("Nota Registrada", "Nota de $estudiante en $curso") {
        override fun formatear() =
            "📝 Nota → $estudiante en $curso: ${"%.1f".format(nota)} ${if (nota >= 6.0) "✅" else "❌"}"
    }

    data class Suspension(val estudiante: String, val motivo: String)
        : EventoEscolar("Suspensión", motivo) {
        override fun formatear() = "⛔ Suspensión → $estudiante: $motivo"
    }

    object CierreCiclo : EventoEscolar("Cierre de Ciclo", "") {
        override fun formatear() = "🔒 Ciclo académico cerrado"
    }
}

// ABSTRACCIÓN + POLIMORFISMO: interfaz con contrato genérico
interface ManejadorEvento {
    val nombre: String
    fun manejar(evento: EventoEscolar): Boolean
}

// HERENCIA: implementaciones concretas del mismo contrato
class ManejadorInscripciones : ManejadorEvento {
    override val nombre = "Inscripciones"
    override fun manejar(e: EventoEscolar): Boolean {
        if (e !is EventoEscolar.NuevaInscripcion) return false
        println("  [INSCRIPCION] Procesando → ${e.estudiante} en ${e.curso}")
        return true
    }
}

class ManejadorNotas : ManejadorEvento {
    override val nombre = "Notas"
    override fun manejar(e: EventoEscolar): Boolean {
        if (e !is EventoEscolar.NotaRegistrada) return false
        println("  [NOTA] Guardando → ${e.estudiante}: ${"%.1f".format(e.nota)}")
        return true
    }
}

// ENCAPSULAMIENTO: la lista de manejadores es privada
class SistemaEscolar(private val manejadores: List<ManejadorEvento>) {

    fun procesar(evento: EventoEscolar) {
        println(evento.formatear())  // POLIMORFISMO: cada tipo formatea distinto
        val exito = manejadores.any { it.manejar(evento) }
        if (!exito) println("  ⚠️ Sin manejador disponible")
        println()
    }
}

fun main() {
    val sistema = SistemaEscolar(listOf(ManejadorInscripciones(), ManejadorNotas()))

    listOf(
        EventoEscolar.NuevaInscripcion("Ana García", "Programación", "2024-1"),
        EventoEscolar.NotaRegistrada("Ana García", "Matemáticas", 8.5),
        EventoEscolar.Suspension("Carlos Díaz", "Inasistencias reiteradas"),
        EventoEscolar.CierreCiclo
    ).forEach { sistema.procesar(it) }
}
