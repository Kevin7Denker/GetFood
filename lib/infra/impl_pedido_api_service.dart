import 'package:uno/uno.dart';
import 'i_pedido_api_service.dart';
import 'package:xfood/models/pedido.dart';

import 'utils.dart';

class PedidoApiServiceImpl implements IPedidoApiService {
  final Uno uno;

  PedidoApiServiceImpl(this.uno);

  @override
  Future<List<Pedido>> listar() async {
    final response = await uno.get("$urlApi/pedidos.json");
    final resultado = <Pedido>[];

    final pedidos = response.data as Map;

    for (final k in pedidos.keys) {
      final p = pedidos[k];
      p['id'] = k;
      resultado.add(Pedido.fromMap(p));
    }

    return resultado;
  }

  @override
  Future<Pedido> salvar(Pedido pedido) async {
    final resp = await uno.post("$urlApi/pedidos.json", data: pedido.toJson());

    if (resp.status == 200) {
      return pedido.copyWith(id: resp.data["name"]);
    }

    return Pedido(id: "", lanches: [], dataHora: DateTime.now());
  }
}
