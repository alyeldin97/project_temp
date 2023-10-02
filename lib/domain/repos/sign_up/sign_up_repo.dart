import 'package:dartz/dartz.dart';
import 'package:project_template/helpers/app_global_data.dart';
import '../../../data/entities/user.dart';
import '../../../data/local/user/user_lds.dart';
import '../../../data/remote/sign_up/sign_up_rds.dart';
import '../../../helpers/failures.dart';
import '../../models/user.dart';

abstract class SignUpRepo {
  Future<Either<Failure, UserModel>> signUp({
    required String firstName,
    required String lastName,
    required String mobileNumber,
    required String email,
    required String password,
    //required String confirmPassword,
  });
}

class SignUpRepoImpl implements SignUpRepo {
  SignUpRemoteDataSource signUpRemoteDataSource;
  UserLocalDataSource userLocalDataSource;

  SignUpRepoImpl(
    this.signUpRemoteDataSource,
    this.userLocalDataSource,
  );

  @override
  Future<Either<Failure, UserModel>> signUp({
    required String firstName,
    required String lastName,
    required String mobileNumber,
    required String email,
    required String password,
    //  required String confirmPassword,
  }) async {
    try {
      UserEntity signUp = await signUpRemoteDataSource.signUp(
        email: email,
        password: password,
        lastName: lastName,
        mobileNumber: mobileNumber,
        firstName: firstName,
      );

      // ignore: non_constant_identifier_names
      UserModel userModel = signUp.toModel();

      await userLocalDataSource.cacheUser(userModel);

      AppGlobalData.CURRENT_USER = userModel;

      return right(userModel);
    } on Failure catch (failure) {
      return left(failure);
    }
  }
}
