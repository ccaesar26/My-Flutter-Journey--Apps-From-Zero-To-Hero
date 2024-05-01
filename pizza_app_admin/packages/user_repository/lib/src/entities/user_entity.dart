class MyUserEntity {
  final String userId;
  final String email;
  final String name;
  final bool hasActiveCart;

  MyUserEntity(
      {required this.userId,
      required this.email,
      required this.name,
      this.hasActiveCart = false});

  @override
  int get hashCode =>
      userId.hashCode ^ email.hashCode ^ name.hashCode ^ hasActiveCart.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyUserEntity &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          email == other.email &&
          name == other.name &&
          hasActiveCart == other.hasActiveCart;

  Map<String, Object?> toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'hasActiveCart': hasActiveCart,
    };
  }

  static MyUserEntity fromJson(Map<String, dynamic> json) {
    return MyUserEntity(
      userId: json['userId'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      hasActiveCart: json['hasActiveCart'] as bool,
    );
  }

  @override
  String toString() {
    return 'MyUserEntity: $userId, $email, $name, $hasActiveCart';
  }
}