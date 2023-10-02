import '../../../configs/constants/api_urls.dart';
import '../../../configs/constants/json_keys.dart';
import '../../../helpers/api_helper.dart';
import '../../../helpers/failures.dart';
import '../../../helpers/network_error_helper.dart';
import '../../entities/user.dart';

abstract class SignUpRemoteDataSource {
  Future<UserEntity> signUp({
    required String firstName,
    required String lastName,
    required String mobileNumber,
    required String email,
    required String password,
    // required String confirmPassword,
  });
}

class SignUpRemoteDataSourceImpl implements SignUpRemoteDataSource {
  NetworkService networkService;

  SignUpRemoteDataSourceImpl(this.networkService);

  @override
  Future<UserEntity> signUp({
    required String firstName,
    required String lastName,
    required String mobileNumber,
    required String email,
    required String password,
    //  required String confirmPassword,
  }) async {
    try {
      Map<String, dynamic> response =
          await networkService.postRequest(ApiEndPoints.register, {
        JsonKeys.firstName: firstName,
        JsonKeys.lastName: lastName,
        JsonKeys.email: email,
        JsonKeys.phone: mobileNumber,
        JsonKeys.password: password,
      });

      return UserEntity.fromJson(response);
    } on Failure {
      rethrow;
    } catch (exception) {
      throw NetWorkServiceErrorHandler.convertExceptionsToFailure(exception);
    }
  }
}
