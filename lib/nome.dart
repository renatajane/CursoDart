import 'package:flutter/material.dart';

class NomeWidget extends StatefulWidget {
  final String nome;
  final String? sobrenome;

  const NomeWidget({
    super.key,
    required this.nome,
    this.sobrenome,
  });

  @override
  State<StatefulWidget> createState() {
    return _NomeWidgetState();
  }
}

class _NomeWidgetState extends State<NomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buidBody(),
    );
  }

  Widget _buidBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.nome),
          Text(
           widget.sobrenome ?? "Sem sobrenome"
          ),
        ],
      ),
    );
  }
}
