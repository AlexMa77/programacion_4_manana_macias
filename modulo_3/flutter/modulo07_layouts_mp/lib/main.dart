// lib/main.dart
import 'package:flutter/material.dart';
import 'widgets/tarjeta_log.dart';
import 'widgets/fila_estado.dart';
import 'widgets/avatar_badge.dart';
import 'widgets/customized_sized_box.dart';

// â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
// â”‚  Cambia este nÃºmero y guarda (Ctrl+S) para navegar entre pasos. â”‚
// â”‚  1  Paso 1  Container â€” decoraciÃ³n y espaciado                  â”‚
// â”‚  2  Paso 2  Column â€” TarjetaLog                                 â”‚
// â”‚  3  Paso 3  Row + Expanded + Spacer â€” FilaEstado                â”‚
// â”‚  4  Paso 4  Stack + Positioned â€” AvatarBadge                   â”‚
// â”‚  5  Paso 5  SizedBox, Padding, Align, Wrap                      â”‚
// â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
const int paso = 5;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: switch (paso) {
    1 => _paso1(),
    2 => Scaffold(
      body: ListView(
        children: [
          TarjetaLog(
              nivel: 'ERROR',
              componente: 'admisiones',
              mensaje: 'Formulario de admisión incompleto – revisar datos del aspirante',
              timestamp: DateTime.now()),
          TarjetaLog(
              nivel: 'WARN',
              componente: 'becas',
              mensaje: 'Cupos de beca disponibles: 2 / 10',
              timestamp: DateTime.now().subtract(const Duration(minutes: 2))),
          TarjetaLog(
              nivel: 'INFO',
              componente: 'matrícula',
              mensaje: 'Proceso de matrícula completado exitosamente',
              timestamp: DateTime.now().subtract(const Duration(minutes: 5))),
          TarjetaLog(
              nivel: 'DEBUG',
              componente: 'sistema',
              mensaje: 'GET /api/aspirantes → 200 OK (38ms)',
              timestamp: DateTime.now().subtract(const Duration(minutes: 8))),
        ],
      ),
    ),
    3 => const Scaffold(
      body: Column(
        children: [
          FilaEstado(nombre: 'Juan Pérez',    detalle: 'Cód: 2024-001 · Activo',        activo: true),
          Divider(height: 1),
          FilaEstado(nombre: 'María Gómez',   detalle: 'Cód: 2024-002 · Activo',        activo: true),
          Divider(height: 1),
          FilaEstado(nombre: 'Carlos López',  detalle: 'Cód: 2024-003 · Baja temporal',  activo: false),
          Divider(height: 1),
          FilaEstado(nombre: 'Sofía Vega',
                     detalle: 'Cód: 2024-004 · Activo', activo: true),
        ],
      ),
    ),
    4 => const Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AvatarBadge(nombre: 'Juan P.', alertas: 2,  activo: true),
            SizedBox(width: 24),
            AvatarBadge(nombre: 'María G.', alertas: 0,  activo: true),
            SizedBox(width: 24),
            AvatarBadge(nombre: 'Carlos L.', alertas: 0,  activo: false),
            SizedBox(width: 24),
            AvatarBadge(nombre: 'Sofía V.', alertas: 11, activo: true),
          ],
        ),
      ),
    ),
    5 => const CustomizedSizedBox(),
    _ => Scaffold(body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

Widget _paso1() => Scaffold(
  body: Center(
    child: Container(
      width:   220,
      height:  80,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color:        Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(12),
        border:       Border.all(color: Colors.indigo, width: 1.5),
        boxShadow: [
          BoxShadow(
            color:      Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset:     const Offset(0, 2),
          ),
        ],
      ),
      child: const Text('Aspirante: Juan Pérez',
          style: TextStyle(fontWeight: FontWeight.bold)),
    ),
  ),
);
