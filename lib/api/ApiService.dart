import 'package:dio/dio.dart';
import 'package:ecommerce_app/models/AddFavorite.dart';
import 'package:ecommerce_app/models/AddOrder.dart';
import 'package:ecommerce_app/models/AddToCart.dart';
import 'package:ecommerce_app/models/AdminChats.dart';
import 'package:ecommerce_app/models/Chat.dart';
import 'package:ecommerce_app/models/DeleteCart.dart';
import 'package:ecommerce_app/models/DeleteFavorite.dart';
import 'package:ecommerce_app/models/Login.dart';
import 'package:ecommerce_app/models/OrderDetail.dart';
import 'package:ecommerce_app/models/Product.dart';
import 'package:ecommerce_app/models/Register.dart';
import 'package:ecommerce_app/models/UpdateCart.dart';
import 'package:ecommerce_app/models/UserCart.dart';
import 'package:ecommerce_app/models/UserFavorites.dart';

class ApiService {
  Dio dio = Dio();

  Future<RegisterResponse?> register(name, email, password) async {
    try {
      Response response = await dio.post(
        'http://localhost:3001/flutter-ecommerce/users/register',
        // 'http://localhost:3001/flutter-ecommerce/users/register',
        data: {"name": name, "email": email, "password": password},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      RegisterResponse result = RegisterResponse.fromJson(response.data);
      return result;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<LoginModel?> login(email, password) async {
    try {
      Response response = await dio.post(
        'http://localhost:3001/flutter-ecommerce/users/login',
        data: {"email": email, "password": password},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      LoginModel result = LoginModel.fromJson(response.data);
      return result;
    } catch (e) {
      print(e);
      print("!!!!");
    }
    return null;
  }

  Future<ProductResponseModel?> getAllProducts() async {
    try {
      Response response = await dio.get(
        'http://localhost:3001/flutter-ecommerce/products/getAllProducts',
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      ProductResponseModel result =
          ProductResponseModel.fromJson(response.data);
      return result;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<ProductResponseModel?> getProductsByCategory(String category) async {
    try {
      Response response = await dio.get(
        'http://localhost:3001/flutter-ecommerce/products/getProducts/$category',
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      ProductResponseModel result =
          ProductResponseModel.fromJson(response.data);
      return result;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<UserFavoritesModel?> getUserFavorites(int userId) async {
    try {
      Response response = await dio.get(
        'http://localhost:3001/flutter-ecommerce/favorites/getFavorites/$userId',
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      UserFavoritesModel result = UserFavoritesModel.fromJson(response.data);
      return result;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<AddFavoriteResponse?> addToFavorites(int userId, int productId) async {
    try {
      Response response = await dio.post(
        'http://localhost:3001/flutter-ecommerce/favorites/addToFavorites',
        data: {"user_id": userId, "product_id": productId},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      AddFavoriteResponse result = AddFavoriteResponse.fromJson(response.data);
      return result;
    } catch (e) {
      print(e);
    }
  }

  Future<DeleteFavoriteResponse?> deleteFavorite(
      int userId, int productId) async {
    try {
      Response response = await dio.delete(
        'http://localhost:3001/flutter-ecommerce/favorites/deleteFavorite',
        data: {
          "user_id": userId,
          "product_id": productId,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      DeleteFavoriteResponse result =
          DeleteFavoriteResponse.fromJson(response.data);
      return result;
    } catch (e) {
      print(e);
    }
  }

  Future<AddToCartResponse?> addToCart(
      int userId, int productId, int amount) async {
    try {
      Response response = await dio.post(
        'http://localhost:3001/flutter-ecommerce/cart/addToCart',
        data: {
          "user_id": userId,
          "product_id": productId,
          "amount": amount,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      AddToCartResponse result = AddToCartResponse.fromJson(response.data);
      return result;
    } catch (e) {
      print(e);
    }
  }

  Future<UserCartResponseModel?> getUserCart(int userId) async {
    try {
      Response response = await dio.get(
        'http://localhost:3001/flutter-ecommerce/cart/getCart/$userId',
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      UserCartResponseModel result =
          UserCartResponseModel.fromJson(response.data);
      return result;
    } catch (e) {
      print(e);
    }
  }

  Future<OrderDetailResponseModel?> getUserOrders(int userId) async {
    try {
      Response response = await dio.get(
        'http://localhost:3001/flutter-ecommerce/orders/getOrders/$userId',
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      OrderDetailResponseModel result =
          OrderDetailResponseModel.fromJson(response.data);
      return result;
    } catch (e) {
      print(e);
    }
  }

  Future<UpdateCartResponse?> updateCart(
      int userId, int productId, int amount) async {
    try {
      Response response = await dio.put(
        'http://localhost:3001/flutter-ecommerce/cart/updateCart',
        data: {
          "user_id": userId,
          "product_id": productId,
          "amount": amount,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      UpdateCartResponse result = UpdateCartResponse.fromJson(response.data);
      return result;
    } catch (e) {
      print(e);
    }
  }

  Future<DeleteCartResponse?> deleteCart(int userId, int productId) async {
    try {
      Response response = await dio.delete(
        'http://localhost:3001/flutter-ecommerce/cart/deleteCart',
        data: {
          "user_id": userId,
          "product_id": productId,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      DeleteCartResponse result = DeleteCartResponse.fromJson(response.data);
      return result;
    } catch (e) {
      print(e);
    }
  }

  Future<DeleteCartResponse?> deleteAllCart(int userId) async {
    try {
      Response response = await dio.delete(
        'http://localhost:3001/flutter-ecommerce/cart/deleteAllCart',
        data: {
          "user_id": userId,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      DeleteCartResponse result = DeleteCartResponse.fromJson(response.data);
      return result;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<AddOrderResponse?> addOrder(
      String orderNumber,
      String trackingNumber,
      String status,
      String shippingAddress,
      String paymentMethod,
      String cardNumber,
      String deliveryMethod,
      int deliveryFee,
      int discount,
      int totalAmount,
      dynamic products,
      int userId) async {
    try {
      Response response = await dio.post(
        'http://localhost:3001/flutter-ecommerce/orders/addOrder',
        // 'http://localhost:3001/flutter-ecommerce/orders/addOrder',
        data: {
          "order_number": orderNumber,
          "tracking_number": trackingNumber,
          "status": status,
          "shipping_address": shippingAddress,
          "payment_method": paymentMethod,
          "card_number": cardNumber,
          "delivery_method": deliveryMethod,
          "delivery_fee": deliveryFee,
          "discount": discount,
          "total_amount": totalAmount,
          "products": products,
          "user_id": userId
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      AddOrderResponse result = AddOrderResponse.fromJson(response.data);
      return result;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<ChatResponseModel?> getUserChat(int userId) async {
    try {
      Response response = await dio
          .get('http://localhost:3001/flutter-ecommerce/chat/getChat/$userId');
      ChatResponseModel result = ChatResponseModel.fromJson(response.data);
      return result;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<AdminChatsResponseModel?> getAdminChats(int userId) async {
    try {
      Response response = await dio.get(
          'http://localhost:3001/flutter-ecommerce/users/getAdminChats/$userId');
      AdminChatsResponseModel result =
          AdminChatsResponseModel.fromJson(response.data);
      return result;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
