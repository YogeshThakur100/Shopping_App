import 'package:flutter/material.dart';

// ignore: camel_case_types
class Product_card extends StatelessWidget {
  final String text;
  final double price;
  final String image;
  const Product_card({
    super.key,
    required this.text,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(216, 240, 253, 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 5),
          Text('\$$price', style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 5),
          Center(
            child: Image(
              image: AssetImage(image),
              height: 175,
            ),
          )
        ],
      ),
    );
  }
}
