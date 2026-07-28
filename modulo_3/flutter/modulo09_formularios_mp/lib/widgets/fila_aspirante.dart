import 'package:flutter/material.dart';

class FilaAspirante extends StatelessWidget {
  final dynamic aspirante; 
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const FilaAspirante({
    super.key,
    required this.aspirante,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final bool tieneSsl = _verificarSsl(aspirante);
    final bool esFavorito = aspirante.favorito ?? false;

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: tieneSsl
            ? cs.primaryContainer
            : cs.surfaceContainerHighest,
        child: Icon(
          Icons.dns,
          color: tieneSsl ? cs.onPrimaryContainer : cs.onSurfaceVariant,
        ),
      ),
      title: Text(
        aspirante.nombre,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        '${aspirante.usuario}@${aspirante.documento}:${aspirante.edad}',
        style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              esFavorito ? Icons.star : Icons.star_border,
              color: esFavorito ? Colors.amber : cs.outline,
            ),
            onPressed:     onFavorito,
            visualDensity: VisualDensity.compact,
            tooltip:       esFavorito ? 'Quitar favorito' : 'Agregar a favoritos',
          ),
          IconButton(
            icon:          Icon(Icons.delete_outline, color: cs.error),
            onPressed:     onEliminar,
            visualDensity: VisualDensity.compact,
            tooltip:       'Eliminar',
          ),
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }

  bool _verificarSsl(dynamic objeto) {
    try {
      return objeto.beca ?? false;
    } catch (_) {
      return false;
    }
  }
}