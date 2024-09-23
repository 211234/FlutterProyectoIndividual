import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart'; // Para abrir el enlace del repositorio

class Ejercicio5Screen extends StatelessWidget {
  const Ejercicio5Screen({super.key});

  // Método para mostrar la alerta antes de redirigir al repositorio
  void _showConfirmationDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Abrir Enlace'),
          content: const Text('¿Deseas ir al repositorio de GitHub?'),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
                _launchURL(); // Abre el enlace si selecciona "Sí"
              },
              child: const Text('Sí'),
            ),
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context); // Cierra el diálogo si selecciona "No"
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  // Método para abrir el enlace en el navegador
  void _launchURL() async {
    const url = 'https://github.com/211234/FlutterProyectoIndividual.git';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir el enlace $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Repositorio GitHub'),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Hace que la columna tome el tamaño mínimo necesario
              children: [
                // Card con fondo blanco
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: CupertinoColors.white, // Fondo blanco
                    borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
                    boxShadow: [
                      BoxShadow(
                        color: CupertinoColors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Imagen de GitHub
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Image.asset(
                          'assets/GitHub.png', // Asegúrate de que el archivo exista en esta ubicación
                          height: 100,
                        ),
                      ),
                      // Texto informativo
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Link del Repositorio de GitHub del Proyecto',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: CupertinoColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Botón que lanza la alerta
                CupertinoButton.filled(
                  onPressed: () => _showConfirmationDialog(context),
                  child: const Text('Repositorio'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
