import 'package:e_commerce_app/model/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
        name: 'Hoodie ',
        description: 'Item description',
        price: 99.5,
        imagePath: 'assets/Hoodie.png'),
    Product(
        name: 'Sneaker',
        description: 'Item description',
        price: 40.5,
        imagePath: 'assets/Sneaker.png'),
    Product(
        name: 'Rolex ',
        description: 'Item description',
        price: 70.5,
        imagePath: 'assets/Rollex.png'),
    Product(
        name: 'MackBook Air M1',
        description: 'Item description',
        price: 100.5,
        imagePath: 'assets/MackBook.png'),
  ];

  final List<Product> _cart = [];
  // get product List
  List<Product> get shop => _shop;
  //get user cart
  List<Product> get cart => _cart;
  // Add to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //Remove from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
