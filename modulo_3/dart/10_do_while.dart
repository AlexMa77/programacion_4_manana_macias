void main() {

  int paquetes = 0;
  int buffer   = 1024;  

  while (buffer > 0) {
    final tamano = buffer > 256 ? 256 : buffer;
    paquetes++;
    buffer -= tamano;
    print('Paquete $paquetes: $tamano bytes (restante: $buffer)');
  }


  int reintentos = 0;
  bool conexionEstablecida = false;

  do {
    reintentos++;
    print('Intento de conexión #$reintentos...');

    if (reintentos == 3) conexionEstablecida = true;
  } while (!conexionEstablecida && reintentos < 5);

  print(conexionEstablecida
      ? 'Conectado tras $reintentos intentos'
      : 'No se pudo conectar');
}