import 'package:flutter/material.dart';
import 'package:prueba_1/screens/Ejercicio1Screen.dart';
import 'package:prueba_1/screens/Ejercicio2Screen.dart';
import 'package:prueba_1/screens/Ejercicio3Screen.dart';

void main() {
  runApp(Prueba1());
}

class Prueba1 extends StatelessWidget {
  const Prueba1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Cuerpo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Cuerpo extends StatefulWidget {
  const Cuerpo({super.key});

  @override
  State<Cuerpo> createState() => _CuerpoState();
}

class _CuerpoState extends State<Cuerpo> {
  int indice = 0;
  List<Widget> paginas = [Ejercicio1(), Ejercicio2(), Ejercicio3()];


  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PRUEBA 1"),
        actions: [IconButton.outlined(onPressed: ()=>mensajeAutor(context), icon: Icon(Icons.heat_pump_rounded))],
      ),
      body: paginas[indice],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indice,
        onTap: (value) {
          setState(() {
            indice = value;
          });
        },
        items:  [
          BottomNavigationBarItem(
              icon: Icon(Icons.filter_1_outlined), label: "EJERCICIO 1"),
          BottomNavigationBarItem(
              icon: Icon(Icons.filter_2_outlined), label: "EJERCICIO 2"),
          BottomNavigationBarItem(
              icon: Icon(Icons.filter_3_outlined), label: "EJERCICIO 3"),
        ],
      ),
    );
  }
}


void mensajeAutor(context){
  showDialog(context: context, builder: (context)=>
  AlertDialog(
    title:  Text("Ejercicios de Programación"),
    content: Text("Autor: Heydi Herrera \nCarrera: Desarrollo de Software"),
    actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child:  Text("Cerrar"),
            ),
          ],
  ));
}
