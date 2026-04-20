fun main() {
    println("Set")

    val codigosEstudiantes = setOf(1, 2, 3, 4, 8, 4, 1, 3)
    println("Codigos de estudiantes (sin repetidos): $codigosEstudiantes")

    println("Operaciones de conjuntos")

    val estudiantesAprobados = setOf(2, 4, 6, 8, 10)
    val estudiantesBecados = setOf(3, 6, 9, 12)

    println("Aprobados: $estudiantesAprobados")
    println("Becados: $estudiantesBecados")

    println("Union : ${estudiantesAprobados union estudiantesBecados}")
    println("Interseccion : ${estudiantesAprobados intersect estudiantesBecados}")
    println("Diferencia : ${estudiantesAprobados subtract estudiantesBecados}")

    println("Aprobados: $estudiantesAprobados")
    println("Becados: $estudiantesBecados")

    println("Set Mutable")

    val materias = mutableSetOf("Matematicas", "Lengua", "Informatica")
    println(materias)

    materias.add("Matematicas") 
    materias.add("Historia")
    materias.remove("Lengua")

    println(materias)

    println("Verificar si existe la materia Matematicas: ${"Matematicas" in materias}")
    println("Verificar si existe la materia Lengua: ${"Lengua" in materias}")
}