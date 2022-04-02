import 'package:flutter/material.dart';

import 'package:meals/screens/category_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/tabs_screen.dart';

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
                color: Colors.black, fontFamily: "Raleway", fontSize: 18),
            titleMedium: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontFamily: "RobotoCondensed",
              fontWeight: FontWeight.bold,
            )),
      ),
      // home: const CategoriesScreen(),

      initialRoute: '/', // default value is '/'
      routes: {
        "/": (ctx) => const TabsScreen(),
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen()
      },

      // Method called when pushing an unregistered route (or a dynamically generated route)
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // return MaterialPageRoute(
        //   builder: (context) => const CategoriesScreen(),
        // );
      },

      // Method called when flutter fails to build a screen with all other routes settings
      // It's a fallback that avoids leaving the user with a crashed app
      onUnknownRoute: (settings) {
        // return MaterialPageRoute(
        //   builder: (context) => const CategoriesScreen(),
        // );
      },
    );
  }
}
