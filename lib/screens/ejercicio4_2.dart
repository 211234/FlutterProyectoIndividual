import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  _StudentListScreenState createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  List<Map<String, dynamic>> students = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchStudents();
  }

  Future<void> _fetchStudents() async {
    final url = Uri.parse('http://10.0.2.2:3000/api/students');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        await Future.delayed(const Duration(seconds: 2));

        if (data.isNotEmpty) {
          setState(() {
            students = data.map((student) {
              return {
                'name': student['name'] ?? 'Nombre no disponible',
                'last_name': student['last_name'] ?? 'Apellido no disponible',
              };
            }).toList();
          });
        } else {
          setState(() {
            errorMessage = 'No hay datos disponibles.';
          });
        }
      } else {
        setState(() {
          errorMessage = 'Error al obtener la lista de alumnos.';
        });
      }
    } catch (error) {
      setState(() {
        errorMessage = 'Error de conexión.';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Lista de Alumnos Registrados UP'),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      child: SafeArea(
        child: isLoading
            ? const Center(child: CupertinoActivityIndicator())
            : errorMessage.isNotEmpty
            ? Center(child: Text(errorMessage))
            : students.isEmpty
            ? const Center(child: Text('Lista vacía, agregue alumnos'))
            : ListView.builder(
          itemCount: students.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {}, // Añade cualquier funcionalidad si deseas que cada alumno haga algo
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey6,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Icon(CupertinoIcons.person),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          '${students[index]['name']} ${students[index]['last_name']}',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
