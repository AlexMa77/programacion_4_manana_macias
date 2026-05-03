// El usuario de esta clase solo sabe QUÉ puede hacer con un Estudiante
// No necesita saber cómo se calcula el promedio ni cómo funciona estaAprobado
class Estudiante(
    val id:       Int,
    val nombre:   String,
    val grado:    String,
    private val notas: List<Double>   // privado — el usuario no manipula las notas directamente
) {
    val promedio: Double              // interfaz pública — qué puede consultar
        get() = if (notas.isEmpty()) 0.0 else notas.average()

    val estaAprobado: Boolean
        get() = promedio >= 6.0

    override fun toString() = "$nombre ($grado) — Promedio: ${"%.2f".format(promedio)}"
}

fun main() {
    val estudiante = Estudiante(1, "Ana García", "10°A", listOf(8.0, 7.5, 9.0, 6.5))

    // El código externo usa la interfaz pública — no sabe el detalle interno
    println(estudiante.promedio)     // 7.75
    println(estudiante.estaAprobado) // true
    // estudiante.notas = ...        // ERROR — privado, protegido por diseño
}
