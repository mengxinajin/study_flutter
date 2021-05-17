import'package:dio/dio.dart';
class HTTPConfig {
  static const baseURL = "https://r.inews.qq.com/"; //域名
  static const timeout = 10000; //超时时间
}

class HttpRequest {
  static final BaseOptions options = BaseOptions(
      baseUrl: HTTPConfig.baseURL, connectTimeout: HTTPConfig.timeout);
  static final Dio dio = Dio(options);

  static Future<T> request<T>(String path,
      {String method = 'get', Map<String, dynamic> params, Interceptor inter}) async {
    // 1.请求的单独配置
    final options = Options(method: method);
    // 2.发送网络请求
    try {
      Response response = await dio.request<T>(path, queryParameters: params, options: options);
      print(response.data);
      return response.data;
    } on DioError catch(e) {
      return Future.error(e);
    }
  }
}