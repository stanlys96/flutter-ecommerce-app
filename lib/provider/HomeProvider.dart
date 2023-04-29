import 'package:ecommerce_app/api/ApiService.dart';
import 'package:ecommerce_app/models/AddFavorite.dart';
import 'package:ecommerce_app/models/AdminChats.dart';
import 'package:ecommerce_app/models/Chat.dart';
import 'package:ecommerce_app/models/DeleteFavorite.dart';
import 'package:ecommerce_app/models/Login.dart';
import 'package:ecommerce_app/models/OrderDetail.dart';
import 'package:ecommerce_app/models/Product.dart';
import 'package:ecommerce_app/models/UserCart.dart';
import 'package:ecommerce_app/models/UserFavorites.dart';
import 'package:ecommerce_app/utils/helper.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool isLoading = false;
  ApiService apiService = ApiService();
  int userId = -1;
  String email = "";
  String name = "";
  bool admin = false;

  List<Product> allProducts = [];

  List<Product> newProducts = [];
  List<Product> saleProducts = [];
  List<Product> clothesProducts = [];
  List<UserCart>? userCart = [];

  List<UserFavorite>? currentUserFavorites = [];
  List<OrderDetail>? currentUserOrders = [];
  List<Chat>? currentUserChat = [];
  List<AdminChat>? adminChats = [];

  HomeProvider() {
    init();
  }

  void init() async {
    isLoading = true;
    try {
      LoginModel? login = await getUser();
      userId = login?.userId ?? -1;
      email = login?.email ?? "";
      name = login?.name ?? "";
      admin = login?.admin ?? false;
      ProductResponseModel? result = await apiService.getAllProducts();
      UserCartResponseModel? userCartResult =
          await apiService.getUserCart(userId);
      UserFavoritesModel? userFavorites =
          await apiService.getUserFavorites(userId);

      OrderDetailResponseModel? userOrders =
          await apiService.getUserOrders(userId);

      ChatResponseModel? userChat = await apiService.getUserChat(userId);

      if (admin) {
        AdminChatsResponseModel? result =
            await apiService.getAdminChats(userId);
        adminChats = result?.data ?? [];
      }

      currentUserChat = userChat?.data ?? [];
      (currentUserChat ?? []).sort((a, b) {
        return (a.messageSent ?? "").compareTo(b.messageSent ?? "");
      });

      currentUserFavorites = userFavorites?.data ?? [];

      allProducts = result?.data ?? [];
      newProducts =
          allProducts.where((element) => element.category == "new").toList();
      saleProducts =
          allProducts.where((element) => element.category == "sale").toList();
      clothesProducts = allProducts
          .where((element) => element.productType == "clothes")
          .toList();
      userCart = userCartResult?.data ?? [];

      currentUserOrders = userOrders?.data ?? [];

      isLoading = false;
    } catch (e) {
      print(e);
      isLoading = false;
    }
    isLoading = false;
    notifyListeners();
  }

  void setIsLoading(bool newValue) {
    isLoading = newValue;
    notifyListeners();
  }

  Future<void> refetchFavorites() async {
    UserFavoritesModel? userFavorites =
        await apiService.getUserFavorites(userId);
    currentUserFavorites = userFavorites?.data ?? [];
    notifyListeners();
  }

  Future<void> refetchUserCart() async {
    UserCartResponseModel? userCartResult =
        await apiService.getUserCart(userId);
    userCart = userCartResult?.data ?? [];
    notifyListeners();
  }

  Future<void> refetchProducts() async {
    ProductResponseModel? result = await apiService.getAllProducts();
    allProducts = result?.data ?? [];
    newProducts =
        allProducts.where((element) => element.category == "new").toList();
    saleProducts =
        allProducts.where((element) => element.category == "sale").toList();
    clothesProducts = allProducts
        .where((element) => element.productType == "clothes")
        .toList();
    notifyListeners();
  }

  Future<void> refetchOrders() async {
    OrderDetailResponseModel? userOrders =
        await apiService.getUserOrders(userId);
    currentUserOrders = userOrders?.data ?? [];
    notifyListeners();
  }

  Future<void> addToFavorite(int userId, int productId) async {
    AddFavoriteResponse? result =
        await apiService.addToFavorites(userId, productId);
    if (result?.msg == "Success") {
      await refetchFavorites();
    }
  }

  Future<void> deleteFavorite(int userId, int productId) async {
    DeleteFavoriteResponse? result =
        await apiService.deleteFavorite(userId, productId);
    if (result?.msg == "Success") {
      await refetchFavorites();
    }
  }

  Future<void> refetchUserChat(int userId) async {
    ChatResponseModel? result = await apiService.getUserChat(userId);
    if (result?.msg == "success") {
      currentUserChat = result?.data ?? [];
      (currentUserChat ?? []).sort((a, b) {
        return (a.messageSent ?? "").compareTo(b.messageSent ?? "");
      });
    }
    notifyListeners();
  }

  Future<void> refetchAdminChats(int userId) async {
    AdminChatsResponseModel? result = await apiService.getAdminChats(userId);
    adminChats = result?.data ?? [];
    notifyListeners();
  }

  Future<void> refetchAll({bool relogin = false}) async {
    setIsLoading(true);
    if (relogin) {
      LoginModel? login = await getUser();
      userId = login?.userId ?? -1;
      email = login?.email ?? "";
      name = login?.name ?? "";
      admin = login?.admin ?? false;
    }
    if (admin) {
      refetchAdminChats(userId);
    }
    refetchProducts();
    refetchUserCart();
    refetchFavorites();
    refetchOrders();
    setIsLoading(false);
  }
}
