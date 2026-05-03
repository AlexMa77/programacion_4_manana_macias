data class Materia(val id: Int, val nombre: String)

data class Estudiante(
    val id:       Int,
    val nombre:   String,
    val promedio: Double,
    val creditos: Int,
    val materia:  Materia,
    val activo:   Boolean = true
) {
    // ABSTRACCIÓN: el usuario consulta sin saber la lógica interna
    val estaAprobado: Boolean get() = activo && promedio >= 6.0
    val nivel: String
        get() = when {
            promedio >= 9.0 -> "Excelente"
            promedio >= 7.0 -> "Bueno"
            promedio >= 6.0 -> "Suficiente"
            else            -> "Reprobado"
        }

    // Devuelve una copia — inmutabilidad como forma de encapsulamiento
    fun aplicarBono(puntos: Double): Estudiante {
        require(puntos in 0.0..2.0) { "El bono debe estar entre 0 y 2" }
        return copy(promedio = minOf(promedio + puntos, 10.0))
    }
}

// ENCAPSULAMIENTO: el estado del registro es privado y mutable internamente
object RegistroEstudiantes {
    private val materias = mutableListOf(
        Materia(1, "Matemáticas"),
        Materia(2, "Programación"),
        Materia(3, "Comunicación")
    )
    private val estudiantes = mutableListOf<Estudiante>()
    private var siguienteId = 1

    fun inscribir(nombre: String, promedio: Double, creditos: Int, materiaId: Int): Estudiante? {
        val materia = materias.find { it.id == materiaId } ?: return null
        val estudiante = Estudiante(siguienteId++, nombre, promedio, creditos, materia)
        estudiantes.add(estudiante)
        return estudiante
    }

    // ABSTRACCIÓN: interfaz pública limpia — solo lectura de listas
    fun listar(): List<Estudiante>              = estudiantes.toList()
    fun aprobados(): List<Estudiante>           = estudiantes.filter { it.estaAprobado }
    fun porMateria(id: Int): List<Estudiante>   = estudiantes.filter { it.materia.id == id }
    fun buscar(query: String): List<Estudiante> =
        estudiantes.filter { it.nombre.contains(query, ignoreCase = true) }
}

fun main() {
    RegistroEstudiantes.inscribir("Ana García",   8.5, 60, 1)
    RegistroEstudiantes.inscribir("Luis Herrera", 5.0, 45, 1)
    RegistroEstudiantes.inscribir("María López",  9.2, 72, 2)
    RegistroEstudiantes.inscribir("Carlos Díaz",  7.1, 50, 3)

    println("=== Todos los estudiantes ===")
    RegistroEstudiantes.listar().forEach { e ->
        val estado = if (e.estaAprobado) "✅" else "❌"
        println("$estado ${e.nombre} — ${e.nivel} (${"%.1f".format(e.promedio)})")
    }

    println("\n=== Aprobados con bono de 0.5 ===")
    RegistroEstudiantes.aprobados()
        .map { it.aplicarBono(0.5) }
        .forEach { println("  ${it.nombre}: ${"%.1f".format(it.promedio)}") }
}
