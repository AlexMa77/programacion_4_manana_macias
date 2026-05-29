void main() {
  // for con indice
  for (int i = 1; i <= 5; i++) {
    print('Registrando estudiante #$i');
  }

  // for con paso distinto
  for (int avance = 0; avance <= 100; avance += 25) {
    print('Carga de matriculas: $avance%');
  }

  // for decreciente
  for (int dias = 5; dias >= 1; dias--) {
    print('Faltan $dias dias para cerrar matriculas');
  }
}
