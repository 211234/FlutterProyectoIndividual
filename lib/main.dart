import 'package:flutter/cupertino.dart';
import 'screens/my_home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Ejercicios Flutter';

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}
