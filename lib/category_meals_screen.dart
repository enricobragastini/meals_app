import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("The Recipes")),
        body: const Center(
          child: Text("The recipes for this Category"),
        ));
  }
}
