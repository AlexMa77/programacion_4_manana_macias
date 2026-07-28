// lib/router/app_router_paso4.dart
import 'package:go_router/go_router.dart';
import 'package:modulo11_gorouter_mp/screens/pantalla_dashboard.dart';
import 'package:modulo11_gorouter_mp/screens/scaffold_con_nav.dart';
import '../screens/pantalla_aspirantes.dart';
import '../screens/pantalla_detalle.dart';
import '../screens/pantalla_puntajes.dart';
import '../screens/pantalla_ajustes.dart';
import '../models/solicitud_admision.dart';

final appRouterPaso4 = GoRouter(
  initialLocation: '/aspirantes',
  debugLogDiagnostics: true,
  routes: [
    // ShellRoute â€” mantiene ScaffoldConNav vivo entre rutas hijas
    ShellRoute(
      builder: (context, state, child) => ScaffoldConNav(child: child),
      routes: [
        GoRoute(
          path:    '/aspirantes',
          builder: (_, __) => const PantallaAspirantes(),
          routes: [
            GoRoute(
              path:    ':id',
              builder: (context, state) {
                final id       = state.pathParameters['id']!;
                final aspirante = state.extra as SolicitudAdmision?;
                return PantallaDetalle(id: id, aspirante: aspirante);
              },
            ),
          ],
        ),
        GoRoute(
          path:    '/puntajes',
          builder: (_, __) => const PantallaPuntajes(),
        ),
        GoRoute(
          path:    '/ajustes',
          builder: (_, __) => const PantallaAjustes(),
        ),
        GoRoute(
          path:    '/dashboard',
          builder: (_, __) => const PantallaDashboard(),
        ),
      ],
    ),
  ],
);