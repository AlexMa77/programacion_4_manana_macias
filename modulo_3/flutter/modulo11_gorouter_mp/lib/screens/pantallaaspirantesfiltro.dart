// lib/screens/pantalla_aspirantes_filtro.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/solicitud_admision.dart';

class PantallaAspirantesFiltro extends StatelessWidget {
  final bool soloBecados;
  const PantallaAspirantesFiltro({super.key, this.soloBecados = false});

  @override
  Widget build(BuildContext context) {
    final filtrados = soloBecados
        ? aspirantesSimulados.where((s) => s.beca).toList()
        : aspirantesSimulados;

    return Scaffold(
      appBar: AppBar(
        title:   Text('Aspirantes${soloBecados ? ' (Beca)' : ''}'),
        actions: [
          // Toggle filtro Beca â€” cambia la URL con query param
          IconButton(
            icon:    Icon(soloBecados ? Icons.lock : Icons.lock_open),
            tooltip: soloBecados ? 'Ver todos' : 'Solo Beca',
            onPressed: () => soloBecados
                ? context.go('/aspirantes')
                : context.go('/aspirantes?soloBecados=true'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount:   filtrados.length,
        itemBuilder: (context, i) {
          final s = filtrados[i];
          return ListTile(
            leading: Icon(Icons.dns, color: s.beca ? Colors.green : Colors.grey),
            title:   Text(s.nombre),
            subtitle: Text(s.documento),
            onTap: () => context.push(
              '/aspirantes/${s.id}',
              extra: s,   // pasa el objeto completo
            ),
          );
        },
      ),
    );
  }
}