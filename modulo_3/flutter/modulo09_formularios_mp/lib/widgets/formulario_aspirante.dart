// lib/widgets/formulario_aspirante.dart
import 'package:flutter/material.dart';

class FormularioAspirante extends StatefulWidget {
  final void Function(Map<String, String> datos) onGuardar;
  const FormularioAspirante({super.key, required this.onGuardar});

  @override
  State<FormularioAspirante> createState() => _FormularioAspiranteState();
}

class _FormularioAspiranteState extends State<FormularioAspirante> {
  final _formKey = GlobalKey<FormState>();

  // Controladores
  final _ctrlNombre  = TextEditingController();
  final _ctrlIp      = TextEditingController();
  final _ctrlEdad  = TextEditingController(text: '22');
  final _ctrlUsuario = TextEditingController(text: 'root');
  final _ctrlMac     = TextEditingController(); // <- Corregido: Controlador propio para MAC

  // FocusNodes para navegaciÃ³n de teclado
  final _focusIp      = FocusNode();
  final _focusEdad  = FocusNode();
  final _focusUsuario = FocusNode();
  final _focusMac     = FocusNode();

  // Variables de Estado
  String _so        = 'Ingenieria';
  String _servicio  = 'WEB'; // <- Corregido: Estado independiente para Servicios
  bool   _beca       = true;

  // ExpresiÃ³n regular para validar IPv4 y MAC
  static final _regexIp  = RegExp(r'^(\d{1,3}\.){3}\d{1,3}$');
  static final _regexMac = RegExp(r'^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$');

  @override
  void dispose() {
    _ctrlNombre.dispose();
    _ctrlIp.dispose();
    _ctrlEdad.dispose();
    _ctrlUsuario.dispose();
    _ctrlMac.dispose();
    _focusIp.dispose();
    _focusEdad.dispose();
    _focusUsuario.dispose();
    _focusMac.dispose();
    super.dispose();
  }

  void _guardar() {
    if (!_formKey.currentState!.validate()) return;

    widget.onGuardar({
      'nombre':   _ctrlNombre.text.trim(),
      'documento':       _ctrlIp.text.trim(),
      'edad':   _ctrlEdad.text.trim(),
      'usuario':  _ctrlUsuario.text.trim(),
      'mac':      _ctrlMac.text.trim(),
      'so':       _so,
      'servicio': _servicio,
      'beca':      _beca.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView( // Cambiado a ListView para evitar desbordamiento (Overflow) al abrir teclado
        padding: const EdgeInsets.all(16.0),
        children: [

          // â”€â”€ Nombre del Aspirante â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
          TextFormField(
            controller: _ctrlNombre,
            decoration: const InputDecoration(
              labelText:  'Nombre del aspirante',
              hintText:   'Juan Perez',
              prefixIcon: Icon(Icons.dns),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusIp.requestFocus(),
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'El nombre es obligatorio';
              if (v.length < 3)                  return 'MÃ­nimo 3 caracteres';
              if (!RegExp(r'^[a-zA-Z0-9\-\_]+$').hasMatch(v)) {
                return 'Solo letras, nÃºmeros, guiones y guiones bajos';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),

          // â”€â”€ DirecciÃ³n Documento â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
          TextFormField(
            controller:   _ctrlIp,
            focusNode:    _focusIp,
            decoration: const InputDecoration(
              labelText:  'DirecciÃ³n Documento',
              hintText:   '192.168.1.100',
              prefixIcon: Icon(Icons.router),
              border:     OutlineInputBorder(),
            ),
            keyboardType:    TextInputType.number,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusEdad.requestFocus(),
            validator: (v) {
              if (v == null || v.isEmpty) return 'La Documento es obligatoria';
              if (!_regexIp.hasMatch(v))  return 'Formato IPv4 invÃ¡lido (ej. 192.168.1.10)';
              final octetos = v.split('.').map(int.parse).toList();
              if (octetos.any((o) => o > 255)) return 'Octeto fuera de rango (0â€“255)';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // â”€â”€ Edad â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
          TextFormField(
            controller:   _ctrlEdad,
            focusNode:    _focusEdad,
            decoration: const InputDecoration(
              labelText:  'Edad',
              prefixIcon: Icon(Icons.lock_outline),
              border:     OutlineInputBorder(),
            ),
            keyboardType:    TextInputType.number,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusUsuario.requestFocus(),
            validator: (v) {
              final edad = int.tryParse(v ?? '');
              if (edad == null)               return 'Edad debe ser un nÃºmero';
              if (edad < 1 || edad > 65535) return 'Edad entre 1 y 65535';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // â”€â”€ Usuario â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
          TextFormField(
            controller:      _ctrlUsuario,
            focusNode:       _focusUsuario,
            decoration: const InputDecoration(
              labelText:  'Usuario',
              prefixIcon: Icon(Icons.person_outline),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusMac.requestFocus(),
            validator: (v) =>
                v == null || v.trim().isEmpty ? 'El usuario es obligatorio' : null,
          ),
          const SizedBox(height: 12),

          // â”€â”€ DirecciÃ³n MAC â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
          TextFormField(
            controller: _ctrlMac,
            focusNode:  _focusMac,
            decoration: const InputDecoration(
              labelText:  'DirecciÃ³n MAC',
              hintText:   '00:1A:2B:3C:4D:5E',
              prefixIcon: Icon(Icons.perm_identity),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'La direcciÃ³n MAC es obligatoria';
              if (!_regexMac.hasMatch(v)) return 'Formato MAC invÃ¡lido (ej. AA:BB:CC:DD:EE:FF)';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // â”€â”€ Sistema Operativo â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
          DropdownButtonFormField<String>(
            value:      _so,
            decoration: const InputDecoration(
              labelText:  'Sistema Operativo',
              prefixIcon: Icon(Icons.computer),
              border:     OutlineInputBorder(),
            ),
            items: [
              'Ingenieria', 'Medicina', 'CentOS Stream 9',
              'Rocky Linux 9', 'Derecho',
            ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
            onChanged: (v) => setState(() => _so = v!),
          ),
          const SizedBox(height: 12),

          // â”€â”€ Servicios â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
          DropdownButtonFormField<String>(
            value:      _servicio,
            decoration: const InputDecoration(
              labelText:  'Servicios',
              prefixIcon: Icon(Icons.layers), // Icono cambiado para diferenciarlo de SO
              border:     OutlineInputBorder(),
            ),
            items: [
              'WEB', 'HTTP', 'HTTPS',
            ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
            onChanged: (v) => setState(() => _servicio = v!), // Corregido: Asigna a _servicio
          ),
          const SizedBox(height: 8),

          // â”€â”€ Beca â€” SwitchListTile â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
          SwitchListTile(
            title:     const Text('ConexiÃ³n Beca/TLS'),
            subtitle:  const Text('Cifrar la comunicaciÃ³n'),
            value:     _beca,
            onChanged: (v) => setState(() => _beca = v),
            secondary: const Icon(Icons.security),
          ),
          const SizedBox(height: 16),

          // â”€â”€ Botones â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    _formKey.currentState?.reset();
                    _ctrlNombre.clear();
                    _ctrlIp.clear();
                    _ctrlMac.clear();
                    _ctrlEdad.text = '22';
                    _ctrlUsuario.text = 'root';
                  },
                  child: const Text('Limpiar'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: FilledButton.icon(
                  onPressed: _guardar,
                  icon:  const Icon(Icons.save),
                  label: const Text('Guardar aspirante'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}