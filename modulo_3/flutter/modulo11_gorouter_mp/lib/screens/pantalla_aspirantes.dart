import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modulo11_gorouter_mp/models/solicitud_admision.dart';

class PantallaAspirantes extends StatelessWidget {
  const PantallaAspirantes({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final aspirantes = aspirantesSimulados;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Aspirantes'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/');
            }
          },
        ),
      ),
      body: ListView.builder(
        itemCount:   aspirantes.length,
        itemBuilder: (context, i) => ListTile(
          leading: const Icon(Icons.dns),
          title:   Text(aspirantes[i].nombre),
          onTap: () {
            context.push('/aspirantes/${aspirantes[i].id}', extra: aspirantes[i]);
            
          },
        ),
      ),
    );
  }
}