import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Cart_Provider.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = (Provider.of<cartProvider>(context).cart);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Cart")),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          // ignore: non_constant_identifier_names
          final CartItem = cart[index];

          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                CartItem['imageURL'].toString(),
              ),
              radius: 30,
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        "Delete Product",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content: const Text(
                        "Are you sure you want to remove the product from your product",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "No",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<cartProvider>(context, listen: false)
                                .removeProduct(CartItem);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Yes",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            title: Text(
              CartItem['title'].toString(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            subtitle: Text(
              'Size : ${CartItem['sizes']}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        },
      ),
    );
  }
}
