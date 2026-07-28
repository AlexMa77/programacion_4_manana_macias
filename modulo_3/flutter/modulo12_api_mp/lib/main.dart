import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:modulo12_api_mp/pantalla_paso1.dart';
import 'package:modulo12_api_mp/pantalla_paso1_users.dart';
import 'package:modulo12_api_mp/pantalla_paso2.dart';
import 'package:modulo12_api_mp/pantalla_paso2_users.dart';
import 'package:modulo12_api_mp/pantalla_paso3.dart';

// â”€â”€ Importa cada pantalla cuando la crees (descomenta la lÃ­nea) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
// import 'pantalla_paso2.dart';   // â† Paso 2
// import 'pantalla_paso3.dart';   // â† Paso 3
// import 'pantalla_paso4.dart';   // â† Paso 4
// import 'pantalla_paso5.dart';   // â† Paso 5

// â”€â”€ Pantalla temporal: muestra "prÃ³ximamente" hasta que crees la pantalla real â”€
class PantallaTemporal extends StatelessWidget {
  final String titulo;
  const PantallaTemporal({required this.titulo, super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(titulo)),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.hourglass_empty, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            '$titulo\nPrÃ³ximamenteâ€¦',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: Colors.grey),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            icon: const Icon(Icons.arrow_back),
            label: const Text('Volver al menÃº'),
            onPressed: () => context.go('/'),
          ),
        ],
      ),
    ),
  );
}

// â”€â”€ Router â€” actualiza cada builder cuando crees la pantalla del paso â”€â”€â”€â”€â”€â”€â”€â”€â”€
final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (_, __) => const PantallaMenu()),

    GoRoute(path: '/paso1', builder: (_, __) => const PantallaPaso1()),
    GoRoute(path: '/paso1users', builder: (_, __) => const PantallaPaso1User()),

    GoRoute(path: '/paso2', builder: (_, __) => const PantallaPaso2()),
    GoRoute(path: '/paso2users', builder: (_, __) => const PantallaPaso2Users()),

    GoRoute(path: '/paso3', builder: (_, __) => const PantallaPaso3()),

    // Paso 4 â†’ reemplaza por PantallaPaso4()
    GoRoute(path: '/paso4', builder: (_, __) => const PantallaTemporal(titulo: 'Paso 4 Â· Errores tipados')),

    // Paso 5 â†’ reemplaza por PantallaPaso5()
    GoRoute(path: '/paso5', builder: (_, __) => const PantallaTemporal(titulo: 'Paso 5 Â· Arquitectura completa')),
  ],
);

void main() => runApp(const ProviderScope(child: AppHttp()));

class AppHttp extends StatelessWidget {
  const AppHttp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routerConfig: _router,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      useMaterial3: true,
    ),
  );
}

// â”€â”€ MenÃº principal â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
class PantallaMenu extends StatelessWidget {
  const PantallaMenu({super.key});

  @override
  Widget build(BuildContext context) {
    const pasos = [
      _PasoInfo(
        ruta: '/paso1',
        titulo: 'Paso 1',
        subtitulo: 'FutureBuilder crudo',
        detalle: 'http.get() + FutureBuilder Â· JSONPlaceholder',
        icono: Icons.network_ping,
        color: Colors.blue,
      ),
       _PasoInfo(
        ruta: '/paso1users',
        titulo: 'Paso 1 Users',
        subtitulo: 'Mostrar usuarios',
        detalle: 'http.get() + FutureBuilder Â· JSONPlaceholder',
        icono: Icons.network_ping,
        color: Color.fromARGB(255, 255, 143, 158),
      ),
      _PasoInfo(
        ruta: '/paso2',
        titulo: 'Paso 2',
        subtitulo: 'DTO simple',
        detalle: 'TodoDto.fromJson Â· lista de tareas',
        icono: Icons.data_object,
        color: Colors.green,
      ),
      _PasoInfo(
        ruta: '/paso2users',
        titulo: 'Paso 2 Users',
        subtitulo: 'Mostrar usuarios',
        detalle: 'UserDto.fromJson Â· lista de usuarios',
        icono: Icons.data_object,
        color: Color.fromARGB(255, 241, 204, 134),
      ),
      _PasoInfo(
        ruta: '/paso3',
        titulo: 'Paso 3',
        subtitulo: 'API real + modelo de dominio',
        detalle: 'ProductoDto Â· toDomain() Â· API Platzi',
        icono: Icons.shopping_bag,
        color: Colors.orange,
      ),
      _PasoInfo(
        ruta: '/paso4',
        titulo: 'Paso 4',
        subtitulo: 'Errores tipados',
        detalle: 'sealed ApiError Â· Result<T>',
        icono: Icons.error_outline,
        color: Colors.red,
      ),
      _PasoInfo(
        ruta: '/paso5',
        titulo: 'Paso 5',
        subtitulo: 'Arquitectura completa',
        detalle: 'HttpClient Â· Repository Â· Riverpod Notifier',
        icono: Icons.architecture,
        color: Colors.purple,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('MÃ³dulo 12 â€” API REST'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: pasos.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, i) {
          final p = pasos[i];
          return Card(
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: CircleAvatar(
                backgroundColor: p.color,
                radius: 24,
                child: Icon(p.icono, color: Colors.white),
              ),
              title: Text(
                '${p.titulo} Â· ${p.subtitulo}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  p.detalle,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.go(p.ruta),
            ),
          );
        },
      ),
    );
  }
}

class _PasoInfo {
  final String ruta;
  final String titulo;
  final String subtitulo;
  final String detalle;
  final IconData icono;
  final Color color;
  const _PasoInfo({
    required this.ruta,
    required this.titulo,
    required this.subtitulo,
    required this.detalle,
    required this.icono,
    required this.color,
  });
}