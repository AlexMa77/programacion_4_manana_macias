fun main() {
  println("Controles de Flujo")
  println("Condicional If - Anidado")
  
  println("El estudiante tiene materias reprobadas? (s/n)")
  val entrada = readLine()?.trim()?.lowercase() ?: "n"
  val tieneReprobadas = entrada == "s"
  
  println("Promedio del estudiante")
  val promedio = readLine()?.toIntOrNull() ?: 0
  
  if (tieneReprobadas) {
      println("Estudiante con materias reprobadas")
      if (promedio < 7) {
        println("Rendimiento bajo")
      } else if (promedio > 9) {
          println("Buen promedio, pero con materias pendientes")
      } else {
        println("Promedio regular")
      }
      
  } else {
      println("Estudiante sin materias reprobadas")
      if (promedio < 7 || promedio > 10) {
          println("Promedio fuera del rango permitido")
      } else {
          println("Rendimiento académico normal")
      }
  }
}