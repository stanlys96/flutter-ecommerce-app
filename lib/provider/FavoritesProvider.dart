import 'package:ecommerce_app/api/ApiService.dart';
import 'package:ecommerce_app/models/Login.dart';
import 'package:ecommerce_app/models/UserFavorites.dart';
import 'package:ecommerce_app/utils/helper.dart';
import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  ApiService apiService = ApiService();
  int userId = -1;
  List<UserFavorite>? currentUserFavorites = [];
  bool isLoading = false;

  void init() async {
    try {
      isLoading = true;
      LoginModel? login = await getUser();
      userId = login?.userId ?? -1;
      notifyListeners();
      UserFavoritesModel? userFavorites =
          await apiService.getUserFavorites(userId);
      currentUserFavorites = userFavorites?.data ?? [];
      isLoading = false;
    } catch (e) {
      isLoading = false;
      print(e);
    }
    notifyListeners();
  }
}
