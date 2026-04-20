fun main() {
    println("Funciones - Parametros por defecto")
    
    println(crearEstudiante("Jhon", 25, "becado", true))
    println(crearEstudiante("Luis"))
    println(crearEstudiante("Maria", 30))
    println(crearEstudiante("Juan", 30, "becado"))
    
    // Argumentos nombrados
    println(crearEstudiante(edad = 20, nombre = "Yamilet", activo = false))
}

fun crearEstudiante(
    nombre: String,
    edad: Int = 18,
    tipo: String = "regular",
    activo: Boolean = true
): String {
    return "Estudiante[$nombre, edad=$edad, tipo=$tipo, activo=$activo]"
}