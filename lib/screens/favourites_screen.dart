import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouritedMeals;

  const FavouritesScreen({Key? key, required this.favouritedMeals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favouritedMeals.isEmpty) {
      return const Center(
        child: Text("You have no favourites yet - start adding some!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favouritedMeals[index].id,
            title: favouritedMeals[index].title,
            imageUrl: favouritedMeals[index].imageUrl,
            duration: favouritedMeals[index].duration,
            complexity: favouritedMeals[index].complexity,
            affordability: favouritedMeals[index].affordability,
          );
        },
        itemCount: favouritedMeals.length,
      );
    }
  }
}
