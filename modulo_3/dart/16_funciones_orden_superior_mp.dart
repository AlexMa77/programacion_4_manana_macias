void main() {
  final pensiones = [120.0, 135.5, 110.0, 150.0];

  // map transforma cada elemento
  final pensionesConDescuento = pensiones.map((p) => p * 0.90);
  print(pensionesConDescuento.toList());

  // map sobre Strings
  final endpoints = ['/estudiantes', '/cursos', '/matriculas'];
  final urls = endpoints.map((e) => 'https://institucion.edu.ec$e');
  print(urls.toList());

  final promedios = [8.1, 9.3, 6.5, 7.8, 9.9, 5.9];

  final aprobados = promedios.where((p) => p >= 7.0);
  print(aprobados.toList());

  final becados = promedios.where((p) => p >= 9.0);
  print(becados.toList());

  final pagos = [150.0, 200.0, 175.0, 220.0];

  // reduce combina todos los elementos en uno
  final total = pagos.reduce((acum, pago) => acum + pago);
  print('Total recaudado: \$${total.toStringAsFixed(2)}');

  // fold usa valor inicial
  final totalFold = pagos.fold(0.0, (acum, pago) => acum + pago);
  print('Total con fold: \$${totalFold.toStringAsFixed(2)}');

  final pagoMayor = pagos.reduce((a, b) => a > b ? a : b);
  print('Mayor pago: \$$pagoMayor');
}
