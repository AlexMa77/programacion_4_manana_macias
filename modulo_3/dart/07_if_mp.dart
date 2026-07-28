void main() {
  // Forma basica
  double promedio = 8.6;

  if (promedio >= 9) {
    print('Rendimiento excelente');
  } else if (promedio >= 7) {
    print('Rendimiento aprobado');
  } else {
    print('Necesita refuerzo academico');
  }

  // Operador ternario
  String estado = promedio >= 7 ? 'Aprobado' : 'Reprobado';
  print(estado);

  // null-aware con ternario
  String? aula;
  String display = aula != null ? aula.toUpperCase() : 'Sin aula asignada';
  print(display);

  // Forma mas concisa con ??
  String display2 = aula?.toUpperCase() ?? 'Sin aula asignada';
  print(display2);

  // Verificacion explicita de null
  String? nombreTutor;
  if (nombreTutor != null) {
    print(nombreTutor.length);
  }

  print(nombreTutor?.length);
  int longitud = nombreTutor?.length ?? 0;
  print(longitud);
}
