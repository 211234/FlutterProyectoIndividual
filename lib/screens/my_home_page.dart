import 'package:flutter/cupertino.dart';
import 'ejercicio1.dart';
import 'ejercicio2.dart';
import 'ejercicio3.dart';
import 'ejercicio4.dart';
import 'ejercicio5.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.title),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.bars, size: 24),
          onPressed: () {
            showCupertinoModalPopup<void>(
              context: context,
              builder: (BuildContext context) => CupertinoActionSheet(
                title: const Text('Menú'),
                actions: <CupertinoActionSheetAction>[
                  CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const Ejercicio1Screen()),
                      );
                    },
                    child: const Text('Sobre Mi...'),
                  ),
                  CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const Ejercicio2Screen()),
                      );
                    },
                    child: const Text('Verdadero o Falso'),
                  ),
                  CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const Ejercicio3Screen()),
                      );
                    },
                    child: const Text('Llamada'),
                  ),
                  CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const Ejercicio4Screen()),
                      );
                    },
                    child: const Text('Registrar'),
                  ),
                  CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const Ejercicio5Screen()),
                      );
                    },
                    child: const Text('Proyecto'),
                  ),
                ],
                cancelButton: CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancelar'),
                ),
              ),
            );
          },
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Ejercicios Hechos en Flutter con Dart, '
                    'Materia de PROGRAMACIÓN PARA MÓVILES II, '
                    'Profesor Ángel Odilón Sierra González',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/LogoUp.jpeg',
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
