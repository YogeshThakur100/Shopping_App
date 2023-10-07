import 'package:flutter/material.dart';
import 'package:shopapp/global_variable.dart';
import 'package:shopapp/product_cart.dart';
import 'package:shopapp/products_cart_details.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ["All", "Adidas", "Nike", "Puma"];

  // ignore: non_constant_identifier_names
  late String SelectedFiletrs;

  @override
  void initState() {
    super.initState();
    SelectedFiletrs = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Shoes\nCollection",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(50),
                    )),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {});
                      SelectedFiletrs = filter;
                    },
                    child: Chip(
                      label: Text(filter),
                      backgroundColor: SelectedFiletrs == filter
                          ? Theme.of(context).colorScheme.primary
                          : Color.fromARGB(255, 239, 238, 238),
                      labelStyle: const TextStyle(
                        fontSize: 16,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: product.length,
              itemBuilder: (context, index) {
                final products = product[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductDeatilsPage(product: products);
                        },
                      ),
                    );
                  },
                  child: Product_card(
                    text: products['title'] as String,
                    price: products['price'] as double,
                    image: products['imageURL'] as String,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
