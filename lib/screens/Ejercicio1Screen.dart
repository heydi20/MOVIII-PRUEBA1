import 'package:flutter/material.dart';

class Ejercicio1 extends StatelessWidget {
  const Ejercicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
           SizedBox(height: 10),
           Text(
            "Calculadora de Costo de Combustible",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
           SizedBox(height: 10),
          ingresoDatos(context),
           SizedBox(height: 10),
          
        ],
      ),
    );
  }
}

Widget ingresoDatos(context) {
  TextEditingController distancia = TextEditingController();
  TextEditingController eficiencia = TextEditingController();
  TextEditingController precio = TextEditingController();

  return Padding(
    padding:  EdgeInsets.all(16.0),
    child: Column(
      children: [
        TextField(
          controller: distancia,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            label: Text("Distancia del viaje (km)"),
            border: OutlineInputBorder(),
          ),
        ),
         SizedBox(height: 10),
        TextField(
          controller: eficiencia,
          keyboardType: TextInputType.number,
          decoration:  InputDecoration(
            label: Text("Eficiencia del auto (km/litro)"),
            border: OutlineInputBorder(),
          ),
        ),
         SizedBox(height: 10),
        TextField(
          controller: precio,
          keyboardType: TextInputType.number,
          decoration:  InputDecoration(
            label: Text("Precio por litro de combustible"),
            border: OutlineInputBorder(),
          ),
        ),
         SizedBox(height: 15),
        ElevatedButton(
          onPressed: () =>
              mostrarResultado(context, distancia, eficiencia, precio),
          child:  Text("CALCULAR"),
        ),
      ],
    ),
  );
}

void mostrarResultado(context, distancia, eficiencia, precio) {
  String resultado = calcularCosto(
    distancia.text,
    eficiencia.text,
    precio.text,
  );

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title:  Text("Resultado"),
      content: Text(resultado),
      actions: [
        FilledButton(
          onPressed: () => Navigator.pop(context),
          child:  Text("Cerrar"),
        ),
      ],
    ),
  );
}

String calcularCosto(String _distancia, String _eficiencia, String _precio) {
  double? distancia = double.parse(_distancia);
  double? eficiencia = double.parse(_eficiencia);
  double? precio = double.parse(_precio);

  if (distancia <0 || precio <0) {
    return "Por favor, ingresa valores numéricos válidos.";
  }

  if (eficiencia <= 0) {
    return "La eficiencia del vehículo debe ser mayor a cero.";
  }

  double litros = distancia / eficiencia;
  double costo = litros * precio;

  return "Costo total del viaje: \$$costo";
}
