import 'package:dio/dio.dart';

class ApiServices {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.stripe.com/v1/',
      ),
    );
  }

  Future<Response> postData({
    required String path,
    required Map<String,dynamic> data ,
    required String token ,
    String? contentType ,
    Map<String,dynamic>? headers ,
  }) async{
    return await dio.post(
      path,
      data: data,
      options: Options(
        contentType: contentType,
        headers: headers ?? {
          'Authorization' : "Bearer $token",
        },
      ),
    );
  }
}
