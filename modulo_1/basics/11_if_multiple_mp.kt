fun main() {
  println("Controles de Flujo")
  println("Condicional If - else")
  println("Tiene beca estudiantil s/n: ")
  val tieneBeca = readLine()?.trim()?.lowercase() == "s"
  
  println("Costo de matrícula: ")
  val costoBase = readLine()?.toDoubleOrNull() ?: 0.0
  
  if (tieneBeca) {
    val cobertura = costoBase * 0.80    
    println("La beca cubre: $${"%.2f".format(cobertura)}")
  } else {
      println("Pago total del estudiante: $${"%.2f".format(costoBase)}")
  }
}