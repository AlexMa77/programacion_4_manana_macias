import 'dart:io';

void main() {
  print('Sistema de Gestion de Institucion Educativa');

  print('Ingrese el nombre del estudiante:');
  String? nombre = stdin.readLineSync();
  print('Estudiante registrado: $nombre');

  print('Ingrese la edad:');
  int edad = int.parse(stdin.readLineSync()!);
  print('Edad: $edad');

  print('Ingrese el promedio general:');
  double promedio = double.parse(stdin.readLineSync()!);
  print('Promedio: $promedio');

  print('Ingrese la primera nota:');
  int nota1 = int.parse(stdin.readLineSync()!);
  print('Ingrese la segunda nota:');
  int nota2 = int.parse(stdin.readLineSync()!);

  int suma = nota1 + nota2;
  print('La suma de las notas $nota1 y $nota2 es: $suma');
}
