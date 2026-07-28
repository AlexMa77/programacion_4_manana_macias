// lib/models/puntaje_aspirante.dart
class PuntajeAspirante {
  final String aspirante;
  final double matematicas;
  final double fisica;
  final int    asistencia;
  final double lenguaje;

  const PuntajeAspirante({
    required this.aspirante,
    required this.matematicas,
    required this.fisica,
    required this.asistencia,
    required this.lenguaje,
  });
}