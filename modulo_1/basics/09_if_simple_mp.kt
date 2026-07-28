fun main() {
  println("Controles de Flujo")
  println("Condicional If")
  println("Ingresar promedio del estudiante: ")
  val promedio = readLine()?.toDoubleOrNull() ?: 0.0
  
  if (promedio >= 7.0) {
      println("Estudiante aprobado: puede continuar al siguiente nivel")
  }
  if (promedio >= 9.0) {
      println("Estudiante destacado: candidato a reconocimiento académico")
  }
  
  println("Promedio registrado: $promedio")
}