// lib/main.dart
import 'package:flutter/material.dart';
import 'package:modulo08_material3_mp/screens/catalogo_botones.dart';
import 'package:modulo08_material3_mp/screens/pantalla_appbar.dart';
import 'package:modulo08_material3_mp/screens/pantalla_dialogs.dart';
import 'package:modulo08_material3_mp/screens/pantalla_navegacion.dart';
import 'package:modulo08_material3_mp/screens/pantalla_tema.dart';

// â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
// â”‚  Cambia este nÃºmero y guarda (Ctrl+S) para navegar entre pasos. â”‚
// â”‚  1  Paso 1  ThemeData + Scaffold bÃ¡sico                         â”‚
// â”‚  2  Paso 2  Modo oscuro â€” ThemeMode dinÃ¡mico                    â”‚
// â”‚  3  Paso 3  AppBar variantes y SliverAppBar                     â”‚
// â”‚  4  Paso 4  Botones Material 3                                  â”‚
// â”‚  5  Paso 5  NavigationBar con 4 pestaÃ±as                        â”‚
// â”‚  6  Paso 6  SnackBar y AlertDialog                              â”‚
// â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
const int paso = 6;

void main() => runApp(const AppMonitoreo());

class AppMonitoreo extends StatefulWidget {
  const AppMonitoreo({super.key});
  @override
  State<AppMonitoreo> createState() => _AppMonitoreoState();
}

class _AppMonitoreoState extends State<AppMonitoreo> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    const seedColor = Color(0xFF1565C0);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: seedColor, brightness: Brightness.light),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: seedColor, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: switch (paso) {
        1 => const _Paso1(),
        2 => PantallaTema(
       themeMode: _themeMode,
       onToggle:  (mode) => setState(() => _themeMode = mode),
     ),
     3 => const PantallaAppBar(),
     4 => const CatalogoBotones(),
     5 => const PantallaNavegacion(),
     6 => const PantallaDialogs(),
        _ => Scaffold(
            body: Center(child: Text('Paso $paso: crea el widget primero'))),
      },
      
    );
    
  }
}

// â”€â”€â”€ Paso 1 â€” vive en main.dart â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
class _Paso1 extends StatelessWidget {
  const _Paso1();

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Sistema de Monitoreo'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: () {}),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.dns, size: 64, color: cs.primary),
            const SizedBox(height: 16),
            Text(
              'Aspirante web-01',
              style: text.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '0923456781 Â· Ingenieria',
              style: text.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () {},
              icon:  const Icon(Icons.terminal),
              label: const Text('Conectar SSH'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}