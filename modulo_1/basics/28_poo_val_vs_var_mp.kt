class MatriculaEstudiante(val codigo: String, val nombre: String)   // solo lectura

class AsistenciaCurso(var totalClases: Int = 0) {                   // lectura y escritura
    fun registrarClase() { totalClases++ }
    fun reiniciar()      { totalClases = 0 }
}

// Sin val/var — parámetro del constructor, NO propiedad
// Solo accesible dentro del bloque init
class InscripcionTemporal(codigoCurso: String) {
    val codigoNormalizado = codigoCurso.uppercase()
    // codigoCurso no existe fuera de aquí
}
