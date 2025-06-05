import 'package:flutter/material.dart';

class Ejercicio2 extends StatelessWidget {
  const Ejercicio2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text("Ejercicio 2")),
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
              padding:  EdgeInsets.all(16),
              decoration: BoxDecoration(
                //color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ingresoDatos(context),
            ),
          ),
        ),
      ),
    );
  }
}

Widget ingresoDatos(BuildContext context) {
  TextEditingController masaCtrl = TextEditingController();
  TextEditingController velocidadCtrl = TextEditingController();

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        "Calculadora de Energía Cinética",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 20),
      TextField(
        controller: masaCtrl,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Masa (kg)",
          border: OutlineInputBorder(),
        ),
      ),
      SizedBox(height: 15),
      TextField(
        controller: velocidadCtrl,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Velocidad (m/s)",
          border: OutlineInputBorder(),
        ),
      ),
       SizedBox(height: 20),
      ElevatedButton(
        onPressed: () => mostrarResultado(context, masaCtrl, velocidadCtrl),
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

String calcularEnergia(String _masa, String _velocidad) {
  double? masa = double.parse(_masa);
  double? velocidad = double.parse(_velocidad);

  if (masa <0 || velocidad <0) {
    return "Por favor, ingresa valores numéricos válidos.";
  }

  if (velocidad == 0) {
    return "El objeto está en reposo (energía = 0).";
  }

  double energia = 0.5 * masa * velocidad * velocidad;

  return "Energía cinética: $energia J";
}
