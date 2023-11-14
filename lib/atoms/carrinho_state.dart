import 'package:rx_notifier/rx_notifier.dart';

import '../models/lanche.dart';

class CarrinhoState {
  final carrinho = RxList<Lanche>([]);
  final processando = RxNotifier<bool>(false);
  final mensagem = RxNotifier<String>("");

  double get total {
    double soma = carrinho.fold(0.0, (acumulador, lanche) {
      return acumulador + lanche.valor;
    });

    return soma;
  }

  final limpar = RxNotifier.action();
  final adicionar = RxNotifier<Lanche?>(null);
  final finalizar = RxNotifier.action();
}
