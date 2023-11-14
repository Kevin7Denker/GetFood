import 'package:flutter/material.dart';
import 'package:xfood/atoms/pedidos_state.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:xfood/dependencies.dart';
import 'package:xfood/widgets/Pedido_Item.dart';


class PedidosPage extends StatefulWidget {
  const PedidosPage({super.key});

  @override
  State<PedidosPage> createState() => _PedidosPageState();
}

class _PedidosPageState extends State<PedidosPage> {
  final pedidos = injector.get<PedidosPageState>();

  @override
  void initState() {
    super.initState();
    pedidos.fetchList();
  }


  @override
  Widget build(BuildContext context) {
    context.select(() => [pedidos.pedidosList.length]);
    
    return  Scaffold(
        body: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Historico de pedidos:", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:35, left: 10),
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  final item = pedidos.pedidosList[index];
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: PedidoItem(item: item),
                  );
                },
                itemCount: pedidos.pedidosList.length,
              ),
            )
          ],
        ));
  }
}