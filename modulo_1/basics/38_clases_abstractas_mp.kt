abstract class Evaluacion(val nombre: String) {
    // abstract — las subclases DEBEN implementar esto (herencia forzada)
    abstract val nota: Double
    abstract val peso: Double       // porcentaje que representa sobre la nota final
    abstract fun descripcion(): String

    // concreto — disponible en todas las subclases (reutilización)
    val aporte: Double get() = nota * peso / 100.0

    fun comparar(otra: Evaluacion): String = when {
        nota > otra.nota -> "$nombre tiene mejor nota que ${otra.nombre}"
        nota < otra.nota -> "$nombre tiene menor nota que ${otra.nombre}"
        else             -> "$nombre y ${otra.nombre} tienen la misma nota"
    }

    // Polimorfismo: toString usa nota y descripcion que son polimórficas
    override fun toString() = "${descripcion()} | Nota: ${"%.1f".format(nota)} (peso ${peso}%)"
}

class ExamenFinal(override val nota: Double) : Evaluacion("Examen Final") {
    override val peso:  Double get() = 40.0
    override fun descripcion() = "Examen Final — nota ${"%.1f".format(nota)}"
}

class TareaGrupal(override val nota: Double, val integrantes: Int) : Evaluacion("Tarea Grupal") {
    override val peso:  Double get() = 30.0
    override fun descripcion() = "Tarea Grupal con $integrantes integrantes — nota ${"%.1f".format(nota)}"
}

class ProyectoFinal(override val nota: Double, val tema: String) : Evaluacion("Proyecto Final") {
    override val peso:  Double get() = 30.0
    override fun descripcion() = "Proyecto: $tema — nota ${"%.1f".format(nota)}"
}

fun main() {
    // POLIMORFISMO: la lista acepta cualquier Evaluacion
    val evaluaciones: List<Evaluacion> = listOf(
        ExamenFinal(8.0),
        TareaGrupal(9.5, 4),
        ProyectoFinal(7.5, "Sistema de Gestión Escolar")
    )

    evaluaciones.forEach { println(it) }  // toString polimórfico

    val notaFinal = evaluaciones.sumOf { it.aporte }
    println("\nNota final ponderada: ${"%.2f".format(notaFinal)}")

    val mejor = evaluaciones.maxByOrNull { it.nota }
    println("Mejor evaluación: ${mejor?.nombre}")

    println(evaluaciones[0].comparar(evaluaciones[1]))
}
