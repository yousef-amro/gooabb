import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gooabb/core/network_utils/network_utils.dart';

/// ----------------------------
/// Contracts (Abstract)
/// ----------------------------
abstract class AuthRemoteDataSource {
  Future<GooabbSignupResponse> signup(GooabbSignupRequest request);

  Future<void> confirmEmail({required String confirmationToken});

  Future<GooabbLoginResponse> login({
    required String email,
    required String password,
    String sessionLength = 'long', // long | short
  });

  Future<NourLoginResponse> nourLoginWithToken({
    required String token,
  });
}

/// ----------------------------
/// Implementation
/// ----------------------------
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl();

  @override
  Future<GooabbSignupResponse> signup(
    GooabbSignupRequest request,
  ) async {
    final res = await _postReq(
      req: 'GOOABB SINGUP',
      data: request.toJson(),
    );

    final json = _ensureMap(res.data);
    _throwIfBackendError(json);

    return GooabbSignupResponse.fromJson(json);
  }

  @override
  Future<void> confirmEmail({
    required String confirmationToken,
  }) async {
    final res = await _postReq(
      req: 'CONFIRM MY GOOABB EMAIL',
      data: {'confirmation_token': confirmationToken},
    );

    final json = _ensureMap(res.data);
    _throwIfBackendError(json);

    final status = json['status'];
    if (status != true) {
      throw BackendException(
        reason: json['reason']?.toString(),
        message: json['error']?.toString() ?? 'Confirm email failed',
        raw: json,
      );
    }
  }

  @override
  Future<GooabbLoginResponse> login({
    required String email,
    required String password,
    String sessionLength = 'long',
  }) async {
    final res = await _postReq(
      req: 'GOOABB LOGIN',
      data: {
        'email': email,
        'password': password,
        'session_length': sessionLength,
      },
    );

    final json = _ensureMap(res.data);
    _throwIfBackendError(json);

    // في الـ collection فيه ردّين: مرة status:true ومرة token/user_id بدون status
    return GooabbLoginResponse.fromJson(json);
  }

  @override
  Future<NourLoginResponse> nourLoginWithToken({
    required String token,
  }) async {
    final res = await _postReq(
      req: 'NOUR LOGIN WITH TOKEN',
      data: {'token': token},
    );

    final json = _ensureMap(res.data);
    _throwIfBackendError(json);

    return NourLoginResponse.fromJson(json);
  }

  /// ----------------------------
  /// Helpers
  /// ----------------------------
  Future<Response<dynamic>> _postReq({
    required String req,
    required Map<String, dynamic> data,
  }) {
    // Postman: body = form-data, data = JSON string
    final formData = FormData.fromMap({
      'req': req,
      'data': jsonEncode(data),
    });

    return NetworkUtils.post(
      '', // نفس endpoint {{NourUrl}}
      formData: formData,
      email: '',
      password: '',
    );
  }

  Map<String, dynamic> _ensureMap(dynamic data) {
    if (data is Map<String, dynamic>) return data;
    if (data is String) {
      final decoded = jsonDecode(data);
      if (decoded is Map<String, dynamic>) return decoded;
    }
    throw FormatException(
      'Unexpected response type: ${data.runtimeType}',
    );
  }

  void _throwIfBackendError(Map<String, dynamic> json) {
    // بعض الردود بتكون بالشكل:
    // { "error": "...", "code": "error", ... }
    final code = json['code']?.toString();
    if (code == 'error') {
      throw BackendException(
        reason: json['part']?.toString(),
        message: json['error']?.toString() ?? 'Unknown backend error',
        raw: json,
      );
    }

    // وبعضها:
    // { "status": false, "reason": "...", "error": "..." }
    final status = json['status'];
    if (status is bool && status == false) {
      throw BackendException(
        reason:
            json['reason']?.toString() ?? json['resion']?.toString(),
        message: json['error']?.toString() ?? 'Request failed',
        raw: json,
      );
    }
  }
}

/// ----------------------------
/// Exceptions
/// ----------------------------
class BackendException implements Exception {
  final String? reason;
  final String message;
  final Map<String, dynamic> raw;

  BackendException({
    required this.message,
    this.reason,
    required this.raw,
  });

  @override
  String toString() =>
      'BackendException(reason: $reason, message: $message)';
}

/// ----------------------------
/// DTOs (Requests/Responses)
/// ----------------------------
class GooabbSignupRequest {
  final String email;
  final String gender; // M | F | C
  final String firstName;
  final String lastName;
  final String birthDay; // YYYY-MM-DD
  final String password;

  const GooabbSignupRequest({
    required this.email,
    required this.gender,
    required this.firstName,
    required this.lastName,
    required this.birthDay,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'gender': gender,
    'first_name': firstName,
    'last_name': lastName,
    'birth_day': birthDay,
    'password': password,
  };
}

class GooabbSignupResponse {
  final bool? status;
  final String token; // confirmation token
  final int id;

  const GooabbSignupResponse({
    required this.token,
    required this.id,
    this.status,
  });

  factory GooabbSignupResponse.fromJson(Map<String, dynamic> json) {
    return GooabbSignupResponse(
      status: json['status'] as bool?,
      token: (json['token'] ?? '').toString(),
      id: (json['id'] as num).toInt(),
    );
  }
}

class GooabbLoginResponse {
  final bool? status;
  final String token;
  final int userId;

  const GooabbLoginResponse({
    required this.token,
    required this.userId,
    this.status,
  });

  factory GooabbLoginResponse.fromJson(Map<String, dynamic> json) {
    // بعض الردود بتستخدم id وبعضها user_id
    final idValue = json['id'] ?? json['user_id'];

    return GooabbLoginResponse(
      status: json['status'] as bool?,
      token: (json['token'] ?? '').toString(),
      userId: (idValue as num).toInt(),
    );
  }
}

class NourLoginResponse {
  final String api;
  final int userId;

  const NourLoginResponse({required this.api, required this.userId});

  factory NourLoginResponse.fromJson(Map<String, dynamic> json) {
    return NourLoginResponse(
      api: (json['api'] ?? '').toString(),
      userId: (json['user_id'] as num).toInt(),
    );
  }
}
