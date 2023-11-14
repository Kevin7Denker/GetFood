import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:xfood/atoms/home_page_state.dart';
import 'package:xfood/dependencies.dart';
import 'package:xfood/widgets/product_card.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final state = injector.get<HomePageState>();

  @override
  void initState() {
    super.initState();
    state.fetchList();
  }

  @override
  Widget build(BuildContext context) {
    context.select(() => [state.lanchesList.length]);

    return Scaffold(
        body: Stack(
          children: [
            GridView.builder(
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (_, index) {
                final model = state.lanchesList[index];
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: ProductCard(model: model),
                );
              },
              itemCount: state.lanchesList.length,
            )
          ],
        ));
  }
}
