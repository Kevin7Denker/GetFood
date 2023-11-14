
import 'package:xfood/infra/i_pedido_api_service.dart';
import 'package:xfood/models/pedido.dart';
import 'package:xfood/repositories/i_pedidos_repository.dart';

class PedidoRepositoryImpl implements IPedido {
  final IPedidoApiService service;

  PedidoRepositoryImpl(this.service);

  @override
  Future<List<Pedido>> listar() {
    return service.listar();
  }
}
