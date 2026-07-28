fun main() {
    println("Funciones en sistema educativo")
    
    val mensaje = bienvenida()
    println("$mensaje")
    
    val sumaNotas: Int = sumar(8, 7)
    println("Suma de notas: $sumaNotas")
    
    println("Diferencia de notas: ${restarTipoExpresion(9, 6)}")
    println("Diferencia de notas: ${restarTipoInferido(9, 6)}")
    
    saludarEstudiante("Alex")
}

fun bienvenida(): String {
    return "Bienvenido al sistema educativo"
}

fun sumar(a: Int, b: Int): Int {
    return a + b
}

// Tipo expresion
fun restarTipoExpresion(a: Int, b: Int) = a - b

// Inferido
fun restarTipoInferido(a: Int, b: Int) = a - b

fun saludarEstudiante(nombre: String) {
    println("Hola estudiante $nombre")
}