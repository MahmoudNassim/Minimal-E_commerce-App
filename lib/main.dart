import 'package:e_commerce_app/model/shop.dart';
import 'package:e_commerce_app/pages/cart_page.dart';
import 'package:e_commerce_app/pages/home_page.dart';
import 'package:e_commerce_app/pages/intro_page.dart';
import 'package:e_commerce_app/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/intro_page': (context) => const IntroPage(),
          '/home_page': (context) => const HomePage(),
           '/cart_page': (context) => const CartPage(),

        },
        theme: lightTheme,
        home: const IntroPage());
  }
}
