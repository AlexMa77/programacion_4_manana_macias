fun main() {
  println("Controles de Flujo")
  println("Escriba codigo: ")
  val codigo=readLine()?.toIntOrNull()?:0
  val especialidad = when(codigo){
      1->"Sangre venenosa"
      2->"Orina"
      3->"Heces"
      4->"Hisopado nasofaringeo"
      5->"Biopsia"
      else -> "Especialidad no registrada"
  }
  val tiempo = when(codigo){
      1->"4h"
      2->"2h"
      3->"24h"
      4->"6h"
      5->"72h"
      else -> "Hora no registrada"
  }
  println("Especialidad: $especialidad")
  println("Tiempo: $tiempo")
}