import 'package:coffe_shop/models/coffee.dart';
import 'package:coffe_shop/models/coffee_shop.dart';
import 'package:coffe_shop/pages/coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemCart(coffee);
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text("Successfully adedd to cart"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: (context, value, child) => SafeArea(
              child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      const Text(
                        "enjoy your coffee",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: value.coffeeShop.length,
                            itemBuilder: (context, index) {
                              Coffee eachCoffee = value.coffeeShop[index];
                              return CoffeeTile(
                                coffee: eachCoffee,
                                icon: const Icon(Icons.delete),
                                onPressed: () => addToCart(eachCoffee),
                              );
                            }),
                      )
                    ],
                  )),
            ));
  }
}
