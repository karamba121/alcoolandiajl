import 'package:alcoolandiajl/core/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.model, required this.click});
  final ProductModel model;
  final Function click;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: Theme.of(context).colorScheme.primary,
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.secondary,
        onTap: () {print('teste');},
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Spacer(),
          Text(model.name),
          const Spacer(),
          ImageNetwork(
            image: model.imageUrl,
            height: 250,
            width: 150,
            duration: 1500,
            curve: Curves.easeIn,
            onPointer: false,
            debugPrint: false,
            fullScreen: false,
            fitAndroidIos: BoxFit.scaleDown,
            fitWeb: BoxFitWeb.scaleDown,
            onLoading: const CircularProgressIndicator(
              color: Colors.brown,
            ),
            onError: const Icon(
              Icons.error,
              color: Colors.red,
            ),
            onTap: click,
          ),
          const Spacer(),
          Text('R\$ ${model.price}'),
          const Spacer(),
          Container(
            height: 100,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ]),
      ),
    );
  }
}
