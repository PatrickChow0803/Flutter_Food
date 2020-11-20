import 'package:flutter/material.dart';
import '../helpers/restaurant.dart';
import '../models/restaurant.dart';

class RestaurantProvider with ChangeNotifier {
  RestaurantService _restaurantService = RestaurantService();
  List<RestaurantModel> restaurants = [];
  RestaurantModel restaurant;
  RestaurantProvider.initialize() {
    _loadRestaurants();
  }

  Future<void> _loadRestaurants() async {
    restaurants = await _restaurantService.getRestaurants();
    notifyListeners();
  }

  Future<void> loadSingleRestaurant({int restaurantId}) async {
    restaurant = await _restaurantService.getRestaurantById(id: restaurantId);
    notifyListeners();
  }
}
