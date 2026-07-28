void main() {
  // var: tipo inferido
  var nombreEstudiante = 'Ana';
  var edad = 16;
  var promedio = 9.25;
  var matriculado = true;

  // Tipo explicito
  String curso = 'Segundo Bachillerato';
  int cuposDisponibles = 25;
  double notaMinima = 7.0;
  bool jornadaMatutina = true;

  // final: no se puede reasignar
  final institucion = 'Sistema de Gestion de Institucion Educativa';

  // const: constante en tiempo de compilacion
  const anioLectivo = 2026;
  const notaMaxima = 10.0;

  // final puede evaluarse en runtime
  final fechaRegistro = DateTime.now();

  print('$institucion');
  print('$nombreEstudiante tiene $edad anios y pertenece a $curso');
  print('Promedio: $promedio | Matriculado: $matriculado');
  print('Cupos: $cuposDisponibles | Nota minima: $notaMinima');
  print('Jornada matutina: $jornadaMatutina');
  print('Anio lectivo: $anioLectivo | Nota maxima: $notaMaxima');
  print('Fecha de registro: $fechaRegistro');
}
