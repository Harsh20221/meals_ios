import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

//* This file will be used to create the meal item widget that will be used to display the meal items in the meal screen , This'll contain the  image and the text of the meal and will be used to display the meal items in the meal screen , It also contains items from meal_item_trait.dart
class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal,required this.onSelctMeal});
  final Meal meal; //? Contains data for all the meal
final void Function (Meal meal ) onSelctMeal; //# This is the function that will be called when a meal is selected
  String get complexityText {
    //? We have Created this get function to get Complexity with first Letter as capital , we are not directly displaying it inside MealitemTrait because we want 1 letter as Capital and also the fact that it is of enum type
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name
            .substring(1); //? substring displays rest of the name
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name
            .substring(1); //? substring displays rest of the name
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        child: InkWell(
          onTap: () {onSelctMeal(meal);},
          child: Stack(
            //? This is the stack widget that will be used to stack the image and the text on top of each other
            children: [
              FadeInImage(
                //# This Fade in Image will give the fade in image animation before the image loads
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl), fit: BoxFit.cover,
                height: 200, width: double.infinity,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow
                            .ellipsis, //?Using TextOverflow.elliptis will make sure that the text will be cut off if it exceeds the limit using ... at the end
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        //* We have a row inside another Row and it's not  giving error Because of postioned argument  , we have enclosed meal.duration inside {} because we want to add min word for minutes after duration
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(
                              icon: Icons.schedule,
                              label: '${meal.duration}min'),
                              const SizedBox(width: 12,), //! Do Not Forget to add these SizedBox or else the Icons for duration and other metadata will be
                          MealItemTrait(
                              icon: Icons.work, label: complexityText),
                              const SizedBox(width: 12,),
                          MealItemTrait(
                              icon: Icons.attach_money,
                              label: affordabilityText)
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
