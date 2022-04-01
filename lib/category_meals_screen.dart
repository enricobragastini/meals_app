import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;

  // const CategoryMealScreen(
  //     {Key? key, required this.categoryId, required this.categoryTitle})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title']!;
    final categoryId = routeArgs['id']!;

    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle)),
        body: Center(
          child: Text("The recipes for the " + categoryTitle + " Category"),
        ));
  }
}
