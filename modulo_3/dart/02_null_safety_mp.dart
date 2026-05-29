void main() {
  // Tipo no-nullable: nunca puede ser null
  String nombreEstudiante = 'Carlos';

  // Tipo nullable: puede ser null
  String? representante = null;
  representante = 'Maria Gomez';

  // Operadores de null safety
  String? aulaAsignada;

  // Safe call
  print(aulaAsignada?.length);

  // Valor por defecto con ??
  String aulaVisible = aulaAsignada ?? 'Aula pendiente';
  print(aulaVisible);

  // Null check con if
  if (representante != null) {
    print('Representante registrado: ${representante.length} caracteres');
  }

  // late: inicializacion diferida
  late String codigoMatricula;
  codigoMatricula = 'MAT-2026-001';

  print('Estudiante: $nombreEstudiante');
  print('Codigo: $codigoMatricula');
}
