import '../../entities/user.dart';

abstract class SignInRemoteDataSource {
  Future<UserEntity> signInWithEmailAndPassword(
      {required String email, required String password});

  // Future<void> sendOtp({required String phoneNumber});
  //
  // Future<UserEntity> signInWithOtp({required String otp});
}
