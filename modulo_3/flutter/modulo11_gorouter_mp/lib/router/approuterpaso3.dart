// lib/router/app_router_paso3.dart
import 'package:go_router/go_router.dart';
import 'package:modulo11_gorouter_mp/screens/pantallaaspirantesfiltro.dart';
import '../screens/pantalla_inicio.dart';
import '../screens/pantalla_detalle.dart';
import '../models/solicitud_admision.dart';

final appRouterPaso3 = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path:    '/',
      builder: (context, state) => const PantallaInicio(),
    ),
    GoRoute(
      path:    '/aspirantes',
      builder: (context, state) {
        // Query parameters â€” /aspirantes?soloBecados=true
        final soloBecados = state.uri.queryParameters['soloBecados'] == 'true';
        return PantallaAspirantesFiltro(soloBecados: soloBecados);
      },
    ),
    GoRoute(
      path:    '/aspirantes/:id',
      builder: (context, state) {
        final id       = state.pathParameters['id']!;
        final aspirante = state.extra as SolicitudAdmision?;
        return PantallaDetalle(id: id, aspirante: aspirante);
      },
    ),
  ],
);