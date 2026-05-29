void main() {
  // while: comprueba la condicion antes de ejecutar
  int estudiantesProcesados = 0;
  int pendientes = 12;

  while (pendientes > 0) {
    final lote = pendientes > 4 ? 4 : pendientes;
    estudiantesProcesados += lote;
    pendientes -= lote;
    print('Procesados: $lote | Total: $estudiantesProcesados | Pendientes: $pendientes');
  }

  // do-while: ejecuta al menos una vez
  int intentos = 0;
  bool conexionAcademica = false;

  do {
    intentos++;
    print('Intento de conexion al sistema academico #$intentos');
    if (intentos == 3) conexionAcademica = true;
  } while (!conexionAcademica && intentos < 5);

  print(conexionAcademica
      ? 'Sistema academico conectado tras $intentos intentos'
      : 'No se pudo conectar al sistema academico');
}
