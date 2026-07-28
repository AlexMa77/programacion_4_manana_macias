/**
 * You can edit, run, and share this code.
 * play.kotlinlang.org
 */
fun main() {
    // No Mutable
    val estudiante = "Alex Macias"
    val edad: Int = 19
    val promedio = 9.5
    
    // Mutable
    var numeroEstudiantes = 0
    numeroEstudiantes = numeroEstudiantes + 1
    println(numeroEstudiantes)
    numeroEstudiantes = numeroEstudiantes - 1
    println(numeroEstudiantes)
    
    println("$estudiante tiene $edad años y su promedio es $promedio")
}