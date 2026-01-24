class UserModel {
  final int id;
  final String? authToken; // Gooabb token
  final String? nourApiKey; // Nour api key

  const UserModel({
    required this.id,
    this.authToken,
    this.nourApiKey,
  });

  factory UserModel.fromGooabbLogin(Map<String, dynamic> json) {
    print(json);

    // If backend returned an error payload, don't try to parse it as a user
    if (json['error'] != null || json['code'] == 'error') {
      throw Exception(json['error']?.toString() ?? 'Login failed');
    }

    int? parseInt(dynamic v) {
      if (v == null) return null;
      if (v is int) return v;
      if (v is num) return v.toInt();
      if (v is String) return int.tryParse(v);
      return null;
    }

    final id = parseInt(json['id']) ?? parseInt(json['user_id']);

    if (id == null) {
      throw Exception('Invalid login response: missing id/user_id');
    }

    return UserModel(id: id, authToken: json['token']?.toString());
  }
}
