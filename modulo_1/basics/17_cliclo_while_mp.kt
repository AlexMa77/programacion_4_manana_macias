fun main() {
    println("Controles de Flujo Iteraciones, Ciclos repetitivos-Ciclo For")
    
    println("For con rango")
    for (i in 1..5) {
        println("Curso $i")
    }

    println("For con until")
    for (i in 1 until 5) {
        println("Nivel $i")
    }

    println("Controles de Flujo Iteraciones, Ciclos repetitivos-Ciclo While")
    
    println("While basico")
    var contador = 1
    while (contador <= 5) {
        println("Estudiante $contador")
        contador++
    }

    println("While con do-while")
    contador = 1
    do {
        println("Registro $contador")
        contador++
    } while (contador <= 5)

    println("Break continue")
    contador = 0
    while (contador < 10) {
       contador++
       if (contador == 3) continue
       if (contador == 7) break
       println("Iteracion $contador")
    }

    var input: String
    while (true) {
        print("Ingrese 'salir' para terminar: ")
        input = readLine() ?: ""
        if (input == "salir" || input == "") break
        println("Dato ingresado: $input")
    }

    println("While infinito")
    contador = 1
    while (true) {
        println("Contador $contador")
        if (contador >= 5) break
        contador++
    }

    println("While con break y continue")
    contador = 0
    while (contador < 10) {
       contador++
       if (contador == 3) continue
       if (contador == 7) break
       println("Valor $contador")
    }

    // MENU EDUCATIVO
    var opcion: String

    while (true) {
        print("\nSeleccione una opcion (1-registrar, 2-calcular promedio, 3-ver lista, 4-salir): ")
        opcion = readLine() ?: ""

        when (opcion) {
            "1" -> {
                println("Ejecutando: registrar estudiante ($opcion)")
            }
            "2" -> {
                println("Ejecutando: calcular promedio ($opcion)")
            }
            "3" -> {
                println("Ejecutando: ver lista de estudiantes ($opcion)")
            }
            "4", "salir" -> {
                println("Saliendo del sistema educativo...")
                break
            }
            else -> {
                println("Error: No existe la opcion '$opcion'")
            }
        }
    }
}