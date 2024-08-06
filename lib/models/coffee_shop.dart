import 'package:flutter/material.dart';
import 'coffee.dart';

class CoffeeShop extends ChangeNotifier {
  final List<Coffee> _shop = [
    Coffee(
        name: "Black coffee",
        price: "4.5",
        imagepath: "assets/Blak Coffee.png"),
    Coffee(name: "latte", price: "4.3", imagepath: "assets/Latte.png"),
    Coffee(name: "Espresso", price: "4.6", imagepath: "assets/Espresso.png"),
    Coffee(
        name: "Iced Coffee", price: "4.1", imagepath: "assets/Cold Coffee.png"),
  ];
  final List<Coffee> _userCart = [];
  List<Coffee> get coffeeShop => _shop;
  List<Coffee> get userCart => _userCart;
  void addItemCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  void removeItemCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
