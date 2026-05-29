abstract class ServicioAcademico {
  String get nombre;
  double calcularCosto();
}

class Matricula extends ServicioAcademico {
  final double valorBase;
  Matricula(this.valorBase);

  @override
  String get nombre => 'Matricula';
  @override
  double calcularCosto() => valorBase;
}

class Pension extends ServicioAcademico {
  final double mensualidad;
  final int meses;
  Pension(this.mensualidad, this.meses);

  @override
  String get nombre => 'Pension';
  @override
  double calcularCosto() => mensualidad * meses;
}

class Transporte extends ServicioAcademico {
  final double tarifa;
  Transporte(this.tarifa);

  @override
  String get nombre => 'Transporte';
  @override
  double calcularCosto() => tarifa;
}

// POLIMORFISMO: una sola funcion trabaja con cualquier servicio
void imprimirCosto(ServicioAcademico servicio) {
  print('${servicio.nombre}: \$${servicio.calcularCosto().toStringAsFixed(2)}');
}

void main() {
  final servicios = <ServicioAcademico>[
    Matricula(80.0),
    Pension(120.0, 10),
    Transporte(35.0),
  ];

  for (final servicio in servicios) {
    imprimirCosto(servicio);
  }

  final mayor = servicios.reduce(
    (a, b) => a.calcularCosto() > b.calcularCosto() ? a : b,
  );
  print('\nServicio mas costoso: ${mayor.nombre}');
}
