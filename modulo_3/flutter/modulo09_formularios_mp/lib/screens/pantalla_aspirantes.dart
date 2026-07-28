// lib/screens/pantalla_aspirantes.dart
import 'package:flutter/material.dart';
import 'package:modulo09_formularios_mp/widgets/tarjetaaspirantegrid.dart';
import '../models/solicitud_admision.dart';
import '../widgets/fila_aspirante.dart';
import '../widgets/tarjeta_aspirante_grid.dart' hide TarjetaAspiranteGrid;

class PantallaAspirantes extends StatefulWidget {
  const PantallaAspirantes({super.key});
  @override
  State<PantallaAspirantes> createState() => _PantallaAspirantesState();
}

class _PantallaAspirantesState extends State<PantallaAspirantes> {
  final _aspirantes = [
    SolicitudAdmision(id:'1', nombre:'Juan Perez',  documento:'0923456781',   edad:22,   usuario:'jperez',   so:'Ingenieria', beca:true,  favorito:true),
    SolicitudAdmision(id:'2', nombre:'Maria Gomez',   documento:'0934567812',   edad:22,   usuario:'mgomez', so:'Medicina',    beca:true),
    SolicitudAdmision(id:'3', nombre:'Carlos Lopez',  documento:'0945678123',   edad:2222, usuario:'clopez',   so:'Ingenieria', beca:false),
    SolicitudAdmision(id:'4', nombre:'Ana Torres',  documento:'0956781234', edad:22,   usuario:'atorres',  so:'Derecho', beca:false),
  ];

  bool _modoGrid = false;   // false = lista, true = cuadrÃ­cula

  void _toggleFavorito(int i) =>
      setState(() => _aspirantes[i].favorito = !_aspirantes[i].favorito);

  void _eliminar(int i) => setState(() => _aspirantes.removeAt(i));

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Aspirantes (${_aspirantes.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          // Toggle lista / cuadrÃ­cula
          IconButton(
            icon:    Icon(_modoGrid ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _modoGrid = !_modoGrid),
            tooltip: _modoGrid ? 'Vista lista' : 'Vista cuadrÃ­cula',
          ),
        ],
      ),
      body: _modoGrid
          ? GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:   2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 8,
                mainAxisSpacing:  8,
              ),
              itemCount:   _aspirantes.length,
              itemBuilder: (ctx, i) => TarjetaAspiranteGrid(
                aspirante:   _aspirantes[i],
                onFavorito: () => _toggleFavorito(i),
                onEliminar: () => _eliminar(i),
              ),
            )
          : ListView.separated(
              itemCount:        _aspirantes.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => FilaAspirante(
                aspirante:   _aspirantes[i],
                onFavorito: () => _toggleFavorito(i),
                onEliminar: () => _eliminar(i),
              ),
            ),
    );
  }
}