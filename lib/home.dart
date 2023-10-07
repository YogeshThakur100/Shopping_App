import 'package:flutter/material.dart';
import 'package:shopapp/cart_page.dart';
import 'package:shopapp/product_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // ignore: non_constant_identifier_names
  int Currentpage = 0;

  List<Widget> pages = const [ProductList(), Cartpage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: Currentpage, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 35,
        currentIndex: Currentpage,
        onTap: (value) {
          setState(
            () {
              Currentpage = value;
            },
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
        ],
      ),
    );
  }
}
