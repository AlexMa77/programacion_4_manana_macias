fun main() {
  println("Controles de Flujo")
  println("Escriba codigo de materia: ")
  val codigo = readLine()?.toIntOrNull() ?: 0
  
  val materia = when(codigo){
      1 -> "Matematicas"
      2 -> "Lengua y Literatura"
      3 -> "Ciencias Naturales"
      4 -> "Estudios Sociales"
      5 -> "Informatica"
      else -> "Materia no registrada"
  }
  
  val horario = when(codigo){
      1 -> "08:00 - 10:00"
      2 -> "10:00 - 12:00"
      3 -> "12:00 - 14:00"
      4 -> "14:00 - 16:00"
      5 -> "16:00 - 18:00"
      else -> "Horario no registrado"
  }
  
  println("Materia: $materia")
  println("Horario: $horario")
}