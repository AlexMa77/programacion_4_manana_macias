interface Exportable {
    val id: String                        // abstracta — debe implementarse
    fun exportar(): String                // abstracta — debe implementarse
    val version: Int get() = 1            // con default — puede sobreescribirse
}

interface Validable {
    val errores: List<String>
    val esValido: Boolean get() = errores.isEmpty()

    fun validar(): Boolean
    fun imprimirErrores() {               // implementación por defecto
        if (errores.isEmpty()) println("Sin errores")
        else errores.forEach { println("  ❌ $it") }
    }
}

// POLIMORFISMO: Inscripcion puede usarse donde se espere Exportable O Validable
data class Inscripcion(
    override val id: String,
    val estudiante:  String,
    val cursos:      List<String>,
    val promedio:    Double
) : Exportable, Validable {

    override fun exportar() =
        "$id|$estudiante|${cursos.joinToString(",")}|$promedio"

    override val errores: List<String> get() = buildList {
        if (estudiante.isBlank()) add("El nombre del estudiante no puede estar vacío")
        if (cursos.isEmpty())     add("La inscripción debe incluir al menos un curso")
        if (promedio < 0.0)       add("El promedio no puede ser negativo")
    }

    override fun validar() = esValido
}

fun main() {
    val ins1 = Inscripcion("INS-001", "Ana García", listOf("Matemáticas", "Programación"), 8.5)
    val ins2 = Inscripcion("INS-002", "",            emptyList(),                           -1.0)

    // Polimorfismo por interfaz
    fun procesarExportable(e: Exportable) = println("→ ${e.exportar()}")
    fun procesarValidable(v: Validable) {
        println("Válido: ${v.esValido}")
        v.imprimirErrores()
    }

    procesarExportable(ins1)   // → INS-001|Ana García|Matemáticas,Programación|8.5
    procesarValidable(ins1)    // Válido: true / Sin errores
    procesarValidable(ins2)    // Válido: false / ❌ ...
}
