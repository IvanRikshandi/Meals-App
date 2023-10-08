import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/model_detail_meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  void toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((element) => element.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

// class untuk data yang berubah ubah
final favoriteMealsProvider = StateNotifierProvider();
