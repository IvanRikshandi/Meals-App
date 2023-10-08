import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_data.dart';

// class provider untuk bentuk final tidak berubah
final mealsProvider = Provider((ref) => dummyMeals);
