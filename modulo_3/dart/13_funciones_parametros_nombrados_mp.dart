// required: el parametro es obligatorio
// sin required: es opcional si tiene valor por defecto o es nullable
void configurarCurso({
  required String nombre,
  required String docente,
  int cupos = 30,
  bool activo = true,
}) {
  final estado = activo ? 'activo' : 'inactivo';
  print('Curso $nombre con $docente | Cupos: $cupos | Estado: $estado');
}

void main() {
  // Los nombrados pueden pasarse en cualquier orden
  configurarCurso(
    docente: 'Lic. Sanchez',
    nombre: 'Matematica',
    cupos: 35,
    activo: true,
  );

  // Solo los obligatorios: los opcionales toman su valor por defecto
  configurarCurso(
    nombre: 'Historia',
    docente: 'Lic. Vera',
  );
}
