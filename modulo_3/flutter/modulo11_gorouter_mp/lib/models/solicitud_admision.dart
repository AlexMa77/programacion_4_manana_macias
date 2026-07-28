class SolicitudAdmision {
  final String id;
  final String nombre;
  final String documento;
  final int    edad;
  final bool   beca;

  const SolicitudAdmision({
    required this.id,
    required this.nombre,
    required this.documento,
    required this.edad,
    required this.beca,
  });
}

// Lista simulada â€” en una app real vendrÃ­a de un provider
const aspirantesSimulados = [
  SolicitudAdmision(id: '1', nombre: 'Juan Perez', documento: '0923456781',   edad: 22,   beca: true),
  SolicitudAdmision(id: '2', nombre: 'Maria Gomez',  documento: '0934567812',   edad: 22,   beca: true),
  SolicitudAdmision(id: '3', nombre: 'Carlos Lopez', documento: '0945678123',   edad: 2222, beca: false),
];