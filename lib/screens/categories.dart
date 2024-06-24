//* This file contains all the Categories of Meals that'll be stored and also contains Navigation method 
import 'package:flutter/material.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key,required this.availableMeals});//! Do not forget to add required with the new function onToggleFavourites that we created in mealdetails and applied across meals and categories.dart 

  /////final void Function(Meal meal) onToggleFavourite; //# This is a function that will be called when a meal is added to favourites

  final List<Meal> availableMeals; //? available meals is defined inside tabs.dart  in line 77 , it handles filter function and make sure only those meals diaplays that corresponds to the filters 

void _selectcategory(BuildContext context, Category category){   //? This is responsible for Navigation from Home Screen to Meals Screen  
//! Make sure to not forget to write Category category inside the void function 

final filteredMeals=availableMeals.where((meal) => meal.categories.contains(category.id)).toList();  //# This is a Navigation Method which'll take care of Navigation Between Home screen and Meal Screen ,This will be updated to show filteredmeals insted of dummy meals

  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Mealscreen(meals: filteredMeals, title:category.title,))); //? This is the function that will be called when a category is selected it will navigate to the next screen //Make sure to connect this with filtered meals and in tiltle write category.title
}///! Make Sure to specify this onToggleFavouites and in this field write onToggleFavourite 



  @override
  Widget build(BuildContext context) {  
    return  //* No scaffold here because we are displaying this screen via tabs.dart and that screen takes care of Scaffold 
       GridView( padding: EdgeInsets.all(24), //? This is the padding of the grid view to make sure it is not stuck to the edges
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( //? This is a grid view that will display all the categories
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(category: category,onSelectCategory:(){_selectcategory(context,category);} ,) //! Do not forget to write category inside _selectcategory next to context
        ],  //? onSelectCategory is defined insode category_grid.dart
      );
  }
}
