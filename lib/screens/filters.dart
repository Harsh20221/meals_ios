import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';

 //* This file contains the filter screen  and it uis connected to riverpod Providers 
 
class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});
  @override
  Widget build(BuildContext context ,WidgetRef ref ) {
    final activefilters=ref.watch(filtersprovider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body:
       Column(
          children: [
            SwitchListTile(
              value: activefilters[Filter.glutenFree]!, //! DO NOT FORGET this ! after [Filter.glutenFree]
              onChanged: (ischecked) { ref.read(filtersprovider.notifier).setFilter(Filter.glutenFree, ischecked);
              }, //? is Checked will check if the ToggleButton is pressed on or off 
              title: Text(
                "Gluten Free",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: const Text("Only includes Gluten-Free Meals "),
              activeColor: Theme.of(context).colorScheme.tertiary,
            )
          ,  SwitchListTile(
              value: activefilters[Filter.lactoseFree]!,
              onChanged: (ischecked) {ref.read(filtersprovider.notifier).setFilter(Filter.lactoseFree, ischecked);}, 
              title: Text(
                "Lactose Free ",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: const Text("Only includes Lactose-Free Meals "),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),  SwitchListTile(
              value: activefilters[Filter.vegetarian]!,
              onChanged: (ischecked) {
              ref.read(filtersprovider.notifier).setFilter(Filter.vegetarian, ischecked);}, 
              title: Text(
                "Vegetarian",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: const Text("Only includes Vegetarian Meals "),
              activeColor: Theme.of(context).colorScheme.tertiary,
             ), SwitchListTile(
              value:activefilters[Filter.vegan]!,
              onChanged: (ischecked)  {
              ref.read(filtersprovider.notifier).setFilter(Filter.vegan, ischecked);  }, 
              title: Text(
                "Vegan",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: const Text("Only includes Vegan  Meals "),
              activeColor: Theme.of(context).colorScheme.tertiary,
            )],
        ),
      );
  }}