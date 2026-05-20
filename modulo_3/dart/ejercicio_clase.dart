import 'dart:io';
void main() {

  int entrada = 1;
  int empleados = 0;
  int empaques = 0;


  while (entrada != 0) {
    print('Ingrese la cantidad: ');
    entrada = int.parse(stdin.readLineSync()!);
    empaques += entrada;
    empleados++;
  }
    print('Numero de paquetes : $empaques');
    if (empaques < 20){
        print("Rendimiento Bajo");
    } else if(empaques < 50 ){ 
        print("Rendimiento Normal");
    } else { 
        print("Rendimiento Excelente");
    }
    
    print("Total de cajas empaquetadas: $empaques , La cantidad de empleados registrados son: $empleados");
    print("El promedio de cajas por empleado es = ${empleados/empaques}");
    
}


