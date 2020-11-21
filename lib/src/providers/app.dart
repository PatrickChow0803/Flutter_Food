import 'package:flutter/material.dart';

enum SearchBy { PRODUCTS, RESTAURANTS }

class AppProvider with ChangeNotifier {
  bool isLoading = false;
  SearchBy search = SearchBy.PRODUCTS;

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void changeSearchBy({SearchBy newSearchBy}) {
    search = newSearchBy;
    notifyListeners();
  }
}
