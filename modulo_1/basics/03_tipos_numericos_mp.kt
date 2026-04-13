/**
 * You can edit, run, and share this code.
 * play.kotlinlang.org
 */
fun main() {
    // Tipo Datos
    // Números enteros
    val estudiantesAula: Byte = 30
    println("Estudiantes en aula (Byte) $estudiantesAula")
    val totalEstudiantes: Short = 1500
    println("Total estudiantes (Short) $totalEstudiantes")
    val anioLectivo: Int = 2026
    println("Anio lectivo (Int) $anioLectivo")
    val codigoInstitucion: Long = 12_122_122_122_123_123L
    println("Codigo institucion (Long) $codigoInstitucion")
    
    println("Numeros Decimales")
    val promedioCurso: Float = 8.75f
    println("Promedio curso (Float) $promedioCurso")
    val promedioGeneral: Double = 8.7564321987
    println("Promedio general (Double) $promedioGeneral")
    
    // Inferido
    val estudiante = "Alex"
    val edad = 19
    
    println("Estudiante $estudiante")
    val nombreTipo = estudiante::class.simpleName
    println("Tipo inferido estudiante : ${nombreTipo}")
    println("Tipo inferido estudiante : ${estudiante::class.simpleName}")
    println("Edad $edad")
    val edadTipo = edad::class.simpleName
    println("Tipo inferido edad : ${edadTipo} ")
    println("Tipo inferido edad : ${edad::class.simpleName}")
}