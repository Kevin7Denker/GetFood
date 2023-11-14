import 'package:flutter/material.dart';

import '../models/lanche.dart';

class DetalhesPage extends StatelessWidget {
  final Lanche model;

  const DetalhesPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 500,
            width: 500,
            child: Hero(
              tag: model.id,
              child: Image.network(
                model.urlImagem,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(model.nome),
        ],
      ),
    );
  }
}
