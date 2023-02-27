import 'package:flutter/material.dart';
import 'package:meals_app/providers/cart.dart';
import 'package:meals_app/screens/cart_screen.dart';
import 'package:meals_app/widgets/badge.dart';
import 'package:meals_app/widgets/products_grid.dart';
import 'package:provider/provider.dart';

enum FilterOptions { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showFavoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My restoraunt'),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOptions selectedOption) {
                setState(() {
                  if (selectedOption == FilterOptions.All) {
                    _showFavoritesOnly = false;
                  } else {
                    _showFavoritesOnly = true;
                  }
                });
              },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      value: FilterOptions.Favorites,
                      child: Text('Only Favorites'),
                    ),
                    const PopupMenuItem(
                      value: FilterOptions.All,
                      child: Text("Show All"),
                    )
                  ]),
          Consumer<Cart>(
              builder: (context, cart, child) => Badge(
                    value: cart.items.length.toString(),
                    child: IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () => {
                        Navigator.of(context).pushNamed(CartScreen.routeName)
                      },
                    ),
                  ))
        ],
      ),
      body: ProductsGrid(_showFavoritesOnly),
    );
  }
}
