import 'package:flutter/material.dart';

class Ejercicio2 extends StatelessWidget {
  const Ejercicio2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ejercicio 2")),
      body: Container(
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/fondo.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding:  EdgeInsets.all(16),
            child: Container(
              child: ingresoDatos(context),
            ),
          ),
        ),
      ),
    );
  }
}

Widget ingresoDatos( context) {
  TextEditingController masa = TextEditingController();
  TextEditingController velocidad = TextEditingController();

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        "Calculadora de Energía Cinética",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 20),
      TextField(
        controller: masa,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Masa (kg)",
          border: OutlineInputBorder(),
        ),
      ),
      SizedBox(height: 15),
      TextField(
        controller: velocidad,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Velocidad (m/s)",
          border: OutlineInputBorder(),
        ),
      ),
       SizedBox(height: 20),
      ElevatedButton(
        onPressed: () => mostrarResultado(context, masa, velocidad),
        child: Text("CALCULAR"),
      ),
       SizedBox(height: 10),
     
    ],
  );
}

void mostrarResultado( context, masa,velocidad) {
  String resultado = calcularEnergia(masa.text, velocidad.text);

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Resultado"),
      content: Text(resultado),
      actions: [
        FilledButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cerrar"),
        ),
      ],
    ),
  );
}

String calcularEnergia(String masaS, String velocidadS) {
  double? masa = double.parse(masaS);
  double? velocidad = double.parse(velocidadS);

  if (masa <0 || velocidad <0) {
    return "Por favor, ingresa valores numéricos válidos.";
  }

  if (velocidad == 0) {
    return "El objeto está en reposo (energía = 0).";
  }

  double energia = 0.5 * masa * velocidad * velocidad;

  return "Energía cinética: $energia J";
}
