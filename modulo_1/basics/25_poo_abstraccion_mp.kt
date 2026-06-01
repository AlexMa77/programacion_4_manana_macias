
class Estudiante(
    val id:       Int,
    val nombre:   String,
    val grado:    String,
    private val notas: List<Double>   
) {
    val promedio: Double              
        get() = if (notas.isEmpty()) 0.0 else notas.average()

    val estaAprobado: Boolean
        get() = promedio >= 6.0

    override fun toString() = "$nombre ($grado) — Promedio: ${"%.2f".format(promedio)}"
}

fun main() {
    val estudiante = Estudiante(1, "Ana García", "10°A", listOf(8.0, 7.5, 9.0, 6.5))

    println(estudiante.promedio)     
    println(estudiante.estaAprobado) 
    
}
