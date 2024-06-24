import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
//* This file Contains the Methods for Riverpod Package 
final mealsProvider=Provider((ref) {
  return dummyMeals;
});