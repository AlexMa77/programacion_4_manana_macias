fun main() {
    println("Controles de flujo when - con condiciones arbitrarias")
    println("Escriba un codigo")
    
    println("Edad del estudiante:")
    val edad = readLine()?.toIntOrNull() ?: 0
    
    println("Tiene beca? (s/n):")
    val tieneBeca = readLine()?.trim()?.lowercase() == "s"
    
    val nivel = if (tieneBeca) {
        println("Nivel de beca (basico, intermedio, completo):")
        readLine()?.trim()?.lowercase() ?: ""
    } else {
        ""
    }
    
    val pago = when {
        !tieneBeca && edad < 18 -> 0.0
        !tieneBeca && edad >= 65 -> 15.0
        !tieneBeca -> 100.0
        nivel == "basico" -> 50.0
        nivel == "intermedio" -> 25.0
        nivel == "completo" -> 0.0
        else -> 0.0
    }
    
    println("Pago de matricula: $${"%.2f".format(pago)}")
}