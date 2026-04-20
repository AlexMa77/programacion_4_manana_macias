fun main() {
    println("Controles de Flujo Iteraciones. Ciclos repetitivos - Ciclo Repeat")
    println("¿Cuantas calificaciones desea ingresar?")
    
    val mediciones = readLine()?.toIntOrNull() ?: 3
    var totalNotas = 0
    
    repeat(mediciones) { i ->
        println("Nota ${i + 1}")
        val nota = readLine()?.toIntOrNull() ?: 0
        totalNotas += nota
    }
    
    val promedio = if (mediciones > 0) totalNotas / mediciones else 0
    
    println("Promedio del estudiante: $promedio")
    println("Clasificacion: ${
        when {
            promedio < 7 -> "Reprobado"
            promedio <= 9 -> "Aprobado"
            else -> "Excelente"
        }
    }")
}