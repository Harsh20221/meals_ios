import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
//* This file will be used to create the category grid item widget that will be used to display the category items in the category screen , This'll contain the  text of the category
class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({required this.category, required this.onSelectCategory});
  final Category category;
  final void Function() onSelectCategory; //! Make sure to write function with F in Capital 
  //?This void Function is a function which when executes changes screen  , This function is used in categories.dart 

  @override

  ///! Make sure to write override's starting letter in small not capital
  Widget build(BuildContext context) {
    return InkWell(
      //# This inkwell widget helps to get a Tapping effect on the grid items , In easier words we can say that IT converts grid items to Buttons
      onTap: onSelectCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration( borderRadius: BorderRadius.circular(16), //?Set border radius inside the container to get circular Grid of items 
            gradient: LinearGradient(colors: [
          category.color.withOpacity(0.55),
          category.color.withOpacity(0.9)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Text(category.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground)),
      ),
    );
  }
}
