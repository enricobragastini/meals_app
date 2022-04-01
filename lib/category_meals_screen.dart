import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  const CategoryMealScreen(
      {Key? key, required this.categoryId, required this.categoryTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle)),
        body: const Center(
          child: Text("The recipes for this Category"),
        ));
  }
}
