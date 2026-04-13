fun main() {
    
    //readline
    println("Calculo de notas del estudiante")
    println("Ingresa nota 1 : ")
    val nota1 = readLine()?.toInt() ?: 0

    println("Ingresa nota 2 : ")
    val nota2 = readLine()?.toInt() ?: 0

    println("Suma de notas")
    println("$nota1 + $nota2 : ${nota1 + nota2}")
    
    println("Diferencia de notas")
    println("$nota1 - $nota2 : ${nota1 - nota2}")
    
    println("Producto de notas")
    println("$nota1 * $nota2 : ${nota1 * nota2}")
    
    println("Promedio (division)")
    if (nota2 != 0) {
        println("$nota1 / $nota2 : ${nota1 / nota2}")
    } else {
        println("No se puede dividir para cero")
    }
    
    println("Modulo de notas")
    if (nota2 != 0) {
        println("$nota1 % $nota2 : ${nota1 % nota2}")
    } else {
        println("No se puede calcular modulo con cero")
    }
    
    println("Operadores de Asignacion Compuesta")
    var totalPuntos = 10
    
    totalPuntos += 5
    println("totalPuntos+=5 $totalPuntos")
    
    totalPuntos -= 3
    println("totalPuntos-=3 $totalPuntos")
    
    totalPuntos *= 6
    println("totalPuntos*=6 $totalPuntos")
    
    totalPuntos /= 2
    println("totalPuntos/=2 $totalPuntos")
    
    totalPuntos %= 2
    println("totalPuntos%=2 $totalPuntos")
    
    //Incremento o Decremento
    totalPuntos++
    println("totalPuntos++ $totalPuntos")
    
    totalPuntos--
    println("totalPuntos-- $totalPuntos")
}