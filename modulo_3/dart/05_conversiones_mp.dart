void main() {
  // Conversiones numericas
  int cupos = 40;
  double cuposDecimal = cupos.toDouble();
  String cuposTexto = cupos.toString();

  // String -> numero
  int notaEntera = int.parse('9');
  double promedio = double.parse('8.75');

  // Conversion segura
  int? cursoNumerico = int.tryParse('Decimo');
  double? pension = double.tryParse('125.50');

  // Verificar tipo con is
  Object dato = 'MAT-2026-001';
  if (dato is String) {
    print(dato.length);
  }

  // Cast explicito con as
  Object nombre = 'Unidad Educativa Central';
  String institucion = nombre as String;

  // Comprobar nulabilidad
  String? observacion;
  int longitud = observacion?.length ?? 0;

  print('Cupos: $cuposDecimal | Texto: $cuposTexto');
  print('Nota: $notaEntera | Promedio: $promedio');
  print('Curso numerico: $cursoNumerico | Pension: $pension');
  print('Institucion: $institucion');
  print('Longitud observacion: $longitud');
  print(double.infinity);
  print(double.nan);
  print(double.maxFinite);
}
