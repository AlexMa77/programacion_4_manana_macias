// lib/main.dart
import 'package:flutter/material.dart';
import 'package:modulo09_formularios_mp/models/solicitud_admision.dart';
import 'package:modulo09_formularios_mp/screens/pantalla_busqueda.dart';
import 'package:modulo09_formularios_mp/screens/pantalla_aspirantes.dart';
import 'package:modulo09_formularios_mp/widgets/fila_aspirante.dart';
import 'package:modulo09_formularios_mp/widgets/formulario_aspirante.dart';

const int paso = 5;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1B5E20),
    ),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => const _Paso1(),
    2 => const _Paso2(),
    3 => const _Paso3(),
    4 => const PantallaAspirantes(),
    5 => const PantallaBusqueda(),
    _ => Scaffold(
        body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

// â”€â”€â”€ Paso 1 â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
class _Paso1 extends StatefulWidget {
  const _Paso1();
  @override
  State<_Paso1> createState() => _Paso1State();
}

class _Paso1State extends State<_Paso1> {
  final _ctrlHostname = TextEditingController();
  final _ctrlIp       = TextEditingController();
  final _ctrlEdad   = TextEditingController(text: '22');
  final _focusIp      = FocusNode();
  final _focusEdad  = FocusNode();

  @override
  void dispose() {
    _ctrlHostname.dispose();
    _ctrlIp.dispose();
    _ctrlEdad.dispose();
    _focusIp.dispose();
    _focusEdad.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title:           const Text('ConexiÃ³n SSH'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller:      _ctrlHostname,
              decoration:      const InputDecoration(
                labelText:  'Hostname',
                hintText:   'Juan Perez',
                prefixIcon: Icon(Icons.dns),
                border:     OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted:     (_) => _focusIp.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller:      _ctrlIp,
              focusNode:       _focusIp,
              decoration:      const InputDecoration(
                labelText:  'DirecciÃ³n Documento',
                hintText:   '192.168.1.100',
                prefixIcon: Icon(Icons.router),
                border:     OutlineInputBorder(),
              ),
              keyboardType:    TextInputType.number,
              textInputAction: TextInputAction.next,
              onSubmitted:     (_) => _focusEdad.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller:  _ctrlEdad,
              focusNode:   _focusEdad,
              decoration:  const InputDecoration(
                labelText:  'Edad SSH',
                prefixIcon: Icon(Icons.lock_outline),
                border:     OutlineInputBorder(),
              ),
              keyboardType:    TextInputType.number,
              textInputAction: TextInputAction.done,
              onSubmitted:     (_) => FocusScope.of(context).unfocus(),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () {
                FocusScope.of(context).unfocus();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Conectando a ${_ctrlHostname.text} '
                      '(${_ctrlIp.text}:${_ctrlEdad.text})',
                    ),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              icon:  const Icon(Icons.terminal),
              label: const Text('Conectar'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {
                _ctrlHostname.clear();
                _ctrlIp.clear();
                _ctrlEdad.text = '22';
              },
              child: const Text('Limpiar campos'),
            ),
          ],
        ),
      ),
    );
  }
}

// â”€â”€â”€ Paso 2 â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
class _Paso2 extends StatelessWidget {
  const _Paso2();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title:           const Text('Nuevo aspirante'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: FormularioAspirante(
          onGuardar: (datos) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Guardado: ${datos['nombre']} â€” ${datos['documento']}:${datos['edad']}'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        ),
      ),
    );
  }
}

// â”€â”€â”€ Paso 3 â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
class _Paso3 extends StatefulWidget {
  const _Paso3();
  @override
  State<_Paso3> createState() => _Paso3State();
}

class _Paso3State extends State<_Paso3> {
  // Nota: Si tus clases heredan de un modelo base comÃºn (ej. 'Aspirante'), 
  // cambia el tipo de la lista de 'dynamic' al nombre de la clase padre.
  final List<dynamic> _aspirantes = [
    SolicitudAdmision(id:'1', nombre:'Juan Perez',  documento:'0923456781',   edad:22,   usuario:'jperez',   so:'Ingenieria', beca:true,  favorito:true),
    SolicitudAdmision(id:'2', nombre:'Maria Gomez',   documento:'0934567812',   edad:22,   usuario:'mgomez', so:'Medicina',    beca:true),
    SolicitudAdmision(id:'3', nombre:'Carlos Lopez',  documento:'0945678123',   edad:2222, usuario:'clopez',   so:'Ingenieria', beca:false),
    SolicitudAdmision(id:'4', nombre:'Ana Torres',  documento:'0956781234', edad:22,   usuario:'atorres',  so:'Derecho', beca:false),
   
    ServiciosWeb(id1:'5', nombre:'servicio web', documento:'192.168.1.2', edad:80,   usuario:'Danna Gonzalez', favorito: false),
  ];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Aspirantes (${_aspirantes.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: _aspirantes.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.dns_outlined, size: 56, color: cs.onSurfaceVariant),
                  const SizedBox(height: 12),
                  Text('Sin aspirantes', style: TextStyle(color: cs.onSurfaceVariant)),
                ],
              ),
            )
          : ListView.separated(
              itemCount:        _aspirantes.length,
              separatorBuilder: (_, __) => const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) {
                final item = _aspirantes[i];
                return FilaAspirante(
                  aspirante: item,
                  onFavorito: () {
                    setState(() {
                      // Modifica de manera segura basÃ¡ndose en la propiedad real del objeto
                      item.favorito = !item.favorito;
                    });
                  },
                  onEliminar: () {
                    setState(() {
                      _aspirantes.removeAt(i);
                    });
                  },
                );
              },
            ),
    );
  }
}
