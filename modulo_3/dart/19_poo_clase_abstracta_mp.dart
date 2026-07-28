// abstract class define el contrato: que puede hacer cualquier evaluacion
abstract class Evaluacion {
  String get nombre;
  double calcularPuntaje();
  double calcularPorcentaje();

  // Metodo concreto construido sobre la abstraccion
  void describir() {
    print('$nombre | puntaje: ${calcularPuntaje().toStringAsFixed(2)}, '
        'porcentaje: ${calcularPorcentaje().toStringAsFixed(2)}%');
  }
}

class Examen extends Evaluacion {
  final double nota;
  final double total;
  Examen(this.nota, this.total);

  @override
  String get nombre => 'Examen';
  @override
  double calcularPuntaje() => nota;
  @override
  double calcularPorcentaje() => (nota / total) * 100;
}

class Proyecto extends Evaluacion {
  final double investigacion;
  final double exposicion;
  Proyecto(this.investigacion, this.exposicion);

  @override
  String get nombre => 'Proyecto';
  @override
  double calcularPuntaje() => investigacion + exposicion;
  @override
  double calcularPorcentaje() => ((investigacion + exposicion) / 20) * 100;
}

void main() {
  final evaluaciones = <Evaluacion>[Examen(8.5, 10), Proyecto(9, 8)];
  for (final evaluacion in evaluaciones) {
    evaluacion.describir();
  }
}
