import '../models/pedido.dart';

abstract class IPedido {
  Future<List<Pedido>> listar();
}
