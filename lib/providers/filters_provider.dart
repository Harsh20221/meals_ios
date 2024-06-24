import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';
enum Filter{  //* This file is responsible for Filters , This is written with Riverpod Approach and helps to keep a track of the filters applied by the user 
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan
 }
class FiltersNotifier extends StateNotifier <Map<Filter,bool>>{
  FiltersNotifier()
  :super({
Filter.glutenFree:false, //! Do not use = here to assign values you should rather use : to assign Values here 
Filter.vegetarian:false, //? These are the Initial Values that The Filters will Have 
Filter.lactoseFree:false,
Filter.vegan:false
  });


 void setFilters(Map<Filter,bool> chosenFilters){  ///! Make sure to define this func above the setilter or else it will give errors 
  state=chosenFilters;
}
void setFilter (Filter filter , bool isActive ){ //? This will check if the value of any Finter is Changed and will change the result accordingly 
state = {
  ...state , filter:isActive 
};
}
}


final filtersprovider= StateNotifierProvider<FiltersNotifier,Map<Filter,bool>>((ref) => FiltersNotifier());
final FilteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activefilters=ref.watch(filtersprovider);
  return meals.where((meal){
   //# This Here will Perform the Actual Filter operation by Checking if we have turned on or off the selected filters then loading them selectively from dummydata //UPDATE: dummymeals.where updated by meals.where to Use Providers in this Scope 
      if(activefilters[Filter.glutenFree]! &&  !meal.isGlutenFree){
        return false;
      }
      if(activefilters[Filter.lactoseFree]! &&  !meal.isLactoseFree){
        return false;
      }
       if(activefilters[Filter.vegetarian]! &&  !meal.isVegetarian){
        return false;
      }
       if(activefilters[Filter.vegan]! &&  !meal.isVegan){
        return false;
      }
      return true;
    }).toList();
  });