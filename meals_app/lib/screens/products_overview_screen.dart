import 'package:flutter/material.dart';
import 'package:meals_app/widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My restoraunt')),
      body: ProductsGrid(),
    );
  }
}
