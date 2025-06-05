import 'package:flutter/material.dart';

class Ejercicio3 extends StatefulWidget {
  const Ejercicio3({super.key});

  @override
  State<Ejercicio3> createState() => _Ejercicio3State();
}

class _Ejercicio3State extends State<Ejercicio3> {
  final TextEditingController generoCtrl = TextEditingController();
  final TextEditingController pesoCtrl = TextEditingController();
  final TextEditingController alturaCtrl = TextEditingController();
  final TextEditingController edadCtrl = TextEditingController();
  final TextEditingController actividadCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            padding:  EdgeInsets.all(16),
            child: Container(
              padding:  EdgeInsets.all(16),
              
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                   Text(
                    "Calculadora de Calorías Diarias",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                   SizedBox(height: 20),

                  TextField(
                    controller: generoCtrl,
                    decoration:  InputDecoration(
                      labelText: "Género (hombre/mujer)",
                      hintText: "Ej: hombre o mujer",
                      border: OutlineInputBorder(),
                    ),
                  ),
                   SizedBox(height: 15),

                  TextField(
                    controller: pesoCtrl,
                    keyboardType: TextInputType.number,
                    decoration:  InputDecoration(
                      labelText: "Peso (kg)",
                      border: OutlineInputBorder(),
                    ),
                  ),
                   SizedBox(height: 15),

                  // Altura
                  TextField(
                    controller: alturaCtrl,
                    keyboardType: TextInputType.number,
                    decoration:  InputDecoration(
                      labelText: "Altura (cm)",
                      border: OutlineInputBorder(),
                    ),
                  ),
                   SizedBox(height: 15),

                  // Edad
                  TextField(
                    controller: edadCtrl,
                    keyboardType: TextInputType.number,
                    decoration:  InputDecoration(
                      labelText: "Edad",
                      border: OutlineInputBorder(),
                    ),
                  ),
                   SizedBox(height: 15),

                  TextField(
                    controller: actividadCtrl,
                    decoration:  InputDecoration(
                      labelText: "Nivel de actividad",
                      hintText:
                          "Ej: sedentario, ligero, moderado, activo, muy activo",
                      border: OutlineInputBorder(),
                    ),
                  ),
                   SizedBox(height: 25),

                  ElevatedButton(
                    onPressed: () => mostrarResultado(
                      context,
                      generoCtrl.text,
                      pesoCtrl,
                      alturaCtrl,
                      edadCtrl,
                      actividadCtrl.text,
                    ),
                    child:  Text("CALCULAR"),
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void mostrarResultado(
   context,
   genero,
   peso,
   altura,
   edad,
   actividad,
) {
  String resultado = calcularCalorias(
    genero,
    peso.text,
    altura.text,
    edad.text,
    actividad,
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

String calcularCalorias(
  String genero,
  String pesoS,
  String alturaS,
  String edadS,
  String nivelActividad,
) {
  double? peso = double.parse(pesoS);
  double? altura = double.parse(alturaS);
  int? edad = int.parse(edadS);

  if (peso <=0 || altura <=0 || edad <=0) {
    return "Por favor, ingresa valores numéricos válidos.";
  }

  String generoLower = genero.toLowerCase();
  if (generoLower != 'hombre' && generoLower != 'mujer') {
    return "Por favor, ingresa un género válido: hombre o mujer.";
  }

  double tmb = 0;
  if (generoLower == 'hombre') {
    tmb = 10 * peso + 6.25 * altura - 5 * edad + 5;
  } else {
    tmb = 10 * peso + 6.25 * altura - 5 * edad - 161;
  }

  String act = nivelActividad.toLowerCase();
  double factorActividad;
  switch (act) {
    case 'sedentario':
      factorActividad = 1.2;
      break;
    case 'ligero':
      factorActividad = 1.375;
      break;
    case 'moderado':
      factorActividad = 1.55;
      break;
    case 'activo':
      factorActividad = 1.725;
      break;
    case 'muy activo':
      factorActividad = 1.9;
      break;
    default:
      return
          "Por favor, ingresa un nivel de actividad válido:\n sedentario, ligero, moderado, activo, muy activo.";
  }

  double caloriasDiarias = tmb * factorActividad;

  return "Calorías diarias recomendadas: $caloriasDiarias kcal";
}
