import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        product.imageUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        title: Text(product.title, textAlign: TextAlign.center),
        leading: IconButton(
          icon: const Icon(Icons.favorite),
          onPressed: () => {},
        ),
        backgroundColor: Colors.black.withAlpha(100),
        trailing: IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () => {},
        ),
      ),
    );
  }
}
