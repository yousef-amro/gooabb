import 'package:gooabb/core/model/user_model.dart';
import 'package:gooabb/core/network_utils/network_utils.dart';

class AuthDataSource {
  static Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final result = await NetworkUtils.post(
      endpoint: "GOOABB LOGIN",
      data: {
        "email": email,
        "password": password,
        "session_length": "long",
      },
    );
    return UserModel.fromGooabbLogin(Map.from(result.data));
  }
}
