import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/puntaje_aspirante.dart';
import '../providers/puntajes_provider.dart';

class PantallaPuntajes extends ConsumerWidget {
  const PantallaPuntajes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final puntajesAsync = ref.watch(puntajesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Puntajes de aspirantes'),
        actions: [
          IconButton(
            icon:    const Icon(Icons.refresh),
            tooltip: 'Recargar',
            onPressed: () =>
                ref.read(puntajesProvider.notifier).recargar(),
          ),
        ],
      ),
      body: puntajesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 8),
              Text('Error: $e'),
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: () =>
                    ref.read(puntajesProvider.notifier).recargar(),
                icon:  const Icon(Icons.refresh),
                label: const Text('Reintentar'),
              ),
            ],
          ),
        ),
        data: (puntajes) => ListView.builder(
          padding:     const EdgeInsets.all(12),
          itemCount:   puntajes.length,
          itemBuilder: (_, i) => _TarjetaPuntaje(puntaje: puntajes[i]),
        ),
      ),
    );
  }
}

class _TarjetaPuntaje extends StatelessWidget {
  final PuntajeAspirante puntaje;
  const _TarjetaPuntaje({required this.puntaje});

  @override
  Widget build(BuildContext context) {
    final cs         = Theme.of(context).colorScheme;
    final matematicasCritica = puntaje.matematicas > 85;
    final fisicaCritica = puntaje.fisica > 90;
    final lenguajeCritica = puntaje.lenguaje > 90; 
    final esCritico  = matematicasCritica || fisicaCritica || lenguajeCritica;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      color:  esCritico ? cs.errorContainer : null,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.dns, color: esCritico ? cs.error : cs.primary, size: 18),
                const SizedBox(width: 8),
                Text(
                  puntaje.aspirante,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  '${puntaje.asistencia} dias',
                  style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Promedio General: ${puntaje.lenguaje.toStringAsFixed(0)} puntos',
              style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant),
            ),
            const SizedBox(height: 10),
            _Barra('Matematicas', puntaje.matematicas, matematicasCritica),
            const SizedBox(height: 4),
            _Barra('Fisica', puntaje.fisica, fisicaCritica),
            const SizedBox(height: 4),
            _Barra('Lenguaje', puntaje.lenguaje, lenguajeCritica),
          ],
        ),
      ),
    );
  }
}

class _Barra extends StatelessWidget {
  final String label;
  final double valor;
  final bool   critica;
  const _Barra(this.label, this.valor, this.critica);

  @override
  Widget build(BuildContext context) {
    final color = critica ? Colors.red : Colors.green;
    return Row(children: [
      SizedBox(width: 36, child: Text(label,
          style: const TextStyle(fontSize: 12))),
      Expanded(
        child: LinearProgressIndicator(
          value:           valor / 100,
          backgroundColor: Colors.grey.shade200,
          valueColor:      AlwaysStoppedAnimation(color),
        ),
      ),
      const SizedBox(width: 8),
      Text('${valor.toStringAsFixed(1)}%',
          style: TextStyle(fontSize: 12, color: color,
              fontWeight: FontWeight.w600)),
    ]);
  }
}