// lib/router/app_router_paso5.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:modulo11_gorouter_mp/screens/pantalla_dashboard.dart';
import '../providers/auth_provider.dart';
import '../screens/scaffold_con_nav.dart';
import '../screens/pantalla_aspirantes.dart';
import '../screens/pantalla_detalle.dart';
import '../screens/pantalla_puntajes.dart';
import '../screens/pantalla_ajustes.dart';
import '../screens/pantalla_login.dart';
import '../models/solicitud_admision.dart';

// FunciÃ³n que crea el router con acceso al WidgetRef (para el guard)
GoRouter appRouterPaso5(WidgetRef ref) => GoRouter(
  initialLocation: '/aspirantes',
  debugLogDiagnostics: true,
  redirect: (context, state) {
    final authState     = ref.read(authProvider);
    final autenticado   = authState is Autenticado;
    final enLogin       = state.matchedLocation == '/login';

    // No autenticado y no estÃ¡ en /login â†’ ir al login
    if (!autenticado && !enLogin) return '/login';
    // Autenticado y estÃ¡ en /login â†’ ir a la app
    if (autenticado && enLogin)   return '/aspirantes';
    // Sin redirecciÃ³n
    return null;
  },
  routes: [
    ShellRoute(
      builder: (context, state, child) => ScaffoldConNav(child: child),
      routes: [
        GoRoute(
          path:    '/aspirantes',
          builder: (_, __) => const PantallaAspirantes(),
          routes: [
            GoRoute(
              path:    ':id',
              builder: (context, state) => PantallaDetalle(
                id:       state.pathParameters['id']!,
                aspirante: state.extra as SolicitudAdmision?,
              ),
            ),
          ],
        ),
        GoRoute(path: '/puntajes', builder: (_, __) => const PantallaPuntajes()),
        GoRoute(path: '/ajustes',  builder: (_, __) => const PantallaAjustes()),
        GoRoute(
          path:    '/dashboard',
          builder: (_, __) => const PantallaDashboard(),
        ),
      ],
    ),
    GoRoute(
      path:    '/login',
      builder: (_, __) => const PantallaLogin(),
    ),
  ],
);