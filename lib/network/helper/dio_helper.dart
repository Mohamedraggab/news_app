import 'package:dio/dio.dart';

class DioHelper
{
  static Dio? dio ;

  static init()
  {
    dio = Dio(
      BaseOptions(baseUrl: 'https://newsapi.org/v2/' ,
      receiveDataWhenStatusError: true,
      ),
    );
  }


  static Future<Response> getDate({
    required String path ,
    required Map<String , dynamic> query,
}) async
  {
    return await dio!.get(path , queryParameters: query );
  }


}