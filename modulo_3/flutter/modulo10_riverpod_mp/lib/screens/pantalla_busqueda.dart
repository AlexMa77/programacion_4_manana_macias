// lib/screens/pantalla_busqueda.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/aspirantes_provider.dart';

class PantallaBusqueda extends ConsumerWidget {
  const PantallaBusqueda({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aspirantes = ref.watch(aspirantesFiltradosProvider);
    final busqueda   = ref.watch(busquedaProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Buscar aspirantes')),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: SearchBar(
            hintText: 'Buscar por nombre o Documento...',
            leading:  const Icon(Icons.search),
            trailing: busqueda.isNotEmpty
                ? [IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () =>
                        ref.read(busquedaProvider.notifier).state = '',
                  )]
                : null,
            onChanged: (v) =>
                ref.read(busquedaProvider.notifier).state = v,
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),
        Expanded(
          child: aspirantes.isEmpty
              ? const Center(child: Text('Sin resultados'))
              : ListView.builder(
                  itemCount:   aspirantes.length,
                  itemBuilder: (_, i) => ListTile(
                    leading: const Icon(Icons.dns),
                    title:    Text(aspirantes[i].nombre),
                    subtitle: Text(aspirantes[i].documento),
                  ),
                ),
        ),
      ]),
    );
  }
}