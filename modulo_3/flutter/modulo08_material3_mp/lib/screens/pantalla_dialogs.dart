// lib/screens/pantalla_dialogs.dart
import 'package:flutter/material.dart';

class PantallaDialogs extends StatelessWidget {
  const PantallaDialogs({super.key});

  // â”€â”€ MÃ‰TODOS DE SNACKBAR â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  void _mostrarSnackBar(BuildContext context, {bool esError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(esError
            ? 'Error: no se pudo conectar al aspirante'
            : 'Boton nuevo'),
        backgroundColor: esError ? Theme.of(context).colorScheme.error : null,
        action: SnackBarAction(
          label: 'Deshacer',
          onPressed: () {},
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  

  // â”€â”€ MÃ‰TODOS DE ALERTAS Y DIÃLOGOS â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  
  // Alerta Informativa Simple
  void _mostrarAlertaInformativa(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: const Icon(Icons.info_outline, color: Colors.blue, size: 32),
        title: const Text('ActualizaciÃ³n del Sistema'),
        content: const Text(
          'Se ha progfisicaado un mantenimiento para las 02:00 AM. '
          'Por favor, guarde todos sus cambios antes de esa hora.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Entendido'),
          ),
        ],
      ),
    );
  }

   void _mostrarAlertaBotonDos(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: const Icon(Icons.info_outline, color: Color.fromARGB(255, 119, 39, 19), size: 32),
        title: const Text('Nuevo boton implementado'),
        content: const Text(
          'click en el boton nuevo '
          'Por favor, guarde todos sus cambios',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Entendido'),
          ),
        ],
      ),
    );
  }


  // Alerta de ConfirmaciÃ³n (Eliminar)
  Future<void> _mostrarConfirmacion(BuildContext context) async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: const Icon(Icons.warning_amber, color: Colors.orange, size: 32),
        title: const Text('Eliminar aspirante'),
        content: const Text(
          'Â¿EstÃ¡s seguro de que deseas eliminar Juan Perez?\n'
          'Esta acciÃ³n no se puede deshacer.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(ctx).colorScheme.error,
            ),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );

    if (!context.mounted) return;

    if (confirmar == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Aspirante eliminado correctamente')),
      );
    }
  }

  // DiÃ¡logo con Formulario
  Future<void> _mostrarFormulario(BuildContext context) async {
    final formKey = GlobalKey<FormState>();
    final ctrlNombre = TextEditingController();
    final ctrlIp = TextEditingController();

    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Agregar aspirante'),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: ctrlNombre,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (v) => v == null || v.isEmpty ? 'Campo requerido' : null,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: ctrlIp,
                decoration: const InputDecoration(labelText: 'DirecciÃ³n Documento'),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Campo requerido';
                  final partes = v.split('.');
                  if (partes.length != 4) return 'Formato: 192.168.1.1';
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.pop(ctx);
              }
            },
            child: const Text('Agregar'),
          ),
        ],
      ),
    );

    if (!context.mounted) return;
    if (ctrlNombre.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Aspirante "${ctrlNombre.text}" agregado')),
      );
    }
  }

  // â”€â”€ DISEÃ‘O DE LA PANTALLA (BUILD) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBar y Dialogs'),
        backgroundColor: cs.surfaceContainerHighest,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // â”€â”€ SecciÃ³n SnackBar â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
          Text('SnackBar', style: text.labelLarge?.copyWith(color: cs.primary)),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: () => _mostrarSnackBar(context),
            icon: const Icon(Icons.check_circle_outline),
            label: const Text('SnackBar de Ã©xito'),
          ),
          FilledButton.icon(
            onPressed: () => _mostrarSnackBar(context),
            icon: const Icon(Icons.check_circle_outline),
            label: const Text('Nuevo Boton'),
          ),
          const SizedBox(height: 8),
          FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: cs.error,
              foregroundColor: cs.onError,
            ),
            onPressed: () => _mostrarSnackBar(context, esError: true),
            icon: const Icon(Icons.error_outline),
            label: const Text('SnackBar de error'),
          ),

          const Divider(height: 32),

          // â”€â”€ SecciÃ³n AlertDialog / Alertas â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
          Text('Alertas y DiÃ¡logos', style: text.labelLarge?.copyWith(color: cs.primary)),
          const SizedBox(height: 12),
          
          // Nueva Alerta Informativa
          FilledButton.icon(
            onPressed: () => _mostrarAlertaBotonDos(context),
            icon: const Icon(Icons.info_outline),
            label: const Text('Boton nuevo 2'),
          ),
          const SizedBox(height: 8),
          
          // Alerta de ConfirmaciÃ³n
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: cs.error,
              side: BorderSide(color: cs.error),
            ),
            onPressed: () => _mostrarConfirmacion(context),
            icon: const Icon(Icons.delete_outline),
            label: const Text('Eliminar aspirante (ConfirmaciÃ³n)'),
          ),
          const SizedBox(height: 8),
          
          // DiÃ¡logo con Formulario
          FilledButton.tonal(
            onPressed: () => _mostrarFormulario(context),
            child: const Text('Agregar aspirante (Formulario)'),
          ),
        ],
      ),
    );
  }
}