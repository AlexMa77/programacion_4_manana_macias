fun main() {
    println("Map inmutable")

    val cursos = mapOf(
        "Matematicas" to "Aula 101",
        "Lengua" to "Aula 102",
        "Ciencias" to "Laboratorio",
        "Historia" to "Aula 103"
    )

    println(cursos["Matematicas"])
    println(cursos["Fisica"])
    println(cursos.getOrDefault("Matematicas", "No asignado"))
    println(cursos.getOrDefault("Fisica", "No asignado"))

    println(cursos)
    println(cursos.keys)
    println(cursos.values)
    println(cursos.entries)

    for ((curso, aula) in cursos) {
        println("$curso - $aula")
    }

    println("Map Mutable")

    val inventarioAulas = mutableMapOf(
        "Computadoras" to 10,
        "Proyectores" to 4,
        "Sillas" to 30,
        "Mesas" to 15
    )

    inventarioAulas["Pizarras"] = 2
    println(inventarioAulas)

    inventarioAulas["Computadoras"] = 20
    println(inventarioAulas)

    inventarioAulas.remove("Mesas")
    println(inventarioAulas)

    inventarioAulas.getOrPut("Impresoras") { 5 }
    println(inventarioAulas)

    inventarioAulas.getOrPut("Sillas") { 50 }
    println(inventarioAulas)
}