import 'package:flutter/material.dart';
import 'package:modulo06_widgets_mp/widgets/catalogo_basicos.dart';
import 'package:modulo06_widgets_mp/widgets/contador_limitado.dart';
import 'package:modulo06_widgets_mp/widgets/etiqueta.dart';
import 'package:modulo06_widgets_mp/widgets/pantalla_contexto.dart';
import 'package:modulo06_widgets_mp/widgets/reloj.dart';
import 'package:modulo06_widgets_mp/widgets/servicio_estado.dart';

// â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
// â”‚  Cambia este nÃºmero y guarda (Ctrl+S) para navegar entre pasos. â”‚
// â”‚  1  Paso 1   StatelessWidget mÃ­nimo                             â”‚
// â”‚  2  Paso 1b  Widgets bÃ¡sicos â€” catÃ¡logo                        â”‚
// â”‚  3  Paso 2   StatelessWidget con parÃ¡metros                     â”‚
// â”‚  4  Paso 3   StatefulWidget / setState / cambio de estatus      â”‚
// â”‚  5  Paso 3b  ParÃ¡metros en StatefulWidget                       â”‚
// â”‚  6  Paso 4   Ciclo de vida con Timer                            â”‚
// â”‚  7  Paso 5   BuildContext                                        â”‚
// â”‚  8  Paso 6   ComposiciÃ³n de widgets                             â”‚
// â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
const int paso = 7;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme:  ColorScheme.fromSeed(
      seedColor:  Colors.deepPurple,          // â† cambia aquÃ­
      brightness: Brightness.dark,     // â† Brightness.dark para modo oscuro
    ),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => const Scaffold(body: Center(child: Saludo())),
    2 => const CatalogoBasicos(),
    3 => const Scaffold(
      body: Center(
        child: Wrap(
          spacing:    12,
          runSpacing: 8,
          children: [
            Etiqueta(texto: 'Activo',    color: Colors.green),
            Etiqueta(texto: 'Error',     color: Colors.red,    relleno: true),
            Etiqueta(texto: 'En espera', color: Colors.orange),
            Etiqueta(texto: 'CrÃ­tico',   color: Colors.red,    fontSize: 16, relleno: true),
            Etiqueta(texto: 'Info',      color: Colors.blue,   fontSize: 11),
          ],
        ),
      ),
    ),
    4 => const Scaffold(
      body: Center(
        child: ServicioEstado(nombre: 'nginx-proxy'),
      ),
    ),
    5 => Scaffold(                               // Paso 3b
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContadorLimitado(
              etiqueta: 'Intentos de login',
              limite:   1,
              color:    Colors.deepPurple,
              textoBoton: 'Intentar',
              onLimite: () => debugPrint('Â¡Cuenta bloqueada!'),
            ),
            const SizedBox(height: 40),
            ContadorLimitado(
              etiqueta: 'Conexiones activas',
              limite:   10,
              color:    Colors.indigo, textoBoton: '',
            ),
          ],
        ),
      ),
    ),
    6 => Scaffold(                              // Paso 4
      appBar: AppBar(title: const Text('CronÃ³metro')),
      body: const Center(child: Reloj()),
    ),
    7 => const PantallaContexto(),    // Paso 5 â€” ya tiene su propio Scaffold
    _ => Scaffold(body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
  
));

class Saludo extends StatelessWidget {
  const Saludo({super.key});

  @override
  Widget build(BuildContext context) {
    // describe cÃ³mo se ve
    return const SelectableText(
      'Aunque la NOAA detectÃ³ condiciones asociadas al fenÃ³meno y modelos anticipan un evento entre moderado y fuerte, aÃºn no hay evidencias lo que serÃ¡n los impactos.',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: 4,
        color: Colors.deepPurple,
        shadows: [
          Shadow(color: Colors.black26, blurRadius: 4, offset: Offset(4, 4)),
        ]
      ),
      textAlign: TextAlign.left,
      //overflow: TextOverflow.ellipsis,
      maxLines: 3,
    );
  }
}