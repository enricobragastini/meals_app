import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DeliMeal')),
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map((catData) {
          return CategoryItem(
              id: catData.id, title: catData.title, color: catData.color);
        }).toList(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, // max width of tile elements
            childAspectRatio: 3 / 2, // height:width relation of tiles
            crossAxisSpacing: 20, // spacing between column
            mainAxisSpacing: 20), // and rows
      ),
    );
  }
}
