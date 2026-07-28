class Nota(valor: Double) {

    // ENCAPSULAMIENTO: el setter valida antes de asignar
    var valor: Double = valor
        set(value) {
            require(value in 0.0..10.0) { "La nota debe estar entre 0 y 10" }
            field = value  // 'field' es el backing field
        }

    // ABSTRACCIÓN: el usuario consulta el estado sin saber la lógica interna
    val estado: String
        get() = when {
            valor < 6.0  -> "Reprobado"
            valor < 7.0  -> "Suficiente"
            valor < 8.5  -> "Bueno"
            valor < 9.5  -> "Muy bueno"
            else         -> "Excelente"
        }

    val estaAprobado: Boolean
        get() = valor >= 6.0

    val porcentaje: Double
        get() = valor * 10.0
}

fun main() {
    val nota = Nota(7.5)
    println("${nota.valor} — ${nota.estado} (${nota.porcentaje}%)")
    println(nota.estaAprobado)  // true

    nota.valor = 4.0
    println("${nota.valor} → ${nota.estado}")  // Reprobado

    // nota.valor = 11.0  // IllegalArgumentException
}
