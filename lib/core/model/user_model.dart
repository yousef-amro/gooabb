class UserModel {
  final int id;
  final String? authToken; // Gooabb token
  final String? nourApiKey; // Nour api key

  const UserModel({
    required this.id,
    this.authToken,
    this.nourApiKey,
  });

  /// Gooabb Login
  factory UserModel.fromGooabbLogin(Map<String, dynamic> json) {
    print(json);
    return UserModel(
      id: (json['id'] ?? json['user_id'] as num).toInt(),
      authToken: json['token']?.toString(),
    );
  }

  /// Nour Login
  factory UserModel.fromNourLogin(Map<String, dynamic> json) {
    return UserModel(
      id: (json['user_id'] as num).toInt(),
      nourApiKey: json['api']?.toString(),
    );
  }

  /// للتخزين (SharedPreferences / SecureStorage)
  Map<String, dynamic> toJson() => {
    'id': id,
    'authToken': authToken,
    'nourApiKey': nourApiKey,
  };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: (json['id'] as num).toInt(),
      authToken: json['authToken']?.toString(),
      nourApiKey: json['nourApiKey']?.toString(),
    );
  }

  UserModel copyWith({
    int? id,
    String? authToken,
    String? nourApiKey,
  }) {
    return UserModel(
      id: id ?? this.id,
      authToken: authToken ?? this.authToken,
      nourApiKey: nourApiKey ?? this.nourApiKey,
    );
  }
}
