// lib/router/app_router.dart
import 'package:go_router/go_router.dart';
import '../screens/pantalla_inicio.dart';
import '../screens/pantalla_aspirantes.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,  // imprime cada navegaciÃ³n en la consola
  routes: [
    GoRoute(
      path:    '/',
      name:    'inicio',
      builder: (context, state) => const PantallaInicio(),
    ),
    GoRoute(
      path:    '/aspirantes',
      name:    'aspirantes',
      builder: (context, state) => const PantallaAspirantes(),
    ),
  ],
);