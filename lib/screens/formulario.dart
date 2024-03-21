import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helloworld/componentes/editor.dart';
import 'package:helloworld/models/transferencia.dart';

class FormularioTransferencia extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia>{
  
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Criando Transferência'),
          backgroundColor: Color.fromARGB(255, 217, 199, 2),
        ),
        body: Column(
          children: <Widget>[
            Editor(controlador: _controladorCampoNumeroConta, rotulo:'Número conta', dica:'00000'),
            Editor(controlador: _controladorCampoValor, rotulo:'Valor', dica:'0.00', icone:Icons.monetization_on),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  child: Text('Confirmar'),
                  onPressed: () => _criaTransferencia(context)),
            ),
          ],
        ));
  }
  
  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (valor != null && numeroConta != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('Criando transferencia');
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}