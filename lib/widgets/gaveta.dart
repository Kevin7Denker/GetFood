import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:xfood/atoms/carrinho_state.dart';
import 'package:xfood/dependencies.dart';

class Gaveta extends StatelessWidget {
  final estado = injector.get<CarrinhoState>();

  Gaveta({super.key});

  @override
  Widget build(BuildContext context) {
    context.select(() => [estado.carrinho.length, estado.processando.value]);
    return Drawer(
      shape: const LinearBorder(side: BorderSide()),
      child: Column(
        children: [
          const Padding(
            padding:  EdgeInsets.only(top: 10, bottom: 8),
            child:  Text("Carrinho", style: TextStyle(fontWeight: FontWeight.w600),),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, index) {
                final lanche = estado.carrinho[index];
                return ListTile(
                  leading: Image.network(
                    lanche.urlImagem,
                    height: 40,
                    width: 40,
                  ),
                  title: Text(lanche.nome),
                  subtitle: Text("R\$${lanche.valor.toStringAsFixed(2)}"),
                );
              },
              itemCount: estado.carrinho.length,
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Valor total R\$${estado.total.toStringAsFixed(2)}"),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Stack(children: [
                  ElevatedButton(
                      onPressed: estado.finalizar,
                      child: const Text("Finalizar Pedido", style: TextStyle(color: Colors.green))),
                  if (estado.processando.value)
                    const SizedBox(
                        width: 40,
                        height: 40,
                        child:  CircularProgressIndicator())
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 10),
                child: ElevatedButton(
                    onPressed: estado.limpar, child: const Text("Limpar carrinho", style: TextStyle(color: Colors.red),)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
