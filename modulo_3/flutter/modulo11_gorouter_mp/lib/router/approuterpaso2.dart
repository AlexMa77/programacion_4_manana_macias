// lib/router/app_router_paso2.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/pantalla_inicio.dart';
import '../screens/pantalla_aspirantes.dart';
import '../screens/pantalla_detalle.dart';
import '../models/solicitud_admision.dart';

final appRouterPaso2 = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path:    '/',
      builder: (context, state) => const PantallaInicio(),
    ),
    GoRoute(
      path:    '/aspirantes',
      builder: (context, state) => const PantallaAspirantes(),
      routes: [
        // Ruta hija: /aspirantes/:id
        GoRoute(
          path:    ':id',   // relativa â€” ruta completa: /aspirantes/:id
          builder: (context, state) {
            final id       = state.pathParameters['id']!;
            final aspirante = state.extra as SolicitudAdmision?;
            return PantallaDetalle(id: id, aspirante: aspirante);
          },
        ),
        // Ruta hija: /aspirantes/:id/logs
        GoRoute(
          path:    ':id/logs',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return Scaffold(
              appBar: AppBar(title: Text('Logs de $id')),
              body:   Center(child: Text('Logs del aspirante $id')),
            );
          },
        ),
      ],
    ),
  ],
);