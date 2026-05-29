void main() {
  // List: lista ordenada
  List<String> estudiantes = ['Ana', 'Luis', 'Maria'];
  var notas = [9, 8, 10, 7];

  print(estudiantes[0]);
  print(estudiantes.length);
  estudiantes.add('Carlos');
  estudiantes.remove('Luis');

  // Map: clave -> valor
  Map<String, int> asistencias = {
    'Ana': 18,
    'Luis': 16,
    'Maria': 20,
  };

  print(asistencias['Ana']);
  print(asistencias['Pedro']);
  asistencias['Carlos'] = 19;

  // Set: sin duplicados
  Set<String> materias = {'Matematica', 'Lengua', 'Historia'};
  materias.add('Matematica');
  print(materias.length);

  // Spread operator
  var cursosBasicos = ['8vo', '9no'];
  var cursosBachillerato = ['1ro BGU', '2do BGU'];
  var cursos = [...cursosBasicos, ...cursosBachillerato];
  print(cursos);

  // Collection if
  bool mostrarTutor = true;
  var datosFicha = [
    'Nombre',
    'Curso',
    if (mostrarTutor) 'Tutor',
  ];
  print(datosFicha);

  // Collection for
  var notasCurvadas = [for (var nota in notas) nota + 1];
  print(notasCurvadas);
}
