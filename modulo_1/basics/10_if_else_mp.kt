fun main() {
  println("Controles de Flujo")
  println("Condicional If - else")
  println("Tiene beca s/n: ")
  val tieneBeca = readLine()?.trim()?.lowercase() == "s"
  
  println("Costo de matrícula: ")
  val costoBase = readLine()?.toDoubleOrNull() ?: 0.0
  
  if (tieneBeca) {
    val descuento = costoBase * 0.50    
    println("Beca aplicada: $${"%.2f".format(descuento)}")
  } else {
      println("Pago completo: $${"%.2f".format(costoBase)}")
  }
}