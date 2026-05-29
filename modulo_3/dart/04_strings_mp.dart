void main() {
  final estudiante = 'Ana';
  final edad = 16;
  final curso = 'Segundo Bachillerato';

  // Interpolacion con $
  print('Ficha de $estudiante');

  // Expresion con ${}
  print('${estudiante.toUpperCase()} tendra ${edad + 1} anios el proximo anio');

  // String multilinea
  final ficha = '''
Sistema de Gestion de Institucion Educativa
Estudiante: $estudiante
Edad:       $edad
Curso:      $curso
Mayor:      ${edad >= 18 ? 'Si' : 'No'}
  ''';
  print(ficha);

  // Raw string
  final ruta = r'C:\Institucion\Reportes\Matriculas';
  print(ruta);

  // Concatenacion
  final saludo = 'Bienvenida, ' + estudiante + '!';
  print(saludo);

  // Metodos utiles de String
  print('matricula'.toUpperCase());
  print('  Secretaria  '.trim());
  print('Matematica'.contains('tema'));
  print('Aula-101'.replaceAll('-', ' '));
  print('Ana,Luis,Maria'.split(','));
  print('Bachillerato'.substring(0, 5));
  print('Curso A'.startsWith('Curso'));
  print('7'.padLeft(2, '0'));
}
