// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:modulo10_riverpod_mp/screens/pantalla_busqueda.dart';
import 'package:modulo10_riverpod_mp/screens/pantalla_dashboard.dart';
import 'package:modulo10_riverpod_mp/screens/pantalla_puntajes.dart';
import 'package:modulo10_riverpod_mp/screens/pantalla_aspirantes.dart';

// Importa las pantallas a medida que las crees en cada paso:
// import 'screens/pantalla_aspirantes.dart';
// import 'screens/pantalla_busqueda.dart';
// import 'screens/pantalla_puntajes.dart';
// import 'screens/pantalla_dashboard.dart';

// â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
// â”‚  Cambia este nÃºmero y guarda (Ctrl+S) para navegar entre pasos. â”‚
// â”‚  1  Paso 1  ProviderScope + StateProvider bÃ¡sico (contador)     â”‚
// â”‚  2  Paso 2  NotifierProvider + lista de aspirantes              â”‚
// â”‚  3  Paso 3  Provider derivado + bÃºsqueda filtrada               â”‚
// â”‚  4  Paso 4  AsyncNotifierProvider + mÃ©tricas loading/error      â”‚
// â”‚  5  Paso 5  NavigationBar con dos tabs usando Riverpod          â”‚
// â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
const int paso = 5;

// StateProvider â€” estado simple del Paso 1
final contadorProvider = StateProvider<int>((ref) => 5);

void main() {
  runApp(const ProviderScope(child: AppMonitoreo()));
}

class AppMonitoreo extends StatelessWidget {
  const AppMonitoreo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0D47A1)),
        useMaterial3: true,
      ),
      home: switch (paso) {
        1 => const _Paso1(),
        2 => const PantallaAspirantes(),
        3 => const PantallaBusqueda(),
        4 => const PantallaPuntajes(),
        5 => const PantallaDashboard(),
        // 3 => const PantallaBusqueda(),
        // 4 => const PantallaPuntajes(),
        // 5 => const PantallaDashboard(),
        _ => Scaffold(
            body: Center(child: Text('Paso $paso: crea el widget primero'))),
      },
    );
  }
}

// â”€â”€â”€ Paso 1 â€” vive en main.dart â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
class _Paso1 extends ConsumerWidget {
  const _Paso1();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(contadorProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Aspirantes conectados')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$count', style: Theme.of(context).textTheme.displayLarge),
            const Text('aspirantes activos'),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'add',
            onPressed: () => ref.read(contadorProvider.notifier).state++,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'rem',
            onPressed: () {
              if (ref.read(contadorProvider) > 0) {
                ref.read(contadorProvider.notifier).state--;
              }
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}