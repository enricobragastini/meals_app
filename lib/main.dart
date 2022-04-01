import 'package:flutter/material.dart';

import 'package:meals/categories_screen.dart';
import 'package:meals/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.pink,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: const TextTheme(
            // bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            // bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            labelMedium: TextStyle(
                color: Colors.black, fontFamily: "Raleway", fontSize: 18)),
      ),
      home: const CategoriesScreen(),
      routes: {
        "/category-meals": (ctx) => CategoryMealScreen(),
      },
    );
  }
}
