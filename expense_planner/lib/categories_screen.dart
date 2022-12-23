import 'package:expense_planner/category_item.dart';
import 'package:expense_planner/data/categories_data.dart';
import 'package:expense_planner/models/category.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: categoriesDummy
            .map((category) => CategoryItem(category.title, category.color))
            .toList(),
      ),
      appBar: AppBar(
        title: const Text("Sports"),
      ),
    );
  }
}
