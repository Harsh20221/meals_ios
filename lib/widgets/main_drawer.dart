import 'package:flutter/material.dart';
//* This FileContains The Code for The App Drawer Widget 
class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key,required this.onSelectScreen});
  final void Function(String identifier) onSelectScreen; //? This'll keep a Tarack of the Saved Screen 
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: Row(
              children: [
                Icon(Icons.fastfood,
                    size: 48, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 18),
                Text(
                  "Cooking Up!",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ], 
            ),
          )
       ,  ListTile(   //!VERYIMP---! DO NOT ENCLOSE THE LISTTILE INSIDE THE ABOVE ROW CHILDREN AS THAT ROW DESCRIBES THE HEADING AND IF YOU ENCLOSE THE OTHER LIST ITEMS INSIDE IT THEN IT'LL NOT RUN PROPERLY WITHOUT GIVING ERROR 
                  leading: Icon(Icons.restaurant,
                      size: 26,
                      color: Theme.of(context).colorScheme.onBackground),
                  title: Text('Meals',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 24)),
                  onTap: () {onSelectScreen('meals');},
                ),
              ListTile(
                  leading: Icon(Icons.restaurant,
                      size: 26,
                      color: Theme.of(context).colorScheme.onBackground),
                  title: Text('Filters',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 24)),
                  onTap: () {onSelectScreen('filters');}, //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!IF YOU WRITE filters as Filters then use it here then code will give error and wuill take up your sleep so  please do not do that or get ready to be fucked and lose your sleep
                ) ],
      ),
    );
  }
}
