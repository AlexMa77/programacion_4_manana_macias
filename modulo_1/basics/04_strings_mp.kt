/**
 * You can edit, run, and share this code.
 * play.kotlinlang.org
 */
fun main() {
    val nombre = "Alex"
    val apellido = "Macias"
    val edad = 19
    // Variable Simple
    println("Bienvenido estudiante $nombre")
    // Expresion
    println("Nombre completo : ${nombre.uppercase()} ${apellido.uppercase()}")
    val nombreCompleto = "Nombre completo : ${nombre.uppercase()} ${apellido.uppercase()}"
    println(nombreCompleto)
    println("Edad : ${edad+1} anios")
    
    // String MultiLinea
    val tarjeta = """
    	|Nombre: $nombre $apellido
        |Edad: $edad
        |Estado academico: ${if(edad>17)"Apto para matricula" else "No apto"}
    """.trimMargin()
    println(tarjeta)
}