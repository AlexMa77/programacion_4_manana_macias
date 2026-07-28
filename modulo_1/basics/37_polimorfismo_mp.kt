// La interfaz define el contrato — QUÉ puede hacer
// Las implementaciones definen el CÓMO
interface Evaluable {
    fun calificar(estudiante: String): Double
    val nombre: String
}

class Examen(val puntaje: Double) : Evaluable {
    override val nombre = "Examen escrito"
    override fun calificar(estudiante: String): Double {
        println("📝 Calificando examen de $estudiante: ${"%.1f".format(puntaje)}")
        return puntaje
    }
}

class Proyecto(val entregado: Boolean, val calidad: Double) : Evaluable {
    override val nombre = "Proyecto"
    override fun calificar(estudiante: String): Double {
        val nota = if (entregado) calidad else 0.0
        println("📁 Evaluando proyecto de $estudiante: ${"%.1f".format(nota)}")
        return nota
    }
}

class Participacion(val asistencia: Double) : Evaluable {
    override val nombre = "Participación"
    override fun calificar(estudiante: String): Double {
        val nota = asistencia / 10.0
        println("🙋 Participación de $estudiante: ${"%.1f".format(nota)}")
        return nota
    }
}

// Esta función no sabe ni le importa qué tipo de evaluación es
// Solo sabe que recibe algo que implementa Evaluable — POLIMORFISMO
fun evaluar(estudiante: String, evaluacion: Evaluable) {
    println("Evaluando con ${evaluacion.nombre}...")
    val nota = evaluacion.calificar(estudiante)
    println(if (nota >= 6.0) "✅ Aprobado" else "❌ Reprobado")
}

fun main() {
    val evaluaciones: List<Evaluable> = listOf(
        Examen(8.5),
        Proyecto(true, 9.0),
        Participacion(75.0)
    )

    // Misma función — comportamiento distinto según el tipo
    evaluaciones.forEach { evaluar("Ana García", it) }
}
