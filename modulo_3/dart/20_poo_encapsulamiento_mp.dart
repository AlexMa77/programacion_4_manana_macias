class CuentaEstudiante {
  final String estudiante;
  double _saldoPendiente;

  CuentaEstudiante(this.estudiante, double saldoInicial)
      : _saldoPendiente = saldoInicial;

  // Getter: lectura permitida, escritura no
  double get saldoPendiente => _saldoPendiente;

  // Caminos controlados para modificar el saldo
  void registrarPago(double monto) {
    if (monto <= 0) throw ArgumentError('El monto debe ser positivo');
    if (monto > _saldoPendiente) throw StateError('El pago supera el saldo pendiente');
    _saldoPendiente -= monto;
    print('Pago de \$$monto. Saldo pendiente: \$$_saldoPendiente');
  }

  void generarCargo(double monto) {
    if (monto <= 0) throw ArgumentError('El monto debe ser positivo');
    _saldoPendiente += monto;
    print('Cargo de \$$monto. Saldo pendiente: \$$_saldoPendiente');
  }
}

void main() {
  final cuenta = CuentaEstudiante('Ana Lopez', 300.0);

  cuenta.registrarPago(100.0);
  cuenta.generarCargo(50.0);
  print(cuenta.saldoPendiente);

  // cuenta._saldoPendiente = 0; // ERROR: privado
}
