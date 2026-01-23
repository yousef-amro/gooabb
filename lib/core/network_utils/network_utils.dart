import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NetworkUtils {
  //https://pma.gooabb.com/
  static const String baseUrl = 'https://pma.gooabb.com/nourapi/v1/';
  static Dio? _dio;

  static Future<void> init() async {
    _dio = Dio()
      ..options.baseUrl = baseUrl
      ..options.validateStatus = (status) => true;
  }

  static Future<Response> post(
    String s, {
    required String email,
    required String password,
    required FormData formData,
  }) {
    return NetworkUtils._dio!.post(
      '',
      data: FormData.fromMap({
        'req': 'GOOABB LOGIN',
        'data': jsonEncode({
          'email': email,
          'password': password,
          'session_length': 'long',
        }),
      }),
    );
  }
}
