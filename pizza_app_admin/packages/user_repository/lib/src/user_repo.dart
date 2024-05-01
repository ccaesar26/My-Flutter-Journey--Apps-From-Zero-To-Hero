import 'models/models.dart';

abstract interface class UserRepository {
  Stream<MyUser?> get user;

  Future<MyUser> signUp({required MyUser user, required String password});

  Future<void> setUserDate(MyUser user);

  Future<void> signIn({required String email, required String password});

  Future<void> logOut();
}