import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Cart_Provider.dart';
import 'package:shopapp/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => cartProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Shopping App",
          theme: ThemeData(
            fontFamily: "Lato",
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 255, 230, 0),
              primary: const Color.fromARGB(255, 255, 230, 0),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              prefixIconColor: Colors.black,
            ),
            textTheme: const TextTheme(
                titleMedium: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                titleSmall: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                )),
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            useMaterial3: true,
          ),
          home: const Homepage()),
    );
  }
}
