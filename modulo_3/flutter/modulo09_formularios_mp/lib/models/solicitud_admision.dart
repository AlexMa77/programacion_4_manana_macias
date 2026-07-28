// lib/models/solicitud_admision.dart
class SolicitudAdmision {
  final String id;
  final String nombre;
  final String documento;
  final int    edad;
  final String usuario;
  final String so;
  final bool   beca;
  bool         favorito;    // mutable â€” puede cambiar sin recrear el objeto

  SolicitudAdmision({
    required this.id,
    required this.nombre,
    required this.documento,
    required this.edad,
    required this.usuario,
    required this.so,
    required this.beca,
    this.favorito = false,
  });

  
}

class ServiciosWeb {
  final String id1;
  final String nombre;
  final String documento;
  final int    edad;
  final String usuario;

  bool         favorito;    // mutable â€” puede cambiar sin recrear el objeto

  ServiciosWeb({
    required this.id1,
    required this.nombre,
    required this.documento,
    required this.edad,
    required this.usuario,
    this.favorito = false,
  });

  
}