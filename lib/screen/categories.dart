import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/model_detail_meal.dart';
import 'package:meals_app/screen/meals.dart';
import 'package:meals_app/widgets/categories_grid_item.dart';
import 'package:meals_app/models/category.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, ModelCategory category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        // merupakan perulangan for dari availableCategories.map((modelcategory) => CategoriesGridItem(modecategory: modelcategory)).toList()
        for (final modelcategory in availableCategories)
          CategoriesGridItem(
              modelcategory: modelcategory,
              onSelectCategory: () {
                _selectCategory(context, modelcategory);
              })
      ],
    );
  }
}
