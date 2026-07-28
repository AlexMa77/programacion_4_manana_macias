fun main() {
  println("Controles de Flujo Iteraciones, Ciclos repetitivos ciclo for")
  println("For con rango")
  
  for( i in 1..10){
     val a=5
      println("5x$i=${i*a}")
  }
  
  println("For con until")
  for( i in 1 until 11){
     val a=5
      println("5x$i=${i*a}")
  }
  fun main() {
  println("Controles de Flujo Iteraciones, Ciclos repetitivos ciclo for")
  println("For con rango")
  
  for (i in 1..10) {
     val a = 5
      println("Nota base 5 * $i = ${i * a}")
  }
  
  println("For con until")
  for (i in 1 until 11) {
     val a = 5
      println("Nota base 5 * $i = ${i * a}")
  }
  
  println("For con pasos")
  for (i in 1..10 step 3) {
      println(i)
  }
  
  println("For descendente")
  for (i in 10 downTo 1) {
      println(i)
  }
  
  println("For con listas")
  val estudiantes = listOf("Juan", "Maria", "Jose")
  for (estudiante in estudiantes) {
      println(estudiante)
  }
  
  println("For con listas index valor")
  for ((index, valor) in estudiantes.withIndex()) {
      println("$index -> $valor")
  }
  
  println("For con Break")
  for (i in 1..10) {
      if (i == 5) {
          break
      }
  }
  
  println("For con Continue")
  for (i in 1..10) {
      if (i == 3) {
          continue
      }
      println("item $i")
  }
  
  println("For con Continue y Break")
  for (i in 1..10) {
      if (i == 3) continue
      if (i == 7) break
      println("item $i")
  }
  
  val estudiantesDatos = listOf(
    Triple("Garcia, M", 8.5, 90),
    Triple("Macias, L", 6.8, 75),
    Triple("Torres, R", 9.2, 95),
  )
  
  for ((posicion, estudiante) in estudiantesDatos.withIndex()) {
      val (nombre, promedio, asistencia) = estudiante
      val estadoPromedio = if (promedio >= 7.0) "Aprobado" else "Reprobado"
      val estadoAsistencia = if (asistencia >= 80) "Regular" else "Baja"
      
      println("Estudiante $posicion - $nombre - Promedio: $promedio ($estadoPromedio) - Asistencia: $asistencia% ($estadoAsistencia)")
  }
}
  println("For con pasos")
  for(i in 1..10 step 3){
      println(i)
  }
  
  println("For descendente")
  for(i in 10 downTo 1){
      println(i)
  }
  
  println("For con listas")
  val nombres = listOf("Juan", "Maria", "Jose")
  for(nombre in nombres){
      println(nombre)
  }
  
  println("For con listas index valor")
  for ((index, valor) in nombres.withIndex()){
      println("$index->$valor")
  }
  
  println("For con Brake")
  for(i in 1..10){
      if(i==5){
          break;
      }
  }
  
  println("For con Continue")
  for(i in 1..10){
      if(i==3){
          continue;
      }
      println("item $i")
  }
  
   println("For con Continue")
  for(i in 1..10){
      if(i==3) continue;
      if(i==7) break;
      println("item $i")
  }
  
  val pacientes = listOf(
    Triple("Garcia, M", 37.2, 98),
    Triple("Macias, L", 39.1, 94),
    Triple("Torres, R", 40.3, 91),
  )
  for((posicion,paciente) in pacientes.withIndex()){
      val (nombre, temperatura, spo2) = paciente
      val alertaTemp = if(temperatura>=38.0) "Fiebre" else "Normal"
      val alertaSpo2 = if (spo2<95.0) "Baja" else "Normal"
      println("Cama $posicion - $nombre - Temp: $temperatura Gdo.Cent $alertaTemp - Spo2: $spo2 $alertaSpo2")
  }
}