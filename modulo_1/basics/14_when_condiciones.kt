fun main() {
    println("Controles de flujo when - con condiciones arbitrarias")
    println("Escriba un codigo")
    println("Edad del paciente:")
    val edad = readLine()?.toIntOrNull()?:0
    println("Tiene seguro:")
    val tieneSeguro = readLine()?.trim()?.lowercase() == "s"
    val nivel = if (tieneSeguro) {
        println("Nivel del seguro (Basico, Intermedio, Premium):")
        readLine()?.trim()?.uppercase()?.lowercase() ?: ""
    } else {
        ""
    }
    val copago = when {
        !tieneSeguro && edad < 18 -> 0.0
        !tieneSeguro && edad >= 65 -> 15.0
        !tieneSeguro -> 45.0
        nivel == "basico" -> 20.0
        nivel == "intermedio" -> 10.0
        nivel == "premium" -> 0.0
        else -> 0.0
    }
    println("Copago: $${"%.2f".format(copago)}")
}