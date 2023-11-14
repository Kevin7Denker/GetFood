import 'package:flutter_test/flutter_test.dart';
import 'package:uno/uno.dart';
import 'package:xfood/infra/impl_pedido_api_service.dart';

void main() {
  test("Consegue buscar lista de lanches", () async {
    final service = PedidoApiServiceImpl(Uno());

    final lista = await service.listar();
   
    expect(lista.length, 8);
  });
}
