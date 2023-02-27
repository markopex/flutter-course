import 'package:flutter/material.dart';
import 'package:meals_app/providers/cart.dart';
import 'package:meals_app/providers/product.dart';
import 'package:provider/provider.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem(
      {required this.id,
      required this.amount,
      required this.products,
      required this.dateTime});
}

class Orders with ChangeNotifier {
  List<OrderItem> _items = [];

  List<OrderItem> get items {
    return [..._items];
  }

  void addOrder(List<CartItem> products, double total) {
    final newOrderItem = OrderItem(
      id: DateTime.now().toString(),
      amount: total,
      products: products,
      dateTime: DateTime.now(),
    );
    _items.insert(0, newOrderItem);
    notifyListeners();
  }
}
