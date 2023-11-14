import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:uno/uno.dart';
import 'package:xfood/atoms/carrinho_state.dart';
import 'package:xfood/atoms/home_page_state.dart';
import 'package:xfood/atoms/pedidos_state.dart';
import 'package:xfood/dependencies.dart';
import 'package:xfood/infra/i_lanches_api_service.dart';
import 'package:xfood/infra/i_pedido_api_service.dart';
import 'package:xfood/infra/impl_lanches_api_service.dart';
import 'package:xfood/infra/impl_pedido_api_service.dart';
import 'package:xfood/reducers/carrinho_reducers.dart';
import 'package:xfood/reducers/home_page_reducers.dart';
import 'package:xfood/reducers/pedidos_page_reducers.dart';

import 'package:xfood/repositories/i_lanche_repository.dart';
import 'package:xfood/repositories/i_pedidos_repository.dart';
import 'package:xfood/repositories/lanche_repository_impl.dart';
import 'package:xfood/repositories/pedido_repository_impl.dart';

import 'my_app.dart';

void main() {
  injector.addInstance(Uno());
  injector.addSingleton<ILanchesApiService>(LanchesApiServiceImpl.new);
  injector.addSingleton<ILancheRepository>(LancheRepositoryImpl.new);
  
  injector.addSingleton<IPedido>(PedidoRepositoryImpl.new);
  injector.addSingleton<IPedidoApiService>(PedidoApiServiceImpl.new);

  injector.addSingleton<CarrinhoState>(CarrinhoState.new);
  injector.addSingleton<CarrinhoReducers>(CarrinhoReducers.new);

  injector.addSingleton<HomePageState>(HomePageState.new);
  injector.addSingleton(HomePageReducers.new);

  injector.addSingleton<PedidosPageState>(PedidosPageState.new);
  injector.addSingleton(PedidosPageReducers.new);


  injector.commit();

  runApp(const RxRoot(child: MyApp()));
}
