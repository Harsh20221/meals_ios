import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favourites_providers.dart';

//* This File Contains the Meal Details Screen 
//* This is now connected with Riverpod 
class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({super.key, required this.meal,});
  final Meal meal;
 //////////////////// final void Function(Meal meal) onToggleFavourite;  //? Do not write () after ontoggle Favourite as we are assigning it and not using it 

  @override
  Widget build(BuildContext context,WidgetRef ref ) {
    final favoritemeals = ref.watch(favouriteMealsProvider); //todo: These are imported from Riverpod providers 
    final isfavourite=favoritemeals.contains(meal); 
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          actions: [IconButton(onPressed: () {final wasadded= ref.read(favouriteMealsProvider.notifier).togglemealfavouritestatus(meal);
          ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(wasadded?'Meal Added as Favourite': 'Meal Removed as Favourite '),)); //? Using terinary operator to display message if meal is added or not added 
          
          
          
          
          }, icon: Icon(isfavourite?Icons.star:Icons.star_border))], ///* This'll display filled or  empty star icon based on meal favourite status 
        ), //# Added favourite Icon for tabs
        body: ListView(
          //? Displays Meal Details in ListView
          children: [
            Image.network(
              //? Gets Image of Meal through URL
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 14),

            Text('Ingredients', //? This Is  A Title Foe Meal Ingredients
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 14),
            for (final ingredients in meal
                .ingredients) //? This is the contents for Meal Preperation ingredients
              Text(
                ingredients,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            const SizedBox(height: 14),
            Text(
                'Steps', //? This is a Title  for Meal Preperation Steps in Meal Details
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 14),
            for (final step
                in meal.steps) //? These are Contents for Meal Preperation Steps
              Padding(
                //! Make sure to enclose all the Data Inside Padding itself using a child Widghet else it will  Give An Error
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: Text(
                  step,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              )
          ],
        ));
  }
}
