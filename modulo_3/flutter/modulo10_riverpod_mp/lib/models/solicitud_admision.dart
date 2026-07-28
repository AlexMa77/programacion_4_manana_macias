// lib/models/solicitud_admision.dart
class SolicitudAdmision {
  final String id;
  final String nombre;
  final String documento;
  final int    edad;
  final bool   beca;
  bool         favorito;

  SolicitudAdmision({
    required this.id,
    required this.nombre,
    required this.documento,
    required this.edad,
    required this.beca,
    this.favorito = false,
  });
}