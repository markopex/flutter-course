import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/models/product.dart';
import 'package:meals_app/screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
        onTap: () => {
          Navigator.of(context)
              .pushNamed(ProductDetailsScreen.routeName, arguments: product.id)
        },
      ),
      footer: GridTileBar(
        title: Text(product.title, textAlign: TextAlign.center),
        leading: IconButton(
          icon: const Icon(Icons.favorite),
          onPressed: () => {},
          color: Theme.of(context).accentColor,
        ),
        backgroundColor: Colors.black87,
        trailing: IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () => {},
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
