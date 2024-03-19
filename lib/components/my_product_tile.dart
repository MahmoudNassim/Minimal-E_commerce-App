import 'package:e_commerce_app/model/product.dart';
import 'package:e_commerce_app/model/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.all(10),
      width: 300,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  padding: const EdgeInsets.all(25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset(
                    product.imagePath,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                product.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                product.description,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$ ${product.price.toStringAsFixed(2)}'),
              Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12)),
                  child: IconButton(
                      onPressed: () => addTocart(context),
                      icon: const Icon(Icons.add)))
            ],
          ),
        ],
      ),
    );
  }

  addTocart(context) {
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
                    context.read<Shop>().addToCart(product);
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
}
