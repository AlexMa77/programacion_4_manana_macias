// Clase base: comportamiento y datos comunes
class PersonaInstitucion {
  final String nombre;
  final int edad;

  PersonaInstitucion(this.nombre, this.edad);

  // Metodo que cada subclase especializa
  String rol() => 'Miembro de la institucion';

  // Metodo comun
  void presentarse() {
    print('Soy $nombre, tengo $edad anios y mi rol es: ${rol()}');
  }
}

// HERENCIA: Estudiante y Docente reutilizan PersonaInstitucion
class EstudianteHerencia extends PersonaInstitucion {
  EstudianteHerencia(super.nombre, super.edad);

  @override
  String rol() => 'Estudiante';

  void entregarTarea() => print('$nombre entrega una tarea');
}

class Docente extends PersonaInstitucion {
  Docente(super.nombre, super.edad);

  @override
  String rol() => 'Docente';

  void calificar() => print('$nombre califica evaluaciones');
}

void main() {
  final estudiante = EstudianteHerencia('Carlos', 15);
  final docente = Docente('Lic. Mora', 38);

  estudiante.presentarse();
  docente.presentarse();

  estudiante.entregarTarea();
  docente.calificar();
}
