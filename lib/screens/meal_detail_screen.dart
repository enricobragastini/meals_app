import 'package:flutter/material.dart';

import 'package:meals/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";
  final void Function(String) toggleFavourite;
  final bool Function(String) isFavourited;

  const MealDetailScreen(
      {Key? key, required this.toggleFavourite, required this.isFavourited})
      : super(key: key);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildContainer(Widget child, double height) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: height,
      width: 350,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((element) {
      return element.id == mealId;
    });

    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                )),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(
                ListView.builder(
                    itemCount: selectedMeal.ingredients.length,
                    itemBuilder: (ctx, index) {
                      return Card(
                        color: Colors.amber,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Text(selectedMeal.ingredients[index]),
                        ),
                      );
                    }),
                200),
            buildSectionTitle(context, "Steps"),
            buildContainer(
                ListView.builder(
                    itemCount: selectedMeal.steps.length,
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: [
                          ListTile(
                            leading:
                                CircleAvatar(child: Text("# ${(index + 1)}")),
                            title: Text(
                              selectedMeal.steps[index],
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          const Divider()
                        ],
                      );
                    }),
                300),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavourited(mealId) ? Icons.star : Icons.star_border),
        onPressed: () {
          toggleFavourite(mealId);
        },
      ),
    );
  }
}
