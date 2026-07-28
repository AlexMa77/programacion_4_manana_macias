void main() {
  final materias = ['Matematica', 'Lengua', 'Historia', 'Ciencias'];

  // for-in para recorrer listas
  for (final materia in materias) {
    print(materia);
  }

  // forEach con lambda
  materias.forEach((m) => print(m.toUpperCase()));

  // for-in sobre un Map
  final docentes = {
    'Matematica': 'Ing. Perez',
    'Lengua': 'Lic. Mora',
    'Historia': 'Lic. Vera',
  };

  for (final entrada in docentes.entries) {
    print('${entrada.key} -> ${entrada.value}');
  }

  // for-in sobre caracteres de un String convertido a lista
  for (final caracter in 'Aula'.split('')) {
    print(caracter);
  }
}
