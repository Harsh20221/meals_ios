import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class favouriteMealsNotifier extends StateNotifier<List<Meal>> {
  favouriteMealsNotifier()
      : super(
            []); //? This is the Constructor function , Through Which the Initial List will be accessed

  bool togglemealfavouritestatus(Meal meal) {
    final mealIsFavourite =
        state.contains(meal); //? This'll check if a meal is Favoirite or Not
    if (mealIsFavourite) {
      state = state
          .where((m) => m.id != meal.id)
          .toList(); //? This is used for removing the meal
          return false;
    } else {
      state = [...state, meal];
return true;
      ///?This is used for adding to meal list
    }
  }
}

final favouriteMealsProvider =  ///? This'll finally Return The Favourite Meals 
    StateNotifierProvider<favouriteMealsNotifier, List<Meal>>((ref) {
  return favouriteMealsNotifier();
});
