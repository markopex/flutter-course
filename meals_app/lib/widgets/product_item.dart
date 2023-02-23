import 'package:flutter/material.dart';
import 'package:meals_app/providers/product.dart';
import 'package:meals_app/screens/product_details_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context, listen: false);
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
        leading: Consumer<Product>(
          builder: (ctx, product, child) => IconButton(
            icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border),
            color: Theme.of(context).accentColor,
            onPressed: () => {product.toggleFavoriteStatus()},
          ),
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
