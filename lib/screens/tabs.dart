

import 'package:flutter/material.dart';
import 'package:meals/providers/favourites_providers.dart';
////////import 'package:meals/data/dummy_data.dart';
///* Dummydata Replaced with Riverpod Method 
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
//////import 'package:meals/models/meal.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';
/////import 'package:meals/screens/filters.dart';
import'package:meals/providers/filters_provider.dart';
//* This File Is responsible for Tab Based Navigation , Bottom Tabs bar 
const kInitialFilters={ //? This is a Global List of Default Filter Values 
   Filter.glutenFree:false,
         Filter.lactoseFree:false,
         Filter.vegetarian:false,
         Filter.vegan:false,
};
class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

  class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex =
      0; //? This line of code keeps track of the Selected tab

///// final List <Meal> _favouriteMeals =[];//? This list keeps favourite items inside it 
 
 /*  Map <Filter,bool> _selectedFilters = kInitialFilters; //? kinitial filters is defined here at Line 1  here k represents it's global nature , It's a Convention in Flutter to start global variables with k 

 */


void _ShowinfoMessage(String message){ //? This displays a message whenever we add an item or Remove it from the Favourites 
  
}

   /*    void _togglemealfavouritestatus(Meal meal){ //? This'll help in toggling the favourite status of the meal 
      final isexisting=_favouriteMeals.contains(meal);
      if(isexisting){
        setState(() {
          _favouriteMeals.remove(meal);
        });
        _ShowinfoMessage("Meal is No Longer A Favorite! "); //! Make sure to link the _Showinfoo Message here
      }
      else{ setState(() {
         _favouriteMeals.add(meal);
      });
      _ShowinfoMessage("Meal is Added to Favorites!"); //! In else block do not forget to enclose the entire else block in {} or else The previous statement Meal is no longer a favourite will not execute 
      }} */
      
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex =
          index; //? This helps in keeping Track of selected  tab index
    });
  }
  
void _setScreen (String identifier) async { //# this void function helps in the functioning of App Drawer and it also takes care of filters 
//! Do not forget to use async with this Function else it will give error in final result using await 
  Navigator.of(context).pop(); //? Helps to close drawer if Meals is selected while in home screen 
if(identifier=='filters'){
  
final result  = await Navigator.of(context).push<Map<Filter,bool>>(
  MaterialPageRoute(builder: (ctx) => const FiltersScreen())
);
}}

  @override
 
  Widget build(BuildContext context) {
    final meals= ref.watch(mealsProvider); //* This ref is a part of Riverpod Package and it helps us to manage the state of the Widgets Effectively , This acts like a Listener 
    final availableMeals=ref.watch(FilteredMealsProvider);
    final activefilters=ref.watch(filtersprovider);
    
    Widget activepage =
           CategoriesScreen(availableMeals:availableMeals); //# This widget function makes sure we display categories screen if the choice of tab is default or zero we can say , make sure to add available meals property and assign available meals to it here 

    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      //? This changes the Active page from Categories to Favouries if we change it from the tabs menu
      final favouritemeals=ref.watch(favouriteMealsProvider);
      activepage = Mealscreen(
        meals: favouritemeals, //!   This line make sures we use mealscreen but since list is empty so we do not display dummy data from meals screen , Do not forget to pass _favouriteMeals list here
    ); //# it'll make sure if a particular item is already favourite then remove it from favourites and if it is not favourite then add it to favourites  
      activePageTitle = 'Your Favourites ';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),drawer:MainDrawer(onSelectScreen: _setScreen) ,//? Connect app drawer here using Main Drawer 
      body: activepage, //! The default active page is Categories screen 
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              //? Thease are widgets for displaying menu
              icon: Icon(Icons.set_meal),
              label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites')
        ],
        onTap:
            _selectPage, //! Make sure to assign selectpage function here so that the menu can be use to change Page BETWEEN Category and Favourites
     currentIndex: _selectedPageIndex, )//? This line makes sure that in our tab once we click on any selected tab the tab bar change the highlight from default to selected tab , Whichever tab will be selected will be highlighted 
    );
  }
}
