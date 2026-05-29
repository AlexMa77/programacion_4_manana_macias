import 'dart:io';

void main() {
  int totalEstudiantes = 0;
  int estudiantesAprobados = 0;

  while (true) {
    print('Ingrese el promedio del estudiante:');
    double promedio = double.parse(stdin.readLineSync()!);

    totalEstudiantes++;
    if (promedio >= 7) {
      estudiantesAprobados++;
    }

    print('Desea terminar el registro? 1 = si, 0 = no:');
    int terminar = int.parse(stdin.readLineSync()!);

    if (terminar == 1) {
      break;
    }
  }

  if (estudiantesAprobados >= totalEstudiantes / 2) {
    print('Rendimiento general adecuado');
  } else {
    print('Rendimiento general bajo');
  }

  print('Total estudiantes: $totalEstudiantes');
  print('Aprobados: $estudiantesAprobados');
}
