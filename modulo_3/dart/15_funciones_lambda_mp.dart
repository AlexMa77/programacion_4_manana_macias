void main() {
  // Lambda asignada a una variable
  final cuadrarNota = (int nota) => nota * nota;
  print(cuadrarNota(3));

  // Lambda de cuerpo completo
  final calcularNotaFinal = (double nota, double bonificacion) {
    final total = nota + bonificacion;
    return total > 10 ? 10 : total;
  };
  print(calcularNotaFinal(8.5, 1.0));

  // Lambda en linea pasada directamente como argumento
  final promedios = [8.7, 9.5, 7.2, 10.0, 6.8];
  promedios.sort((a, b) => b.compareTo(a));
  print(promedios);
}
