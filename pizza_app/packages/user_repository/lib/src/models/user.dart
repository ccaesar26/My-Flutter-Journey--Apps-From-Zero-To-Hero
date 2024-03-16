import '../entities/user_entity.dart';

class MyUser {
  String userId;
  String email;
  String name;
  final bool hasActiveCart;

  MyUser(
      {required this.userId,
        required this.email,
        required this.name,
        this.hasActiveCart = false});

  static final empty =
  MyUser(userId: '', email: '', name: '', hasActiveCart: false);

  MyUserEntity toEntity() {
    return MyUserEntity(
        userId: userId, email: email, name: name, hasActiveCart: hasActiveCart);
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
        userId: entity.userId,
        email: entity.email,
        name: entity.name,
        hasActiveCart: entity.hasActiveCart);
  }

  @override
  String toString() {
    return 'MyUser: $userId, $email, $name, $hasActiveCart';
  }
}
