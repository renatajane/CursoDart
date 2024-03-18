import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
      //Para colocar o conteúdo dentro de outro, utilizo o card para inserir informações dentro de outro Widget
      body: FormularioTransferencia(),
    ),
  );
  }
}

class FormularioTransferencia extends StatelessWidget {

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('agora'),
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: <Widget>[
            Editor(controlador: _controladorCampoNumeroConta, rotulo:'Número conta', dica:'00000'),
            Editor(controlador:_controladorCampoValor, rotulo:'Valor', dica:'0.00', icone:Icons.monetization_on),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  child: Text('Confirmar'),
                  onPressed: () {
                    debugPrint('clicou');
                    final int? numeroConta =
                        int.tryParse(_controladorCampoNumeroConta.text);
                    final double? valor =
                        double.tryParse(_controladorCampoValor.text);
                    if (valor != null && numeroConta != null) {
                      final transferenciaCriada = Transferencia(valor, numeroConta);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('$transferenciaCriada'),
                        ),
                      );
                    }
                  }),
            ),
          ],
        ));
  }
}

class Editor extends StatelessWidget{

  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(
//             seedColor: const Color.fromARGB(255, 243, 0, 230)),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'App da renata'),
//     );
//   }
// }

class ListaTransferencias extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferencias'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100.0, 1000)),
          ItemTransferencia(Transferencia(200.0, 1000)),
          ItemTransferencia(Transferencia(300.0, 1000)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(0, 214, 41, 171),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget{

  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
          child: ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text(_transferencia.valor.toString()),
            subtitle: Text(_transferencia.numeroConta.toString()),
          ),
        );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString(){
    return 'Transferencia:{$valor, numeroConta: $numeroConta}';
  }
}

