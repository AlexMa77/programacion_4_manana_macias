fun main() {
  println("Operadores Logicos en sistema educativo")
  val estaMatriculado = true
  val tieneDeudas = false
  val estaActivo = true
 
  println("&& - And Logico")
  println("$estaMatriculado && $tieneDeudas = ${estaMatriculado && tieneDeudas}")
  println("$estaActivo && $estaMatriculado = ${estaActivo && estaMatriculado}")
  
  println("|| - Or Logico")
  println("$estaMatriculado || $tieneDeudas = ${estaMatriculado || tieneDeudas}")
  println("$estaActivo || $estaMatriculado = ${estaActivo || estaMatriculado}")
  
  println("! - Not Logico")
  println("! $estaMatriculado = ${!estaMatriculado}")
  println("! $estaActivo = ${!estaActivo}")
}