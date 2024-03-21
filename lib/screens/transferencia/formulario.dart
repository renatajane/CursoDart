import 'package:flutter/material.dart';
import 'package:helloworld/componentes/editor.dart';
import 'package:helloworld/models/transferencia.dart';

const _tituloAppBar = 'Criando Transferência';

const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _rotuloCampoNumeroConta = 'Número da conta';
const _dicaCampoNumeroConta = '0000';

const _textoBtnConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
          backgroundColor: Color.fromARGB(255, 217, 199, 2),
        ),
        body: Column(
          children: <Widget>[
            Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: _rotuloCampoNumeroConta ,
                dica: _dicaCampoNumeroConta),
            Editor(
                controlador: _controladorCampoValor,
                rotulo: _rotuloCampoValor,
                dica: _dicaCampoValor,
                icone: Icons.monetization_on),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  child: Text(_textoBtnConfirmar),
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
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
