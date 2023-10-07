import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Cart_Provider.dart';

class ProductDeatilsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDeatilsPage({super.key, required this.product});

  @override
  State<ProductDeatilsPage> createState() => _ProductDeatilsPageState();
}

class _ProductDeatilsPageState extends State<ProductDeatilsPage> {
  // ignore: non_constant_identifier_names
  int SelectedSize = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Deatils")),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              widget.product['title'] as String,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageURL'] as String),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$${widget.product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final size =
                          (widget.product['sizes'] as List<int>)[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {});
                            SelectedSize = size;
                          },
                          child: Chip(
                            label: Text(
                              size.toString(),
                            ),
                            backgroundColor: SelectedSize == size
                                ? Theme.of(context).colorScheme.primary
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (SelectedSize != 0) {
                        Provider.of<cartProvider>(context, listen: false)
                            .addProduct(
                          {
                            'id': widget.product['id'],
                            'title': widget.product['title'],
                            'price': widget.product['price'],
                            'sizes': SelectedSize,
                            'imageURL': widget.product['imageURL'],
                            'Company': widget.product['Company'],
                          },
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Center(
                              child: Text("Product Added to the cart"),
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Center(child: Text("please seelct the size")),
                          ),
                        );
                      }
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      size: 25,
                      color: Colors.black,
                    ),
                    label: const Text(
                      "Add To Card",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
