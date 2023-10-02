import 'package:project_template/data/remote/sign-in/sign_in_rds.dart';

import '../../../configs/constants/api_urls.dart';
import '../../../configs/constants/json_keys.dart';
import '../../../helpers/api_helper.dart';
import '../../../helpers/failures.dart';
import '../../../helpers/network_error_helper.dart';
import '../../entities/user.dart';

class SignInRemoteDataSourceImpl implements SignInRemoteDataSource {
  NetworkService networkService;

  SignInRemoteDataSourceImpl(this.networkService);

  @override
  Future<UserEntity> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      Map<String, dynamic> response =
          await networkService.postRequest(ApiEndPoints.login, {
        JsonKeys.email: email,
        JsonKeys.password: password,
      });

      return UserEntity.fromJson(response);
    } on Failure {
      rethrow;
    } catch (exception) {
      throw NetWorkServiceErrorHandler.convertExceptionsToFailure(exception);
    }
  }

// @override
// Future<void> sendOtp({required String phoneNumber}) async {
//   try {
//     await networkService.postRequest(ApiEndPoints.sendOtp, {
//       JsonKeys.phone: phoneNumber,
//     });
//   } on Failure {
//     rethrow;
//   } catch (exception) {
//     throw NetWorkServiceErrorHandler.convertExceptionsToFailure(
//         exception as Exception);
//   }
// }
//
// @override
// Future<UserEntity> signInWithOtp({required String otp}) async {
//   try {
//     Map<String, dynamic> response =
//         await networkService.postRequest(ApiEndPoints.loginWithOtp, {
//       JsonKeys.otp: otp,
//     });
//     return UserEntity.fromJson(response[JsonKeys.data]);
//   } on Failure {
//     rethrow;
//   } catch (exception) {
//     throw NetWorkServiceErrorHandler.convertExceptionsToFailure(
//         exception as Exception);
//   }
// }
}
