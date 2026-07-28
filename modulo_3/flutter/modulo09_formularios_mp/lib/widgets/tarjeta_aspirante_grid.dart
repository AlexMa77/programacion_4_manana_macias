// lib/widgets/tarjeta_aspirante_grid.dart
import 'package:flutter/material.dart';
import '../models/solicitud_admision.dart';

class TarjetaAspiranteGrid extends StatelessWidget {
  final SolicitudAdmision  aspirante;
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const TarjetaAspiranteGrid({
    super.key,
    required this.aspirante,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Fila superior: icono + favorito
            Row(children: [
              Icon(
                Icons.dns,
                color: aspirante.beca ? cs.primary : cs.outline,
                size: 18,
              ),
              const Spacer(),
              GestureDetector(
                onTap: onFavorito,
                child: Icon(
                  aspirante.favorito ? Icons.star : Icons.star_border,
                  color: aspirante.favorito ? Colors.amber : cs.outline,
                  size: 18,
                ),
              ),
            ]),
            const SizedBox(height: 6),

            // Nombre e Documento
            Text(
              aspirante.nombre,
              style: text.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              aspirante.documento,
              style: text.bodySmall?.copyWith(color: cs.onSurfaceVariant),
            ),

            const Spacer(),

            // Fila inferior: Beca + SO + eliminar
            Row(children: [
              if (aspirante.beca)
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Icon(Icons.lock, size: 12, color: cs.primary),
                ),
              Expanded(
                child: Text(
                  aspirante.so,
                  style: text.labelSmall?.copyWith(color: cs.onSurfaceVariant),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              GestureDetector(
                onTap: onEliminar,
                child: Icon(Icons.delete_outline, size: 16, color: cs.error),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}