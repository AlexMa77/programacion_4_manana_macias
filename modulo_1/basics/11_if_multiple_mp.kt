fun main() {
  println("Controles de Flujo")
  println("Condicional If - Multiples Condicionales")
  println("Promedio del estudiante")
  val promedio = readLine()?.toIntOrNull() ?: 0
  
  val clasificacion = if (promedio < 7) {
      "Reprobado"
  } else if (promedio <= 8) {
      "Aprobado"
  } else if (promedio <= 9) {
      "Muy Bueno"
  } else if (promedio <= 10) {
      "Excelente"
  } else {
      "Promedio fuera de rango"
  }
  
  println("Clasificacion: $clasificacion")
}