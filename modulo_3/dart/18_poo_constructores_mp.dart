class AulaVirtual {
  final String nombre;
  final String codigo;
  final int capacidad;
  final bool activa;

  // Constructor principal
  AulaVirtual({
    required this.nombre,
    required this.codigo,
    required this.capacidad,
    this.activa = true,
  });

  // Constructor nombrado con configuracion predefinida
  AulaVirtual.laboratorio()
      : nombre = 'Laboratorio de Computacion',
        codigo = 'LAB-001',
        capacidad = 25,
        activa = true;

  AulaVirtual.auditorio({required this.nombre, required this.codigo})
      : capacidad = 120,
        activa = true;

  // Constructor factory con logica de creacion
  factory AulaVirtual.desdeCodigo(String codigoCompleto) {
    final partes = codigoCompleto.split('-');
    return AulaVirtual(
      nombre: 'Aula ${partes.last}',
      codigo: codigoCompleto,
      capacidad: codigoCompleto.startsWith('LAB') ? 25 : 35,
      activa: true,
    );
  }

  @override
  String toString() => '$codigo | $nombre | Capacidad: $capacidad';
}

void main() {
  final a1 = AulaVirtual(nombre: 'Aula 101', codigo: 'AULA-101', capacidad: 35);
  final a2 = AulaVirtual.laboratorio();
  final a3 = AulaVirtual.auditorio(nombre: 'Auditorio Principal', codigo: 'AUD-001');
  final a4 = AulaVirtual.desdeCodigo('AULA-205');

  print(a1);
  print(a2);
  print(a3);
  print(a4);
}
