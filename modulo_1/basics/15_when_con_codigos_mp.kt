fun main() {
  println("Controles de Flujo when con condiciones arbitrarias")
  println("Nombre del estudiante")
  val nombreEstudiante = readLine()?.trim()?.lowercase() ?: "Sin Identificacion"
  
  println("Nivel academico (EXCELENTE/BUENO/REGULAR/DEFICIENTE)")
  val nivel = readLine()?.trim()?.uppercase() ?: ""
  
  when (nivel) {
      "EXCELENTE" -> {
          println("ESTUDIANTE DESTACADO: $nombreEstudiante")
          println("Asignar reconocimiento academico")
          println("Incluir en cuadro de honor")
      }
      "BUENO" -> {
          println("Buen rendimiento: $nombreEstudiante")
          println("Mantener seguimiento academico")
          println("Motivar a mejorar rendimiento")
      }
      "REGULAR" -> println("Rendimiento regular: $nombreEstudiante requiere apoyo")
      "DEFICIENTE" -> println("Rendimiento bajo: $nombreEstudiante necesita refuerzo academico")
      else -> println("Nivel no reconocido")
  }
}