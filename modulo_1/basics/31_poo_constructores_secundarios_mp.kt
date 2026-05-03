class Aula(val capacidad: Int, val numeroAula: String) {
    val descripcion: String get() = "Aula $numeroAula — Capacidad: $capacidad estudiantes"

    // Siempre llaman al constructor primario con this(...)
    constructor(capacidad: Int, piso: Int, numero: Int) : this(capacidad, "$piso-$numero")
    constructor(capacidad: Int, numero: Int) : this(capacidad, numero.toString())

    override fun toString() = descripcion
}

fun main() {
    val a1 = Aula(35, "204-B")
    val a2 = Aula(40, 2, 5)     // piso 2, aula 5
    val a3 = Aula(30, 101)      // con número entero

    println(a1)  // Aula 204-B — Capacidad: 35 estudiantes
    println(a2)  // Aula 2-5 — Capacidad: 40 estudiantes
    println(a3)  // Aula 101 — Capacidad: 30 estudiantes
}
