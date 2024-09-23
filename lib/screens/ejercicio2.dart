import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // Para usar algunos colores de Material como Colors

class Ejercicio2Screen extends StatefulWidget {
  const Ejercicio2Screen({super.key});

  @override
  _Ejercicio2ScreenState createState() => _Ejercicio2ScreenState();
}

class _Ejercicio2ScreenState extends State<Ejercicio2Screen> {
  final TextEditingController _textController = TextEditingController();

  // Función para verificar si el texto solo contiene letras
  bool _isValidWord(String text) {
    final RegExp regExp = RegExp(r'^[a-zA-Z]+$');
    return regExp.hasMatch(text);
  }

  // Mostrar alerta de validación con CupertinoAlertDialog
  void _showValidationAlert(bool isValid) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            isValid ? '¡Correcto!' : '¡Incorrecto!',
            style: TextStyle(
              color: isValid ? Colors.green : Colors.red, // Verde para correcto, rojo para incorrecto
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            isValid
                ? 'La palabra ingresada es válida, solo contiene letras.'
                : 'La palabra contiene números o caracteres especiales. Por favor ingresa solo letras.',
            style: const TextStyle(fontSize: 16),
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  // Función para verificar la palabra ingresada
  void _verifyWord() {
    String inputText = _textController.text;
    bool isValid = _isValidWord(inputText);
    _showValidationAlert(isValid);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Verificación'),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Descripción de la vista
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'En esta vista puedes verificar si una palabra solo contiene letras. '
                      'Si la palabra ingresada contiene números o caracteres especiales, '
                      'se mostrará una alerta de error.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
              ),
              // Campo de texto para ingresar la palabra
              CupertinoTextField(
                controller: _textController,
                placeholder: 'Ingresa una palabra',
                textAlign: TextAlign.center,
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.systemGrey),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              const SizedBox(height: 20),
              // Botón de verificar
              CupertinoButton(
                color: CupertinoColors.activeBlue,
                onPressed: _verifyWord,
                child: const Text('Verificar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose(); // Liberar el controlador cuando no se use
    super.dispose();
  }
}
