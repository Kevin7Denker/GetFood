import 'package:flutter/material.dart';
import 'package:xfood/pages/historico_page.dart';

import '../models/pedido.dart';

class PedidoItem extends StatelessWidget {
  final Pedido item;

  const PedidoItem({super.key, required this.item});

  _abrirHistorico(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return Historico(pedido: item);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
        child: SizedBox(
      width: 50,
      height: 50,
      child: GestureDetector(
          onTap: () {
            _abrirHistorico(context);
          },
          child: Row(
            children: [
              Hero(
                  tag: item.id,
                  child: Image.network(item.lanches[0].urlImagem)),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  children: [
                    Text("Pedido: ${item.id}"),
                    Text(
                        "Valor do pedido: R\$ ${item.totalValor().toString()}")
                  ],
                ),
              ),
            ],
          )),
    ));
  }
}
