fun main() {
    println("Utilidades List")
    println("map")
    
    val notas = listOf(5, 6, 7, 8, 9, 10)
    println(notas)
    
    val notasCuadrado = notas.map { it * it }
    println(notasCuadrado)
    
    val notasTexto = notas.map { "Nota $it" }
    println(notasTexto)
    
    println("filter")
    val aprobadas = notas.filter { it >= 7 }
    println(aprobadas)
    
    val altas = notas.filter { it > 8 }
    println(altas)
    
    val aprobadasAltas = notas.filter { it >= 7 && it > 8 }
    println(aprobadasAltas)
    
    val reprobadas = notas.filterNot { it >= 7 }
    println(reprobadas)
    
    val mezcla = listOf(1, "Juan", 2, "Maria", true, 10)
    val soloNombres = mezcla.filterIsInstance<String>()
    println(soloNombres)
    
    println("reduce")
    val notasReduce = listOf(7, 8, 9, 10)
    val suma = notasReduce.reduce { acc, n -> acc + n }
    println(suma)
    
    val producto = notasReduce.reduce { acc, n -> acc * n }
    println(producto)
    
    println("fold")
    val sumaFold = notasReduce.fold(10) { acc, n -> acc + n }
    println(sumaFold)
    
    val productoFold = notasReduce.fold(10) { acc, n -> acc * n }
    println(productoFold)
    
    println("Ordenacion")
    println("Ascendente : ${notas.sorted()}")
    println("Descendente : ${notas.sortedDescending()}")
    println("Sorter by : ${notas.sortedBy { -it }}")
    
    println("Agregacion")
    println("Sumar : ${notas.sum()}")
    println("Promedio : ${notas.average()}")
    println("Minimo : ${notas.min()}")
    println("Maximo : ${notas.max()}")
    println("Contar aprobados : ${notas.count { it >= 7 }}")

    println("Busqueda")
    println("Buscar primera nota alta : ${notas.find { it > 8 }}")
    println("Buscar ultima nota alta : ${notas.findLast { it > 8 }}")
    println("Existe nota mayor a 9 : ${notas.any { it > 9 }}")
    println("Todas son mayores a 4 : ${notas.all { it > 4 }}")
    println("Ninguna es cero : ${notas.none { it == 0 }}")
}