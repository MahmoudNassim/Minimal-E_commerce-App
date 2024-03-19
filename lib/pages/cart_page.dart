import 'package:e_commerce_app/components/my_button.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:e_commerce_app/model/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text('Cart Page'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: cart.isEmpty
                  ? const Center(child: Text('Your cart is empty...'))
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final item = cart[index];
                        return ListTile(
                          title: Text(item.name),
                          subtitle: Text(
                            item.price.toStringAsFixed(2),
                          ),
                          trailing: IconButton(
                              onPressed: () => removeFromCart(context, item),
                              icon: const Icon(Icons.remove)),
                        );
                      })),
          //Pay Button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
                onTap: () => payButtonPressed(context),
                child: const Text('Pay Now')),
          )
        ],
      ),
    );
  }

  removeFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text('Add this item to your cart'),
              actions: [
                // Yes Button
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    //add item to cart
                    context.read<Shop>().removeFromCart(product);
                  },
                  child: const Text('Yes'),
                ),
                // Cancel Button
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
              ],
            ));
  }

  payButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content: Text('User wants to pay'),
            ));
  }
}
