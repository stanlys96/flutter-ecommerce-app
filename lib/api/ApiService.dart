import 'package:dio/dio.dart';

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
}
