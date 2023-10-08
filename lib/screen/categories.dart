import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/model_detail_meal.dart';
import 'package:meals_app/screen/meals.dart';
import 'package:meals_app/widgets/categories_grid_item.dart';
import 'package:meals_app/models/category.dart';

class Categories extends StatefulWidget {
  const Categories({
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>
    with SingleTickerProviderStateMixin {
  // ANIMASI eksplisit
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    // INISIASI ANIMASI eksplisit
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _selectCategory(BuildContext context, ModelCategory category) {
    final filteredMeals = widget.availableMeals
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
    return AnimatedBuilder(
        animation: _animationController,
        child: GridView(
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
        ),
        // Explisit Animasi
        builder: (context, child) => SlideTransition(
              position: Tween(
                begin: const Offset(0, 0.3),
                end: const Offset(0, 0),
              ).animate(
                CurvedAnimation(
                    parent: _animationController, curve: Curves.easeInOut),
              ),
              child: child,
            ));
  }
}
