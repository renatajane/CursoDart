import 'package:flutter/material.dart';
import 'package:helloworld/screens/transferencia/lista.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: Color.fromARGB(255, 237, 235, 208),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          foregroundColor: Color.fromARGB(255, 0, 0, 0),
          backgroundColor: Color.fromARGB(255, 249, 249, 249),
          padding: EdgeInsets.all(16.0),
        )),
      ),
      home: ListaTransferencias(),
    );
  }
}
