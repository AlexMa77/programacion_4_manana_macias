int sumarNotas(int a, int b) {
  return a + b;
}

double calcularPromedio(double n1, double n2) => (n1 + n2) / 2;

String formatearMatricula(String codigo) => 'Matricula: $codigo';

formatearCursoSinTipo(String curso) => 'Curso asignado: $curso';

String construirRutaReporte(String modulo, String recurso, [int? periodo]) {
  if (periodo != null) {
    return '/$modulo/$periodo$recurso';
  }
  return '/$modulo$recurso';
}

String construirRutaReporteV2(String modulo, String recurso, [int periodo = 2026]) {
  return '/$modulo/$periodo$recurso';
}

void imprimirSeparador(String titulo) {
  print('--- $titulo ---');
}

void main() {
  print(sumarNotas(9, 8));
  print(calcularPromedio(8.5, 9.5));
  imprimirSeparador('Sistema de Gestion de Institucion Educativa');

  print(formatearMatricula('MAT-2026-001'));
  print(formatearCursoSinTipo('Segundo Bachillerato'));

  print(construirRutaReporte('academico', '/estudiantes'));
  print(construirRutaReporte('academico', '/notas', 2026));
  print(construirRutaReporteV2('secretaria', '/matriculas'));
}
