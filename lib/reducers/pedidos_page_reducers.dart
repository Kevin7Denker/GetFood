import 'package:rx_notifier/rx_notifier.dart';
import 'package:xfood/atoms/pedidos_state.dart';
import 'package:xfood/repositories/i_pedidos_repository.dart';



class PedidosPageReducers extends RxReducer {
  final PedidosPageState state;
  final IPedido repository;

  PedidosPageReducers(this.state, this.repository) {
    on(() => [state.fetchList], _fetchList);
  }

  _fetchList() async {
    final lista = await repository.listar();
    state.pedidosList.clear();
    state.pedidosList.addAll(lista);
  }
}
