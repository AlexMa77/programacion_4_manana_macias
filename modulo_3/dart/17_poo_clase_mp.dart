class Estudiante {
  // 1. Propiedades
  final String id;
  final String nombre;
  String curso;
  bool _matriculado = false;

  // 2. Constructor nombrado con parametros nombrados
  Estudiante({
    required this.id,
    required this.nombre,
    required this.curso,
  });

  // 3. Getter: propiedad derivada, solo lectura
  bool get matriculado => _matriculado;
  String get estado => _matriculado ? 'matriculado' : 'pendiente';

  // 4. Setter: escritura controlada
  set estadoMatricula(bool valor) {
    _matriculado = valor;
    print('$nombre: ${valor ? "matriculado" : "retirado"}');
  }

  // 5. Metodos
  void matricular() {
    _matriculado = true;
    print('$nombre matriculado en $curso');
  }

  void retirar() {
    _matriculado = false;
    print('$nombre retirado del curso');
  }

  String resumen() => 'ID: $id | Nombre: $nombre | Curso: $curso | Estado: $estado';

  // 6. toString
  @override
  String toString() => 'Estudiante($nombre, $curso, $estado)';
}

void main() {
  final estudiante = Estudiante(
    id: 'EST-001',
    nombre: 'Ana Lopez',
    curso: 'Segundo Bachillerato',
  );

  estudiante.matricular();
  print(estudiante.estado);
  print(estudiante.resumen());
  print(estudiante);

  estudiante.estadoMatricula = false;
  print(estudiante.matriculado);
}
