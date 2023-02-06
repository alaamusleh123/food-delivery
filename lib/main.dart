import 'package:flutter/material.dart';
import 'package:food_delivery/home/main_food_page.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/main_food_page',
      routes: {
        '/main_food_page': (context) =>MainFoodPage(),
      },
    );
  }
}
