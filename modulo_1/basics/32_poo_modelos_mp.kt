data class Curso(
    val id:        Int,
    val nombre:    String,
    val creditos:  Int,
    val docente:   String,
    val activo:    Boolean = true
)

fun main() {
    val c1 = Curso(1, "Matemáticas", 4, "Prof. Ramírez")
    val c2 = Curso(1, "Matemáticas", 4, "Prof. Ramírez")
    val c3 = Curso(2, "Programación", 3, "Prof. Macias")

    // toString() automático
    println(c1)  // Curso(id=1, nombre=Matemáticas, ...)

    // equals() por valor
    println(c1 == c2)   // true
    println(c1 == c3)   // false

    // copy() — nuevo objeto con cambios puntuales
    val inactivo  = c1.copy(activo = false)
    val nuevaArea = c1.copy(creditos = 5)

    // Desestructuración
    val (id, nombre, creditos) = c1
    println("$id: $nombre — $creditos créditos")

    // En bucles
    listOf(c1, c3).forEach { (id2, nombre2, creditos2) ->
        println("[$id2] $nombre2: $creditos2 créditos")
    }
}
