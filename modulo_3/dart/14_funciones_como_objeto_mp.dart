int sumarPuntoExtra(int nota) => nota + 1;
int duplicarCreditos(int creditos) => creditos * 2;

void main() {
  // La variable operacion tiene tipo: int Function(int)
  int Function(int) operacion;

  operacion = sumarPuntoExtra;
  print(operacion(8));

  operacion = duplicarCreditos;
  print(operacion(5));

  // Lista de funciones
  final transformaciones = <int Function(int)>[
    sumarPuntoExtra,
    duplicarCreditos,
  ];

  for (final fn in transformaciones) {
    print(fn(10));
  }
}
