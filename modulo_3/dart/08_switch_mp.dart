void main() {
  String codigoProceso = 'MAT';

  switch (codigoProceso) {
    case 'MAT':
      print('Matricula');
    case 'INS':
      print('Inscripcion');
    case 'NOT':
      print('Registro de notas');
    case 'ASI':
      print('Control de asistencia');
    case 'REP':
      print('Reporte academico');
    default:
      print('Proceso desconocido');
  }

  String descripcion = switch (codigoProceso) {
    'MAT' => 'Matricula de estudiante',
    'INS' => 'Inscripcion a curso',
    'NOT' => 'Carga de calificaciones',
    'ASI' => 'Registro diario de asistencia',
    'REP' => 'Generacion de reportes',
    _ => 'Codigo de proceso desconocido',
  };
  print(descripcion);

  int nota = 8;

  String categoria = switch (nota) {
    10 || 9 => 'Excelente',
    8 || 7 => 'Aprobado',
    6 || 5 => 'Refuerzo',
    4 || 3 || 2 || 1 || 0 => 'Reprobado',
    _ => 'Nota invalida',
  };
  print(categoria);

  double promedio = 9.4;

  String beca = switch (promedio) {
    double p when p >= 9.5 => 'Beca completa',
    double p when p >= 9.0 => 'Media beca',
    double p when p >= 7.0 => 'Sin beca, aprobado',
    _ => 'Necesita apoyo academico',
  };
  print(beca);
}
