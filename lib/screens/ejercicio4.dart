import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'ejercicio4_2.dart'; // Asegúrate de tener esta importación

class Ejercicio4Screen extends StatefulWidget {
  const Ejercicio4Screen({super.key});

  @override
  _Ejercicio4ScreenState createState() => _Ejercicio4ScreenState();
}

class _Ejercicio4ScreenState extends State<Ejercicio4Screen> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _lastName;

  // Función para enviar los datos a la API
  Future<void> _registerStudent() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // URL de la API (actualiza el puerto si es necesario)
      final url = Uri.parse('http://10.0.2.2:3000/api/student');

      // Datos a enviar
      final body = json.encode({
        'name': _name,
        'last_name': _lastName,
      });

      try {
        // Enviamos la solicitud POST
        final response = await http.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: body,
        );

        // Manejo de los códigos de estado 200 y 201
        if (response.statusCode == 201 || response.statusCode == 200) {
          // Registro exitoso
          showCupertinoDialog(
            context: context,
            builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text('Éxito'),
              content: Text('Registro Exitoso'),
              actions: [
                CupertinoDialogAction(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        } else {
          // Fallo en el registro
          showCupertinoDialog(
            context: context,
            builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text('Error'),
              content: Text('Error al registrar el estudiante'),
              actions: [
                CupertinoDialogAction(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        }
      } catch (error) {
        // Manejo de errores de conexión
        showCupertinoDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: Text('Error de conexión'),
            content: Text('No se pudo conectar con el servidor'),
            actions: [
              CupertinoDialogAction(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        );
      }
    } else {
      // Si la validación falla, mostramos un mensaje de error
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text('Error'),
          content: Text('Por favor rellena los campos correctamente'),
          actions: [
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Registro Alumnos UP'),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centrar verticalmente
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CupertinoTextFormFieldRow(
                    placeholder: 'Ingrese nombre/s del Alumno',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese el nombre';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value;
                    },
                  ),
                  SizedBox(height: 16),
                  CupertinoTextFormFieldRow(
                    placeholder: 'Ingrese apellidos del Alumno',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese los apellidos';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _lastName = value;
                    },
                  ),
                  SizedBox(height: 32),
                  CupertinoButton.filled(
                    onPressed: _registerStudent,
                    child: Text('Registrar Alumno'),
                  ),
                  SizedBox(height: 16),
                  CupertinoButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => StudentListScreen()), // Navegar a la lista de alumnos
                      );
                    },
                    child: Text('Ver Lista de Alumnos Registrados'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
