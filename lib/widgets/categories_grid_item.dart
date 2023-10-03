import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoriesGridItem extends StatelessWidget {
  const CategoriesGridItem({
    super.key,
    required this.modelcategory,
    required this.onSelectCategory,
  });

  final ModelCategory modelcategory;
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              modelcategory.color.withOpacity(0.55),
              modelcategory.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          modelcategory.title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
