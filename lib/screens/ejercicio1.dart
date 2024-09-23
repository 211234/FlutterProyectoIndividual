import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // Para usar Card y algunos estilos de Material
import 'my_home_page.dart'; // Para la navegación de vuelta a Home

class Ejercicio1Screen extends StatelessWidget {
  const Ejercicio1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Yo Soy...'),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.back), // Flecha de regreso
          onPressed: () {
            Navigator.pop(context, CupertinoPageRoute(builder: (context) => const MyHomePage(title: 'Ejercicios Flutter')));
          },
        ),
      ),
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: Colors.grey[850],  // Color oscuro para combinar con el fondo negro
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/Yo.jpg',
                        height: 150,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Mi nombre es Cesar Josue Martinez Castillejos. '
                          'Estudio Ingeniería en Desarrollo de Software en la Universidad Politécnica de Chiapas, '
                          'con la Matrícula 211234.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,  // Color de texto claro para destacar en fondo oscuro
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
