// lib/screens/pantalla_aspirantes.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modulo10_riverpod_mp/models/solicitud_admision.dart';
import '../providers/aspirantes_provider.dart';

class PantallaAspirantes extends ConsumerWidget {
  const PantallaAspirantes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aspirantes = ref.watch(aspirantesProvider);
    final cs         = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Aspirantes (${aspirantes.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: aspirantes.isEmpty
          ? const Center(child: Text('Sin aspirantes'))
          : ListView.separated(
              itemCount:        aspirantes.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (context, i) {
                final s = aspirantes[i];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: s.beca
                        ? Colors.green.shade50
                        : Colors.grey.shade100,
                    child: Icon(Icons.dns,
                        color: s.beca ? Colors.green : Colors.grey),
                  ),
                  title:    Text(s.nombre,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text('${s.documento}:${s.edad}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          s.favorito ? Icons.star : Icons.star_border,
                          color: s.favorito ? Colors.amber : null,
                        ),
                        onPressed: () => ref
                            .read(aspirantesProvider.notifier)
                            .toggleFavorito(s.id),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline,
                            color: Colors.red),
                        onPressed: () => ref
                            .read(aspirantesProvider.notifier)
                            .eliminar(s.id),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final id = DateTime.now().millisecondsSinceEpoch.toString();
          ref.read(aspirantesProvider.notifier).agregar(
            SolicitudAdmision(
              id:     id,
              nombre: 'nuevo-srv-$id',
              documento:     '192.168.0.${aspirantes.length + 1}',
              edad: 22,
              beca:    true,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}