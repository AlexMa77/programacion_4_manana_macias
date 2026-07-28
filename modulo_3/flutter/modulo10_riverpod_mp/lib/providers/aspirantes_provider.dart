// lib/providers/aspirantes_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart' show StateProvider;
import '../models/solicitud_admision.dart';

// NotifierProvider â€” estado complejo con mÃ©todos propios
class AspirantesNotifier extends Notifier<List<SolicitudAdmision>> {
  @override
  List<SolicitudAdmision> build() => [
    SolicitudAdmision(id:'1', nombre:'Juan Perez', documento:'0923456781', edad:22,   beca:true,  favorito:true),
    SolicitudAdmision(id:'2', nombre:'Maria Gomez',  documento:'0934567812', edad:22,   beca:true),
    SolicitudAdmision(id:'3', nombre:'Carlos Lopez', documento:'0945678123', edad:21, beca:false),
    SolicitudAdmision(id:'4', nombre:'Sofia Vega',   documento:'0956789234', edad:19,   beca:false)
  ];

  void toggleFavorito(String id) {
    state = state.map((s) =>
        s.id == id
          ? SolicitudAdmision(id:s.id, nombre:s.nombre, documento:s.documento,
                        edad:s.edad, beca:s.beca,
                        favorito:!s.favorito)
          : s
    ).toList();
  }

  void eliminar(String id) {
    state = state.where((s) => s.id != id).toList();
  }

  void agregar(SolicitudAdmision aspirante) {
    state = [...state, aspirante];
  }
}

final aspirantesProvider =
    NotifierProvider<AspirantesNotifier, List<SolicitudAdmision>>(
  AspirantesNotifier.new,
);

// Filtro de bÃºsqueda â€” estado primitivo
final busquedaProvider = StateProvider<String>((ref) => '');

// Provider DERIVADO â€” se recalcula cuando cualquiera de sus dependencias cambia
final aspirantesFiltradosProvider = Provider<List<SolicitudAdmision>>((ref) {
  final todos    = ref.watch(aspirantesProvider);
  final busqueda = ref.watch(busquedaProvider);

  if (busqueda.isEmpty) return todos;

  final q = busqueda.toLowerCase();
  return todos.where((s) =>
      s.nombre.toLowerCase().contains(q) || s.documento.contains(q)
  ).toList();
  // Cuando 'aspirantesProvider' o 'busquedaProvider' cambian,
  // este provider se recalcula automÃ¡ticamente.
});