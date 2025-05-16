// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart'; 
import '../models/product.dart'; 

class CartProvider with ChangeNotifier {
  final Map<String, int> _items = {}; 
  final Map<String, Product> _productMap = {};

  Map<String, int> get items => _items;

  List<Product> get cartProducts {
    return _items.keys.map((id) {
      return _productMap[id] ?? Product(id: '', name: 'Unknown', description: '', price: 0.0, imageUrl: '');
    }).toList();
  }

  double get totalPrice {
    double total = 0.0;
    _items.forEach((id, qty) {
      total += (_productMap[id]?.price ?? 0.0) * qty; 
    });
    return total;
  }

  void addToCart(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id] = _items[product.id]! + 1;
    } else {
      _items[product.id] = 1;
      _productMap[product.id] = product;
    }
    notifyListeners(); 
  }

  void removeFromCart(String productId) {
    _items.remove(productId);
    _productMap.remove(productId);
    notifyListeners(); 
  }

  void updateQuantity(String productId, int quantity) {
    if (quantity <= 0) {
      removeFromCart(productId); 
    } else {
      _items[productId] = quantity; 
    }
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    _productMap.clear();
    notifyListeners();
  }

  double get total => totalPrice;
  
  void notifyListeners() {}
}