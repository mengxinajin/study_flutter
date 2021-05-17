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

/*
*  // 2.添加第一个拦截器
    Interceptor dInter = InterceptorsWrapper(
//      onRequest: (RequestOptions options,RequestInterceptorHandler handler){
//         print('加载中。。。');
//         return options;
//       },
//      onResponse: (Response response,ResponseInterceptorHandler handler){
//
//        return response;
//      },
//        onRequest: (RequestOptions options) {
//          // 1.在进行任何网络请求的时候, 可以添加一个loading显示
//
//          // 2.很多页面的访问必须要求携带Token,那么就可以在这里判断是有Token
//
//          // 3.对参数进行一些处理,比如序列化处理等
//          print("拦截了请求");
//          return options;
//        },
//        onResponse: (Response response) {
//          print("拦截了响应");
//          return response;
//        },
//        onError: (DioError error) {
//          print("拦截了错误");
//          return error;
//        }
    );
//    var requestOpt =  RequestOptions(path: path,method: method,data: params);
//    dInter.onRequest(requestOpt, RequestInterceptorHandler());
//    dInter.onResponse(Response(requestOptions: requestOpt));
//    List<Interceptor> inters = [dInter];
//    if (inter != null) {
//      inters.add(inter);
//    }
//    dio.interceptors.addAll(inters);
* */

/*
    *
    * RequestOptions({
    String method,//网络请求的方法
    int sendTimeout,//发送的超时时间
    int receiveTimeout,//接受超时时间
    this.connectTimeout,//链接超时的时间
    this.data,//post请求数据时传递的参数
    this.path,//如果是我们用了http或者https开头则会忽略baseUrl的设置，如果没有，则拼接到baseUrl后面
    this.queryParameters,//使用get方法时候的参数拼接
    this.baseUrl,//请求的根网址
    this.onReceiveProgress,//在收到消息时的进度
    this.onSendProgress,//在发送消息时的进度
    this.cancelToken,//可以添加网络取消，网络取消的监听都在这里了
    Map<String, dynamic> extra,//额外的参数配置，可以在返回的数据中获取到
    Map<String, dynamic> headers,//请求头
    ResponseType responseType,//响应类型,可以是json，可以是数据流，可以是json
    String contentType,//设置内容的类型
    ValidateStatus validateStatus,//给设定一个响应码，如果是返回了True则表示请求成功
    bool receiveDataWhenStatusError = true,//是否在Http的响应码是失败的时候接收响应数据
    bool followRedirects = true,//是否可以重定向
    int maxRedirects,//最多可以重定向的次数
    RequestEncoder requestEncoder,//我们可以设置在发送请求时对请求进行编码，默认是utf-8的编码，可以根据需求进行修改
    ResponseDecoder responseDecoder,//当我们接收返回消息时对内容进行解码，默认是utf-8，可以根据需求进行修改
  })
    * */

//    dInter.onRequest(RequestOptions(path: path,method: method,data: params), RequestInterceptorHandler());