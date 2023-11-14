import 'package:flutter/material.dart';

import '../models/pedido.dart';

class Historico extends StatelessWidget {
   Historico({super.key, required this.pedido});
  final Pedido pedido;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Histórico"),
      ),
      body:  Column(
        children: [
           const Center(child: Text("Nota Fiscal", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))),
            Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: Text("Id: ${pedido.id}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(pedido.lanches.toString()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Hora: ${pedido.dataHora}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Valor total: ${pedido.totalValor().toDouble().toStringAsFixed(2)} reais"),
            ),
        ]),
    );
  }
}