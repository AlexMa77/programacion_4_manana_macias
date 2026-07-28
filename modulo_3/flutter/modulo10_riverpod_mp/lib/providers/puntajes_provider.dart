// lib/providers/puntajes_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/puntaje_aspirante.dart';

class PuntajesNotifier extends AsyncNotifier<List<PuntajeAspirante>> {
  // build() puede ser async â€” es la carga inicial
  @override
  Future<List<PuntajeAspirante>> build() => _fetch();

  Future<List<PuntajeAspirante>> _fetch() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return const [
      PuntajeAspirante(aspirante:'Juan Perez', matematicas:45.2, fisica:62.1, asistencia:230, lenguaje: 80),
      PuntajeAspirante(aspirante:'Maria Gomez',  matematicas:88.1, fisica:91.2, asistencia:80, lenguaje: 120),
      PuntajeAspirante(aspirante:'Carlos Lopez', matematicas:22.4, fisica:41.0, asistencia:50, lenguaje: 60),
      PuntajeAspirante(aspirante:'Luis Franco', matematicas:20.0, fisica:12.0, asistencia:20, lenguaje: 40),
      PuntajeAspirante(aspirante:'Sofia Vega',  matematicas:5.0, fisica:9.0, asistencia:5, lenguaje: 20),
    ];
  }

  Future<void> recargar() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetch);
  }
}

final puntajesProvider =
    AsyncNotifierProvider<PuntajesNotifier, List<PuntajeAspirante>>(
  PuntajesNotifier.new,
);