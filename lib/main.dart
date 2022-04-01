import 'package:flutter/material.dart';

import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/category_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';

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
      // home: const CategoriesScreen(),

      initialRoute: '/', // default value is '/'
      routes: {
        "/": (ctx) => const CategoriesScreen(),
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen()
      },
    );
  }
}
