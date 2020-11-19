import 'package:flutter/material.dart';
import '../helpers/restaurant.dart';
import '../models/restaurant.dart';

class RestaurantProvider with ChangeNotifier {
  RestaurantService _restaurantService = RestaurantService();
  List<RestaurantModel> restaurants = [];

  RestaurantProvider.initialize() {
    _loadRestaurants();
  }

  _loadRestaurants() async {
    restaurants = await _restaurantService.getRestaurants();
    notifyListeners();
  }
}
