fun main() {
    println("Listas")

    val estudiantes = listOf("Juan", "Maria", "Jose", "Maria", "Ana")

    println("Size: ${estudiantes.size}")
    println("Mostrar el elemento indice 0: ${estudiantes[0]}")
    println("Mostrar el primer elemento: ${estudiantes.first()}")
    println("Mostrar el ultimo elemento: ${estudiantes.last()}")

    println("Mostrar el elemento indice 2: ${estudiantes.get(2)}")
    println("Mostrar indice contenido elemento: ${estudiantes.indexOf("Maria")}")

    println("Verificar existencia de elemento: ${estudiantes.contains("Jose")}")
    println("Verificar existencia de un elemento: ${"Maria" in estudiantes}")

    println("Sublista: ${estudiantes.subList(1, 3)}")
    println("Tomar primeros 2 elementos: ${estudiantes.take(2)}")
    println("Suprimir tres primeros elementos: ${estudiantes.drop(3)}")
    println("Tomar los ultimos dos elementos: ${estudiantes.takeLast(2)}")

    for (estudiante in estudiantes) {
        println(estudiante)
    }

    println("lista mutable")

    val materias = mutableListOf("Matematicas", "Lengua", "Ciencias", "Historia")

    for (materia in materias) {
        println(materia)
    }

    materias.add("Informatica")
    for (materia in materias) {
        println(materia)
    }

    materias.add(0, "Fisica")
    for (materia in materias) {
        println(materia)
    }

    materias.remove("Informatica")
    for (materia in materias) {
        println(materia)
    }

    materias[1] = "Quimica"
    for (materia in materias) {
        println(materia)
    }

    println("Array deque")
    val deque = ArrayDeque<Int>()
    println(deque)
    
    deque.addFirst(1)
    println(deque)
    
    deque.addLast(2)
    println(deque)
    
    deque.addLast(3)
    println(deque)
    
    deque.removeFirst()
    println(deque)
    
    deque.removeLast()
    println(deque)
}