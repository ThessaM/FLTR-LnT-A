

import 'package:flutter/material.dart';
import 'package:main_fltr_lnt_a/model/Product.dart';

class Cartprovider extends ChangeNotifier {
  final List<Product> cart = [];

  void addToCart(Product product){
    cart.add(product);
    notifyListeners();
  }

  void removeFromCart(int index){
    cart.removeAt(index);
    notifyListeners();
  }
}