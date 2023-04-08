import 'package:dio/dio.dart';
import 'package:ecommerce_app/models/Login.dart';

class ApiService {
  Dio dio = Dio();

  Future<void> register(name, email, password) async {
    try {
      Response response = await dio.post(
        'https://ecommerce-furniture.herokuapp.com/flutter-ecommerce/users/register',
        data: {"name": name, "email": email, "password": password},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      print(response);
      print("???");
    } catch (e) {
      print(e);
    }
  }

  Future<LoginModel?> login(email, password) async {
    try {
      Response response = await dio.post(
        'https://ecommerce-furniture.herokuapp.com/flutter-ecommerce/users/login',
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
}
