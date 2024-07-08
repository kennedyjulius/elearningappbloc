import 'package:dio/dio.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() => _instance;

  late Dio dio;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: "http://127.0.0.1:8000",
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
      headers: {},
      contentType: "application/json; charset=utf-8",
      responseType: ResponseType.json,
    );

    dio = Dio(options);
  }

  Future<Response> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response = await dio.post(
        path,
        queryParameters: queryParameters,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      print('Error in post request: $e');
      rethrow;
    }
  }
}
