import 'package:dio/dio.dart';

class NetworkUtils {
  //https://pma.gooabb.com/
  static const String baseUrl = 'https://pma.gooabb.com/nourapi/v1/';
  static Dio? _dio;

  static Future<void> init() async {
    _dio = Dio()
      ..options.baseUrl = baseUrl
      ..options.validateStatus = (status) => true;
  }

  static Future<Response> post({
    required String endpoint,
    required Map<String, dynamic> data,
  }) {
    return NetworkUtils._dio!.post(
      '',
      data: FormData.fromMap({"req": endpoint, ...data}),
    );
  }
}
